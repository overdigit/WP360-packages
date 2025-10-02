SUBDIRS = wp360-fan-ctrl wp360-rescue wp360-serial-map wp360-sys-mods wp360-test-tools wp360-udiskie wp360-ups-ctrl wp360-webvisu

.PHONY: all install clean $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

install:
	$(MAKE) -C wp360-fan-ctrl install
	$(MAKE) -C wp360-rescue install
	$(MAKE) -C wp360-serial-map install
	$(MAKE) -C wp360-sys-mods install
	$(MAKE) -C wp360-test-tools install
	$(MAKE) -C wp360-udiskie install
	$(MAKE) -C wp360-ups-ctrl install
	$(MAKE) -C wp360-webvisu install

clean:
