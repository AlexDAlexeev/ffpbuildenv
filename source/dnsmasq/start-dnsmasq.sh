#!/ffp/bin/sh

# PROVIDE: dnsmasq
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="dnsmasq"
command="/ffp/sbin/$name"
dnsmasq_flags=" --log-facility=/ffp/var/log/dnsmasq.log"

run_rc_command "$1"

