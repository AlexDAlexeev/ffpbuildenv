make INSTALL_HDR_PATH=$D$CPREFIX headers_install

cp -an arch/arm/include/asm $D$CPREFIX/include/asm
cd include
cp -an linux scsi sound asm-generic $D$CPREFIX/include

cd $D
chown -R root:root *

