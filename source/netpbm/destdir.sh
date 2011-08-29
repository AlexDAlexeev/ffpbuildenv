make package pkgdir=$TMPDIR/$CPREFIX
mkdir $D/$CPREFIX
cp -R $TMPDIR/$CPREFIX/bin $D/$CPREFIX/
cp -R $TMPDIR/$CPREFIX/include $D/$CPREFIX/
cp -R $TMPDIR/$CPREFIX/lib $D/$CPREFIX/
cp -R $TMPDIR/$CPREFIX/man $D/$CPREFIX/
