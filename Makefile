.PHONY: all clean deploy

default: all

wp360-ups-ctrl.deb:
	dpkg-deb --root-owner-group -b wp360-ups-ctrl

wp360-webvisu.deb:
	dpkg-deb --root-owner-group -b wp360-webvisu

wp360-udiskie.deb:
	dpkg-deb --root-owner-group -b wp360-udiskie

wp360-serial-map.deb:
	dpkg-deb --root-owner-group -b wp360-serial-map

wp360-fan-ctrl.deb:
	dpkg-deb --root-owner-group -b wp360-fan-ctrl

wp360-test-tools.deb:
	dpkg-deb --root-owner-group -b wp360-test-tools

wp360-rescue.deb:
	dpkg-deb --root-owner-group -b wp360-rescue

wp360-sys-mods.deb:
	dpkg-deb --root-owner-group -b wp360-sys-mods

all: wp360-ups-ctrl.deb wp360-webvisu.deb wp360-udiskie.deb wp360-serial-map.deb wp360-fan-ctrl.deb wp360-test-tools.deb wp360-rescue.deb wp360-sys-mods.deb

deploy: all
	cp wp360-ups-ctrl.deb ../pi-gen-wp360/stage3-wp360/00-ups-ctrl/files/
	cp wp360-webvisu.deb ../pi-gen-wp360/stage5-webvisu/00-webvisu/files/
	cp wp360-udiskie.deb ../pi-gen-wp360/stage3-wp360/01-automount/files/
	cp wp360-serial-map.deb ../pi-gen-wp360/stage3-wp360/04-serial-map/files/
	cp wp360-fan-ctrl.deb ../pi-gen-wp360/stage3-wp360/05-fan-ctrl/files/
	cp wp360-test-tools.deb ../pi-gen-wp360/stage6-dev/00-install-tools/files/
	cp wp360-rescue.deb ../pi-gen-wp360/stage3-wp360/06-rescue/files/
	cp wp360-sys-mods.deb ../pi-gen-wp360/stage3-wp360/06-rescue/files/

clean:
	-rm wp360-ups-ctrl.deb wp360-webvisu.deb wp360-udiskie.deb wp360-serial-map.deb wp360-fan-ctrl.deb wp360-test-tools.deb wp360-rescue.deb wp360-sys-mods.deb
