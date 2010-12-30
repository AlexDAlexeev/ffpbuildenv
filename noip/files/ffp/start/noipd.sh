#!/ffp/bin/sh

# PROVIDE: noipd
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="nopd"
command="/ffp/bin/noip2"
required_files=
noip_flags=
start_cmd="noip_start"

noip_start()
{
	if [ ! -r /ffp/etc/no-ip2.conf ]; then
		echo "/ffp/etc/no-ip2.conf not found!! You have to create it first!!!"
		$command -C
	else
		$command
	fi
}

run_rc_command "$1"
