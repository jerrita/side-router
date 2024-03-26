.PHONY: run update install

run:
	cd dnsmasq-china-list && make SERVER=127.0.0.1#5353 dnsmasq
	mv dnsmasq-china-list/*.dnsmasq.conf dnsmasq.d

update:
	wget https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb
	mv geoip.metadb clash
	cd dnsmasq-china-list && git pull
	@echo "Updated. Please run 'make run' to generate new config file."

install:
	pacman -S bird
	cp bird.conf /etc
	chown bird:bird /etc/bird.conf
	@echo "Installed, maybe you need to modify /etc/bird.conf and enable bird service."
