#!/bin/bash

##############################################################################
# Setting up compute node
##############################################################################
# You have to set these by hand
export CONTROLLER_FQDN=aku.se.lemche.net
 export VAULT_USER_PASS=NxVKEDOsdAMDWEu4hGHV17hCfbo89t1x

echo $VAULT_USER_PASS > ~/.VAULT_USER_PASS

# Create variables with infrastructure configuration
export ETCDCTL_ENDPOINTS="http://${CONTROLLER_FQDN}:2379"
for key in $(etcdctl ls variables/ | sed 's|^/variables/||'); do
	export eval $key="$(etcdctl get variables/$key)"
done

# Get list of CA certifiates
CA_CERTIFICATES=$(curl \
  --silent \
	http://${SSL_ROOT_CA_FQDN}/ \
| html2text \
| grep .crt \
| awk '{print $3}')

# Download each CA certificate
for ca_certificate in $CA_CERTIFICATES; do
	sudo curl \
	  --output /usr/local/share/ca-certificates/${ca_certificate} \
		--silent \
	  http://${SSL_ROOT_CA_FQDN}/${ca_certificate}
done

# Install CA certifiates
sudo update-ca-certificates

# Create variables with secrets
export VAULT_ADDR="https://${CONTROLLER_FQDN}:8200"
vault login -method=userpass username=user password=${VAULT_USER_PASS}
for secret in $(vault kv list -format yaml passwords/ | sed 's/^-\s//'); do
	export eval $secret="$(vault kv get -field=value passwords/$secret)"
done

vault kv get --field=data keystores/${COMPUTE_FQDN}.p12 \
| tr -d '\n' \
| base64 --decode \
> ${COMPUTE_FQDN}.p12

openssl pkcs12 \
  -in ${COMPUTE_FQDN}.p12 \
  -passin pass:${COMPUTE_KEYSTORE_PASS} \
  -nokeys \
| sudo tee /etc/ssl/certs/${COMPUTE_FQDN}.crt

openssl pkcs12 \
  -in ${COMPUTE_FQDN}.p12 \
  -passin pass:${COMPUTE_KEYSTORE_PASS} \
  -nocerts \
  -nodes \
| sudo tee /etc/ssl/private/${COMPUTE_FQDN}.key
