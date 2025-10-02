prefix = /usr

all: wp360-set-rs485

wp360-set-rs485:
	$(CC) usr/src/wp360-serial-map/test.c -o wp360-set-rs485

install: all
	install -d $(DESTDIR)$(prefix)/lib/systemd/system
	install -d $(DESTDIR)$(prefix)/lib/udev/rules.d
	install -d $(DESTDIR)$(prefix)/lib/wp360-serial-map
	install wp360-set-rs485 $(DESTDIR)$(prefix)/lib/wp360-serial-map
	install usr/lib/systemd/system/wp360-serial-map.service $(DESTDIR)$(prefix)/lib/systemd/system
	install usr/lib/udev/rules.d/99-serial.rules $(DESTDIR)$(prefix)/lib/udev/rules.d/99-serial.rules

clean:
	-rm wp360-set-rs485

.PHONY: all install clean
