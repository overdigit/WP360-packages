prefix = /usr

all:

install:
	install -d $(DESTDIR)$(prefix)/lib/systemd/system/codesyscontrol-service.d
	install -d $(DESTDIR)$(prefix)/sbin
	install -d $(DESTDIR)$(prefix)/share/initramfs-tools/hooks
	install -d $(DESTDIR)$(prefix)/share/initramfs-tools/scripts/init-bottom
	install usr/lib/systemd/system/wp360-ups-ctrl.service $(DESTDIR)$(prefix)/lib/systemd/system
	install usr/lib/systemd/system/codesyscontrol.service.d/gpio24.conf $(DESTDIR)$(prefix)/lib/systemd/system/codesyscontrol-service.d/
	install usr/sbin/wp360-ups-ctrl $(DESTDIR)$(prefix)/sbin
	install usr/share/initramfs-tools/hooks/gpio $(DESTDIR)$(prefix)/share/initramfs-tools/hooks
	install usr/share/initramfs-tools/scripts/init-bottom/gpio-poweron $(DESTDIR)$(prefix)/share/initramfs-tools/scripts/init-bottom

.PHONY: all install
