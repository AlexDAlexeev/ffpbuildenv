#!/ffp/bin/sh

# PROVIDES: amuled

. /ffp/etc/ffp.subr

PID_FILE=/ffp/var/run/amuled.pid
AMULEWEB=/ffp/bin/amuleweb
CONFIG_DIR=/ffp/share/amule/config
LOCK=$CONFIG_DIR/muleLock

name="amuled"
command="/ffp/bin/$name"
commandline="--config-dir=$CONFIG_DIR --pid-file=$PID_FILE --use-amuleweb=$AMULEWEB --log-stdout"
start_cmd="amuled_start"
stop_cmd="amuled_stop"
user=nobody

amuled_start()
{
        test -x /ffp/bin/screen || ( echo "screen not found." | exit 2 )
        test -x /ffp/bin/su -o -x /bin/su || ( echo "su not found." | exit 2 )

        if [ ! -f ${LOCK} ] ; then
                echo "Removing old lock ${LOCK}"
                rm -rf ${LOCK}
        fi
        echo "Starting $name"

        stty stop undef && stty start undef
        screen -d -m su -c "${command} ${commandline}" ${user}
}

amuled_stop()
{
        echo "Stopping $name"
        killall $name
}

run_rc_command "$1"