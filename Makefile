.PHONY: update install

update:
	@echo "Updating dnsmasq..."
	cd dnsmasq-china-list && git pull
	cd dnsmasq-china-list && make SERVER=127.0.0.1#5353 dnsmasq
	mv dnsmasq-china-list/*.dnsmasq.conf dnsmasq.d
	@echo "Updating geoip..."
	wget https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb
	mv geoip.metadb clash

install:
	pacman -S bird
	cp bird.conf /etc
	@echo "Installed, maybe you need to modify /etc/bird.conf and enable bird service."
