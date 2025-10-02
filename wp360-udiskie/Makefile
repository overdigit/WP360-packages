prefix = /usr/local

all:

install:
	install -d $(DESTDIR)/etc
	install -d $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install -d $(DESTDIR)$(prefix)/lib/systemd/system
	install etc/udiskie.yml $(DESTDIR)/etc
	install usr/share/polkit-1/rules.d/50-udiskie.rules  $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install usr/lib/systemd/system/wp360-udiskie.service $(DESTDIR)$(prefix)/lib/systemd/system

.PHONY: all install
