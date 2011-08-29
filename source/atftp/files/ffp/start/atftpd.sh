#!/ffp/bin/sh

# PROVIDE: atftpd

. /ffp/etc/ffp.subr

name="atftpd"
start_cmd="atftpd_start"
stop_cmd="atftpd_stop"
restart_cmd="atftpd_restart"
status_cmd="atftpd_status"

atftpd_share="/mnt/HD_a2/tftp" #Change this if you want an other directory to be shared
atftpd_port="69" 	   #Change this if you want to run atftpd on an other port
atftpd_user="nobody"
atftpd_group="501"

atftpd_start() {
        echo -e "Starting atftp daemon...\nShared directory is $atftpd_share"
        /ffp/sbin/atftpd --daemon --logfile /ffp/var/log/atftp.log --port $atftpd_port --user $atftpd_user --group $atftpd_group $atftpd_share
}
atftpd_stop() {
	echo "Stopping atftp daemon..."
	kill -9 `pidof atftpd`  
}

atftpd_restart() {
	_pids=$(pidof $name)
        if test -n "$_pids"; then
                run_rc_command "stop"
        else
                echo  -e "$name not running, but will be started now."
        fi
	
	run_rc_command "start"
}

atftpd_status() {
	_pids=$(pidof $name)
	if test -n "$_pids"; then
  		echo -e "$name is running."
	else
  		echo  -e "$name not running."
 	fi
}

run_rc_command "$1"
