prefix = /usr/local

all:

install:
	install -d $(DESTDIR)$(prefix)/share/initramfs-tools/hooks
	install -d $(DESTDIR)$(prefix)/share/initramfs-tools/scripts/local-premount
	install usr/share/initramfs-tools/hooks/wp360-rescue $(DESTDIR)$(prefix)/share/initramfs-tools/hooks
	install usr/share/initramfs-tools/scripts/local-premount/wp360-rescue $(DESTDIR)$(prefix)/share/initramfs-tools/scripts/local-premount

.PHONY: all install
