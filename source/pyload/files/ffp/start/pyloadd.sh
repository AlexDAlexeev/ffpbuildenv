#!/ffp/bin/sh

# PROVIDES: pyload

. /ffp/etc/ffp.subr

RTORRENT_RC=/ffp/etc/rtorrent.rc
RTORRENT_TMP=/ffp/tmp/rtorrent
RTORRENT_SOCKET=$RTORRENT_TMP/rpc.socket

name="pyload"
start_cmd="pyload_start"
stop_cmd="pyload_stop"

pyload_start()
{
	cd /ffp/share/pyload/
	python pyLoadCore.py --daemon --configdir=/ffp/etc/pyload
}

pyload_stop()
{
	echo "Stopping $name" 
	cd /ffp/share/pyload/
	kill -9 `python pyLoadCore.py --configdir=/ffp/etc/pyload --status`
}

run_rc_command "$1"
