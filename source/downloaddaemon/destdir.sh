make DESTDIR=$D install
mkdir $D/$CPREFIX/start
mv $D/etc/init.d/downloadd $D/$CPREFIX/start/downloadd
rmdir $D/etc/init.d
mv $D/etc $D/$CPREFIX/
