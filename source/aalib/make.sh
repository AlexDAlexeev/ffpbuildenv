sed -i -e 's%LINK = $(LIBTOOL) --mode=link $(CC) $(CFLAGS) $(LDFLAGS) -o $@%LINK = $(LIBTOOL) --mode=link distcc $(CFLAGS) $(LDFLAGS) -o $@%' Makefile

sed -i -e 's%$(mkinstalldirs) $(libdir)%$(mkinstalldirs) $(DESTDIR)$(libdir)%' Makefile
sed -i -e 's%$(mkinstalldirs) $(bindir)%$(mkinstalldirs) $(DESTDIR)$(bindir)%' Makefile
sed -i -e 's%$(mkinstalldirs) $(infodir)%$(mkinstalldirs) $(DESTDIR)$(infodir)%' Makefile
sed -i -e 's%echo " $(INSTALL_DATA) $$d/$$ifile $(infodir)/$$ifile";%echo " $(INSTALL_DATA) $$d/$$ifile $(DESTDIR)$(infodir)/$$ifile";%' Makefile
sed -i -e 's%$(INSTALL_DATA) $$d/$$ifile $(infodir)/$$ifile;%$(INSTALL_DATA) $$d/$$ifile $(DESTDIR)$(infodir)/$$ifile;%' Makefile
sed -i -e 's%echo " install-info --info-dir=$(infodir) $(infodir)/$$file";%echo " install-info --info-dir=$(infodir) $(DESTDIR)$(infodir)/$$file";%' Makefile
sed -i -e 's%install-info --info-dir=$(infodir) $(infodir)/$$file || :;%install-info --info-dir=$(infodir) $(DESTDIR)$(infodir)/$$file || :;%' Makefile
sed -i -e 's%$(mkinstalldirs) $(includedir)%$(mkinstalldirs) $(DESTDIR)$(includedir)%' Makefile
sed -i -e 's%$(INSTALL_DATA) $(srcdir)/$$p $(includedir)/$$p;%$(INSTALL_DATA) $(srcdir)/$$p $(DESTDIR)$(includedir)/$$p;%' Makefile
sed -i -e 's%echo " $(INSTALL_DATA) $(srcdir)/$$p $(includedir)/$$p";%echo " $(INSTALL_DATA) $(srcdir)/$$p $(DESTDIR)$(includedir)/$$p"; %' Makefile
sed -i -e 's%$(mkinstalldirs)  $(libdir) $(bindir) $(infodir) $(includedir)%$(mkinstalldirs)  $(DESTDIR)$(libdir) $(DESTDIR)$(bindir) $(DESTDIR)$(infodir) $(DESTDIR)$(includedir)%' Makefile

sed -i -e 's%echo "$(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(libdir)/$$p"; \\%echo "$(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(libdir)/$$p"; \\%' Makefile
sed -i -e 's%$(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(libdir)/$$p; \\%$(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(libdir)/$$p; \\%' Makefile

sed -i -e 's%echo " $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(bindir)/`echo $$p|sed '\''$(transform)'\''`"; \\%echo " $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed '\''$(transform)'\''`"; \\%' Makefile
sed -i -e 's%$(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(bindir)/`echo $$p|sed '\''$(transform)'\''`; \\%$(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed '\''$(transform)'\''`; \\%' Makefile

make
