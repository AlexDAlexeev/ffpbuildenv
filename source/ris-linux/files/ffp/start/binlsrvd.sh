#!/ffp/bin/sh

# PROVIDES: binlsrv

. /ffp/etc/ffp.subr

name="binlsrv"
start_cmd="binlsrv_start"
stop_cmd="binlsrv_stop"

binlsrv_start()
{
	cd /ffp/share/ris-linux-0.4/
	python binlsrv.py --daemon --logfile=/ffp/var/log/binlsrv.log -p 4012 /mnt/HD_a2/tftp/devlist.cache
	#--pid=/ffp/var/run/binlsrv.pid
}
	
binlsrv_stop()
{
	echo "Stopping $name" 
	kill -9 `cat /ffp/var/run/binlsrv.pid`

}
					
run_rc_command "$1"
					
