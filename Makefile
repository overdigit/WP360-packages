.PHONY: all clean

default: all

wp360-ups-ctrl.deb:
	dpkg-deb --root-owner-group -b wp360-ups-ctrl

wp360-webvisu.deb:
	dpkg-deb --root-owner-group -b wp360-webvisu

wp360-udiskie.deb:
	dpkg-deb --root-owner-group -b wp360-udiskie

all: wp360-ups-ctrl.deb wp360-webvisu.deb wp360-udiskie.deb

clean:
	-rm wp360-ups-ctrl.deb wp360-webvisu.deb wp360-udiskie.deb
