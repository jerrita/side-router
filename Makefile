.PHONY: run update install

run:
	cd dnsmasq-china-list && make SERVER=127.0.0.1#5353 dnsmasq
	mv dnsmasq-china-list/*.dnsmasq.conf dnsmasq.d

update:
	cd dnsmasq-china-list && git pull
	@echo "Updated. Please run 'make run' to generate new config file."

install:
	pacin bird
	cp bird.conf /etc
	chown bird:bird /etc/bird.conf
	@echo "Installed, maybe you need to modify /etc/bird.conf and enable bird service."