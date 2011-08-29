#!/ffp/bin/sh

# PROVIDE: atftpd

. /ffp/etc/ffp.subr

name="in.tftpd"
start_cmd="intftpd_start"
stop_cmd="intftpd_stop"
restart_cmd="intftpd_restart"
status_cmd="intftpd_status"

atftpd_share="/mnt/HD_a2/tftp" #Change this if you want an other directory to be shared
atftpd_port="69" 	   #Change this if you want to run atftpd on an other port
atftpd_user="root"
atftpd_group="501"

intftpd_start() {
        echo -e "Starting in.tftp daemon...\nShared directory is $atftpd_share"
	/ffp/sbin/in.tftpd -l -s -vvv  /mnt/HD_a2/tftp/
}
intftpd_stop() {
	echo "Stopping in.tftp daemon..."
	kill -9 `pidof in.tftpd`  
}

intftpd_restart() {
	_pids=$(pidof $name)
        if test -n "$_pids"; then
                run_rc_command "stop"
        else
                echo  -e "$name not running, but will be started now."
        fi
	
	run_rc_command "start"
}

intftpd_status() {
	_pids=$(pidof $name)
	if test -n "$_pids"; then
  		echo -e "$name is running."
	else
  		echo  -e "$name not running."
 	fi
}

run_rc_command "$1"
