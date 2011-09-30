make \
  DESTDIR=$D \
  PREFIX=$D$CPREFIX \
  CONFDIR=$D$CPREFIX/etc/munin \
  DBDIR=$D$CPREFIX/var/munin \
  STATEDIR=$D$CPREFIX/var/run/munin \
  MANDIR=$D$CPREFIX/share/man \
  LOGDIR=$D$CPREFIX/var/log/munin \
  LIBDIR=$D$CPREFIX/share/munin \
  install-common-prime install-node-prime install-plugins-prime
 
sed -i -e 's%/usr/bin/perl%/ffp/bin/perl%' $D/$CPREFIX/sbin/*
