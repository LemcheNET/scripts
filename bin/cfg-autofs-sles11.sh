#!/bin/sh
cat > /etc/auto.master << EOF
#
# Sample auto.master file
# This is an automounter map and it has the following format
# key [ -mount-options-separated-by-comma ] location
# For details of the format look at autofs(5).
#
#/misc  /etc/auto.misc
#
# NOTE: mounts done from a hosts map will be mounted with the
#       "nosuid" and "nodev" options unless the "suid" and "dev"
#       options are explicitly given.
#
#/net	-hosts
/net	/etc/auto.nfs4
#
# Include central master map if it can be found using
# nsswitch sources.
#
# Note that if there are entries for /net or /misc (as
# above) in the included master map any keys that are the
# same will not be seen as the first read key seen takes
# precedence.
#
+auto.master
EOF

cat > /etc/auto.nfs4 << EOF
main    -fstype=nfs4    main:/
files   -fstype=nfs4    files:/
EOF

service autofs restart
