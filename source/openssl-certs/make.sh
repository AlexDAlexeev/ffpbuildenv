mkdir -p ${D}/ffp/bin

def()
{
  SCRIPTNAME=$(basename "$1")
  install -m 0755 -o root -g root $1 ${D}/ffp/bin/${SCRIPTNAME}
}

def ${FILESDIR}/make-cert.pl
def ${FILESDIR}/make-ca.sh
def ${FILESDIR}/remove-expired-certs.sh

SSLDIR=${D}/ffp/etc/ssl
CERTHOST='http://mxr.mozilla.org'
CERTDIR='/mozilla/source/security/nss/lib/ckfw/builtins'
URL="${CERTHOST}${CERTDIR}/certdata.txt?raw=1"

mkdir -p ${SSLDIR}
wget -q --output-document certdata.txt ${URL}
unset certhost certdir URL
sh ${FILESDIR}/make-ca.sh
sh ${FILESDIR}/remove-expired-certs.sh certs

install -d ${SSLDIR}/certs
install -m 0644 -o root -g root certs/*.pem ${SSLDIR}/certs

command -v c_rehash &>/dev/null || echo "OpenSSL required" exit 1;
c_rehash ${SSLDIR}/certs
install -m 0644 -o root -g root BLFS-ca-bundle*.crt ${SSLDIR}/ca-bundle.crt
