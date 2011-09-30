#!/ffp/bin/sh

# PROVIDE: munin-node
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="munin-node"
command="/ffp/sbin/munin-node"
required_files="/ffp/etc/munin/munin-node.conf"
muninnode_flags=

start_cmd="/ffp/bin/perl -T /ffp/sbin/munin-node"
stop_cmd="kill -9 `cat /ffp/var/run/munin/munin-node.pid`"
run_rc_command "$1"
