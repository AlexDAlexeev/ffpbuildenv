sed -i -e 's%#am__append_19 = -lm%am__append_19 = -lm%' $WORKDIR/$P/src/Makefile
sed -i -e 's%#am__append_12 = -lm%am__append_12 = -lm%' $WORKDIR/$P/src/Makefile
sed -i -e 's%#am__append_21 = -lm%am__append_21 = -lm%' $WORKDIR/$P/src/Makefile
make
