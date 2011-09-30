mkdir -p $D/ffp/start
install -m 0644 $X/munin-node.sh $D/ffp/start/munin-node.sh
mkdir -p $D/ffp/etc/munin
install -m 0644 $X/munin.conf $D/ffp/etc/munin/munin.conf
install -m 0644 $X/munin-node.conf $D/ffp/etc/munin/munin-node.conf