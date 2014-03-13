make mrproper
zcat /proc/config.gz > .config
make oldconfig
make prepare
make scripts
