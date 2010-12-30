#!/ffp/bin/sh

# PROVIDE: htsd
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="htsd"
command="/ffp/bin/hts"
required_files="/ffp/etc/hts.conf"
htsd_flags=

start_cmd="htsd_start"

htsd_start()
{
	. ${required_files}
	
	if [ -n "$debug" ]; then
		command="$command --debug=$debug"
	fi
	if [ -n "$device" ]; then
		command="$command --device=$device"
	fi
	if [ -n "$contentlength" ]; then
		command="$command --content-length=$contentlength"
	fi
	if [ -n "$forwardport" ]; then
		command="$command --forward-port=$forwardport"
	fi
	if [ -n "$logfile" ]; then
		command="$command --logfile=$logfile"
	fi
	if [ -n "$keepalive" ]; then
		command="$command --keep-alive=$keepalive"
	fi
	if [ -n "$stdinstdout" ]; then
		command="$command --stdin-stdout=$stdinstdout"
	fi
	if [ -n "$maxconnectionage" ]; then
		command="$command --max-connection-age=$maxconnectionage"
	fi
	if [ -n "$pidfile" ]; then
		command="$command --pid-file=$pidfile"
	fi
	if [ -n "$strictcontentlength" ]; then
		command="$command --strict-content-length=$strictcontentlength"
	fi
	if [ -n "$port" ]; then
		command="$command $port"
	fi
	${command} 
}

run_rc_command "$1"
