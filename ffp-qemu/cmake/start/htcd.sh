#!/ffp/bin/sh

# PROVIDE: htcd
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="htcd"
command="/ffp/bin/htc"
required_files="/ffp/etc/htc.conf"
htcd_flags=

start_cmd="htcd_start"

htcd_start()
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
	if [ -n "$timeout" ]; then
		command="$command --timeout=$timeout"
	fi
	if [ -n "$strictcontentlength" ]; then
		command="$command --strict-content-length=$strictcontentlength"
	fi
	if [ -n "$proxy" ]; then
		command="$command --proxy=$proxy"
	fi
	if [ -n "$proxyauthorization" ]; then
		command="$command --proxy-authorization=$proxyauthorization"
	fi
	if [ -n "$proxyauthorizationfile" ]; then
		command="$command --proxy-authorization-file=$proxyauthorizationfile"
	fi
	if [ -n "$proxybuffersize" ]; then
		command="$command --proxy-buffer-size=$proxybuffersize"
	fi	
	if [ -n "$useragent" ]; then
		command="$command --user-agent=$useragent"
	fi
	if [ -n "$host" ]; then
		command="$command $host"
	fi
	${command} 
}

run_rc_command "$1"
