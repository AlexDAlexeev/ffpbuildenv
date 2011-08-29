rm -rf $WORKDIR/$P/scripts/{libtool,lt*}.m4
export CFLAGS=" -mcpu=xscale -mtune=xscale"
export CXXFLAGS=" -mcpu=xscale -mtune=xscale"
./autogen.sh --libdir=$CPREFIX/lib --prefix=$CPREFIX
./configure --libdir=$CPREFIX/lib --prefix=$CPREFIX --with-xmlrpc-c
