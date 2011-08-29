export PKG_CONFIG_PATH=$CPREFIX/lib/pkgconfig
export CFLAGS="-O0 -pipe -msoft-float"
./configure --prefix=$CPREFIX --disable-tcl --disable-python --disable-lua --disable-ruby --disable-libdbi 
