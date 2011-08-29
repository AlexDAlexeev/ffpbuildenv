if [ -d $WORKDIR/trunk ]; then
	mv $WORKDIR/trunk  $WORKDIR/$P
fi
cp $X/config.mk $WORKDIR/$P/
cp $X/depend.mk $WORKDIR/$P/
