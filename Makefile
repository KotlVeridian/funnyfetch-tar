PREFIX = /usr
MANDIR = $(PREFIX)/share/man

all:
	@echo Run \'make install\' to install funnyfetch.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p funnyfetch $(DESTDIR)$(PREFIX)/bin/funnyfetch
	@cp -p funnyfetch.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/funnyfetch

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/funnyfetch
	@rm -rf $(DESTDIR)$(MANDIR)/man1/funnyfetch.1*
