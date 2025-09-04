#!/bin/sh

cat > /etc/ppp/peers/${TUNNEL} <<_EOF_
pty "pptp ${SERVER} --nolaunchpppd"
name "${USERNAME}"
password "${PASSWORD}"
remotename PPTP
require-mppe-128
file /etc/ppp/options.pptp
ipparam "${TUNNEL}"
usepeerdns
_EOF_

exec pon ${TUNNEL} debug dump logfd 2 nodetach persist "$@"
