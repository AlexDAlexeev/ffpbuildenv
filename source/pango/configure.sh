export CAIRO_CFLAGS="-I/ffp/include/cairo -I/ffp/include/freetype2 -I/ffp/include -I/ffp/include/libpng12"
export CAIRO_LIBS="-L/ffp/lib -lcairo"
./configure --prefix=$CPREFIX  
