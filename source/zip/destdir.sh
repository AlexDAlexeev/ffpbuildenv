#env prefix=$CPREFIX make -f unix/Makefile install
mkdir -p $D/$CPREFIX/bin
mkdir -p $D/$CPREFIX/man
cp zip $D/$CPREFIX/bin/
chmod a+x $D/$CPREFIX/bin/zip
cp man/zip.1 $D/$CPREFIX/man/
cp man/zipcloak.1 $D/$CPREFIX/man/
cp man/zipnote.1 $D/$CPREFIX/man/
cp man/zipsplit.1 $D/$CPREFIX/man/
