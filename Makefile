
DATE = $(shell date +%Y-%m-%d)

.PHONY: all clean test

all: out/archlinux.iso output/basedos.iso ouout/basedos-$(DATE).iso

out/archlinux.iso:
	sudo sh -c 'mkarchiso -v -w .archiso-tmp archiso && mv out/archlinux-*.iso out/archlinux.iso'

out/basedos.iso: out/archlinux.iso
	sudo ln -s archlinux.iso out/basedos.iso

out/basedos-$(DATE).iso: out/basedos.iso
	sudo ln -s basedos.iso out/basedos-$(DATE).iso

clean:
	sudo rm -rf out

deepclean:
	sudo git clean -xfd

fixperms:
	sudo chown -R user:user .

test: out/archlinux.iso
	run_archiso -u -i out/archlinux.iso
