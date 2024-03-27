/ip/dns/set allow-remote-requests=yes cache-size=4096KiB servers=61.132.163.68,202.102.213.68 
/ip dns cache flush
:local BarkUrl "https://api.day.app/xxxxxx"
/tool fetch http-method=post mode=https url="$BarkUrl" http-header-field="Content-Type: application/json; charset=utf-8" output=none http-data="{\"title\":\"Router / DNS Switch\",\"body\":\"ISP Activate\"}"
