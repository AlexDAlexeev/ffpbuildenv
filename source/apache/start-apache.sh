#!/ffp/bin/sh

# PROVIDE: httpd
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="apache"
command="/ffp/bin/apachectl"
apache_flags="-f /ffp/etc/httpd/httpd.conf -E /srv/www/logs/error_log"
required_files="/ffp/etc/httpd/httpd.conf"

start_cmd="apache_start"
stop_cmd="apache_stop"
restart_cmd="apache_restart"
status_cmd="apache_status"

apache_start()
{
  apachectl -k start $apache_flags
}

apache_stop()
{
  apachectl -k graceful-stop $apache_flags
}

apache_restart()
{
  apachectl -k graceful $apache_flags
}

apache_status()
{
  proc_status httpd
}

run_rc_command "$1"
