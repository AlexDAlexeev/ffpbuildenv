sed -i \
-e "/^INSTALL/ s@/usr/bin/install@install@" \
-e "/^SYSCONFDIR/ s@/etc@${CSYSCONFDIR}@" \
-e "/^SYSTEMD_DIR/ s@/lib@${CPREFIX}/lib@" \
-e "/^RUN_DIR/ s@/run/mdadm@/dev/.mdadm@" \
-e "/^CXFLAGS/ s@-ggdb@-I/ffp/include/ -ggdb@" \
Makefile
           
