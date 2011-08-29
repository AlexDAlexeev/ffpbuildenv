#!/ffp/bin/sh

# PROVIDES: rtorrent

. /ffp/etc/ffp.subr

RTORRENT_RC=/ffp/etc/rtorrent.rc
RTORRENT_TMP=/ffp/tmp/rtorrent
RTORRENT_SOCKET=$RTORRENT_TMP/rpc.socket

name="rtorrent"
command="/ffp/bin/$name"
commandline=" -n -o import=$RTORRENT_RC"
start_cmd="rtorrent_start"
stop_cmd="rtorrent_stop"
user=nobody

rtorrent_start()
{
	test -x /ffp/bin/screen || ( echo "screen not found." | exit 2 )
	test -x /ffp/bin/su -o -x /bin/su || ( echo "su not found." | exit 2 )

	if [ ! -f ${RTORRENT_SOCKET} ] ; then
		echo "Removing old socket ${RTORRENT_SOCKET}"
		rm -rf ${RTORRENT_SOCKET}
	fi
	if [ ! -d ${RTORRENT_TMP} ] ; then
		echo "Creating temp dir ${RTORRENT_TMP}"
		mkdir $RTORRENT_TMP
	fi
	chown ${user} $RTORRENT_TMP
	echo "Starting $name"
	
	stty stop undef && stty start undef
 	screen -d -m su -c "${command} ${commandline}" ${user}
}

rtorrent_stop()
{
	echo "Stopping $name" 
	killall $name
}

run_rc_command "$1"
