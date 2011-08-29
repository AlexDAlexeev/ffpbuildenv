#!/ffp/bin/sh

# PROVIDE: noipd
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="nopd"
command="/ffp/bin/noip2"
required_files="/ffp/etc/noip2.conf"
noip_flags=
start_cmd="noip_start"

noip_start()
{
	if [ ! -r ${required_files} ]; then
		echo "${required_files} not found!! You have to create it first!!!"
		$command -C
	else
		$command -c ${required_files} -d &> /ffp/var/log/noip2.log 
	fi
}

run_rc_command "$1"
