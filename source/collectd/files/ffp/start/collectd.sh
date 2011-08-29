#!/ffp/bin/sh

# PROVIDES: pyload

. /ffp/etc/ffp.subr

name="collectd"
start_cmd="collectd_start"
stop_cmd="collectd_stop"

collectd_start()
{
	touch /ffp/var/run/collectd.pid
	chown nobody:501 /ffp/var/run/collectd.pid
	if [ ! -f /ffp/var/log/collectd.log ] ; then
		touch /ffp/var/log/collectd.log
		chown nobody:501 /ffp/var/log/collectd.log
	fi
	su - nobody -c "/ffp/sbin/collectd "
}
			
collectd_stop()
{
	echo "Stopping $name" 
	kill -9 `cat /ffp/var/run/collectd.pid`
}
											
											run_rc_command "$1"
