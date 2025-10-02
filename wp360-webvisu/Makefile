prefix = /usr/local

all:

install:
	install -d $(DESTDIR)/etc/sway/config.d/
	install -d $(DESTDIR)$(prefix)/lib/systemd/system/codesyscontrol.service.d
	install -d $(DESTDIR)$(prefix)/lib/systemd/system/getty@tty1.service.d
	install -d $(DESTDIR)$(prefix)/lib/systemd/user
	install etc/sway/config.d/51-systemd-user-target.conf $(DESTDIR)/etc/sway/config.d
	install usr/lib/systemd/system/codesyscontrol.service.d/10-codesys-user-target.conf $(DESTDIR)$(prefix)/lib/systemd/system/codesyscontrol.service.d
	install usr/lib/systemd/system/getty@tty1.service.d/autologin.conf $(DESTDIR)$(prefix)/lib/systemd/system/getty@tty1.service.d
	install usr/lib/systemd/user/codesys.target $(DESTDIR)$(prefix)/lib/systemd/user
	install usr/lib/systemd/user/sway.service $(DESTDIR)$(prefix)/lib/systemd/user
	install usr/lib/systemd/user/sway-session.target $(DESTDIR)$(prefix)/lib/systemd/user
	install usr/lib/systemd/user/webvisu.service $(DESTDIR)$(prefix)/lib/systemd/user

.PHONY: all install
