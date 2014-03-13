gnulib-tool --import argz rpmatch
./bootstrap
./configure LIBS=-liconv ssbindir=$CPREFIX/sbin \
  --prefix=$CPREFIX \
  --enable-shared --disable-static
