mkdir -p $D$CPREFIX/bin
#cd $X/
install -m 0755 -o root -g root $WORKDIR/$P/src/umurmurd $D$CPREFIX/bin
mkdir -p $D$CPREFIX/etc
install -m 0755 -o root -g root $WORKDIR/$P/umurmur.conf.example $D$CPREFIX/etc
