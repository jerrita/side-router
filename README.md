# SideRouter

Used on my archlinux side router. 

Occupied `53`, `5353`, `5355`.

## Install

```bash
git clone https://github.com/felixonmars/dnsmasq-china-list --depth=1
make
make install
systemctl enable --now bird.service
docker-compose up -d
```

## Update

```bash
make update
```