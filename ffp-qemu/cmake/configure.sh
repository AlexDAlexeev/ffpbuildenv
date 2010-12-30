export CC="distcc gcc"
export CXX="g++"
echo $CC
echo $CXX
./configure --prefix=/ffp --docdir=/share/doc --verbose  --no-qt-gui   
