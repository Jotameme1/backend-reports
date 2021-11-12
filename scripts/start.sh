#!/bin/bash

print () {
  echo "$1[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] $2"
}

print "[INFO]" "Comprobando variables de entorno"

## Variables de entorno
print "[INFO]" "ENVIRONMENT             : ${ENVIRONMENT}"
print "[INFO]" "APP_NAME                : ${APP_NAME}"

print "[INFO]" "Generando Variables de Entorno"
printenv | sed 's/^\(.*\)$/export \1/g' > /env.sh
sed -Ei "s/(.*)=(.*)/\1=\'\2\'/g" /env.sh
chmod +x /env.sh

cat > /opt/report/__init__.py <<EOF
""" Esto es la config de vars de environment """
import os

#CONFIG
environment = '${ENVIRONMENT}'
app_name =  '${APP_NAME}'
EOF


if [[ "$ENVIRONMENT" == "production" ]]; then
sed -i 's/#//g' /var/spool/cron/crontabs/root
fi

#Apply crontabs
/usr/bin/crontab /var/spool/cron/crontabs/root

# Start supervisord and services
/usr/bin/supervisord -n -c /etc/supervisord.conf
