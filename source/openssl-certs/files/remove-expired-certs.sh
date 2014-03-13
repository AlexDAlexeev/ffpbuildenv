#!/ffp/bin/bash
# Begin /bin/remove-expired-certs.sh

OPENSSL=/ffp/bin/openssl
DIR=/ffp/etc/ssl/certs

if [ $# -gt 0 ]; then
  DIR="$1"
fi

certs=$( find ${DIR} -type f -name "*.pem" -o -name "*.crt" )
today=$( date +%Y%m%d )

OLDIFS="$IFS"
IFS=$'\n'
for cert in $certs; do
  notafter=$( $OPENSSL x509 -enddate -in "${cert}" -noout )
  date=$( echo ${notafter} |  sed 's/^notAfter=//' )

  if [ $( date -d "${date}" +%Y%m%d ) -lt ${today} ]; then
     echo "${cert} has expired on ${date}! Removing..."
     rm -f "${cert}"
  fi
done
IFS=${OLDIFS}
