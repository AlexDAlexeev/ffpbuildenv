mkdir -p $D$CPREFIX/share/slimrat
cp -R $WORKDIR/$P/src/* $D$CPREFIX/share/slimrat/
mkdir -p $D$CPREFIX/etc/slimrat
cp $WORKDIR/$P/proxies $D$CPREFIX/etc/slimrat/
cp $WORKDIR/$P/queue $D$CPREFIX/etc/slimrat/
#cp $WORKDIR/$P/slimrat.conf $D$CPREFIX/etc/slimrat/
