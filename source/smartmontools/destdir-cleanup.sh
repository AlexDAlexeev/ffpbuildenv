cd $D$CPREFIX
rm -rf share/doc
rm -rf etc/rc.d

mkdir -p $D$CPREFIX/start
install -m 0644 -o root -g root $X/smartd.sh $D$CPREFIX/start
