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

## ROS Setup Scripts

```bash
/system script
add dont-require-permissions=yes name=use-default-dns owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip/dns/set allow-remote-requests=yes cache-size=4096KiB servers=61.132.163\
    .68,202.102.213.68 \r\
    \n/ip dns cache flush"
add dont-require-permissions=yes name=use-sgw-dns owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip/dns/set allow-remote-requests=yes cache-size=4096KiB servers=192.168.5.\
    254\r\
    \n/ip dns cache flush"
/tool netwatch
add down-script=use-default-dns host=192.168.5.254 interval=10s up-script=use-sgw-dns
# or http-get clash:9090
```
