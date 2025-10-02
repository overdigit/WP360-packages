prefix = /usr

all: wp360-fan-ctrl wp360-fan-ctrl-debug

wp360-fan-ctrl:
	$(CC) usr/src/wp360-fan-ctrl/Fan1.c -l gpiod -o wp360-fan-ctrl

wp360-fan-ctrl-debug:
	$(CC) -DDEBUG usr/src/wp360-fan-ctrl/Fan1.c -l gpiod -o wp360-fan-ctrl-debug

install: all
	install -d $(DESTDIR)$(prefix)/bin
	install -d $(DESTDIR)$(prefix)/lib/systemd/system
	install -d $(DESTDIR)$(prefix)/lib/wp360-fan-ctrl
	install wp360-fan-ctrl $(DESTDIR)$(prefix)/bin
	install wp360-fan-ctrl-debug $(DESTDIR)$(prefix)/lib/wp360-fan-ctrl
	install usr/lib/systemd/system/wp360-fan-ctrl.service $(DESTDIR)$(prefix)/lib/systemd/system

clean:
	-rm wp360-fan-ctrl wp360-fan-ctrl-debug

.PHONY: all install clean
