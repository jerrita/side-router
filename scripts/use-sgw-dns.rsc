/ip/dns/set allow-remote-requests=yes cache-size=4096KiB servers=192.168.5.254
/ip dns cache flush
:local BarkUrl "https://api.day.app/xxxxxx"
/tool fetch http-method=post mode=https url="$BarkUrl" http-header-field="Content-Type: application/json; charset=utf-8" output=none http-data="{\"title\":\"Router / DNS Switch\",\"body\":\"Side Router Activate\"}"
