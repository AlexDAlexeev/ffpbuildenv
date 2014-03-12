#!/ffp/bin/sh

# PROVIDE: minidlna
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="minidlna"
command="/ffp/sbin/minidlnad"
restart_cmd="minidlna_restart"
start_cmd="minidlna_start"
stop_cmd="minidlna_stop"

minidlna_flags="-v -f /ffp/etc/minidlna.conf"

rebuild_db=$2

minidlna_start()
{  
   if [ ! -d /ffp/var/minidlna ]; then
      mkdir -p /ffp/var/minidlna
   fi
   
   if [ ! -d /ffp/var/log/minidlna ]; then
      mkdir -p /ffp/var/log/minidlna
   fi
   
	if [ "x$rebuild_db" == "xr" ]; then
	    echo "Rebuilding minidlna database"
	    minidlna_flags="${minidlna_flags} -R"
	fi
	echo "Running ${command} ${minidlna_flags}"
	${command} ${minidlna_flags}
}

minidlna_stop()
{
	killall minidlnad
}

minidlna_restart()
{
	killall minidlnad
	sleep 3
	${command} ${minidlna_flags}
}

run_rc_command "$1"

