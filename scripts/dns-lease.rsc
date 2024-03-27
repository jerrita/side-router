:local DHCPtag
:local topdomain;
:local hostname;
:local hostip;
:local skip;
:local protected;
:local ttl
:local leaseServerName

:set DHCPtag "#DHCP"
:set leaseServerName "dhcp1"
:set topdomain "lan"

/ip dhcp-server
:set ttl [ get [ find name=$leaseServerName ] lease-time ]
  

/ip dhcp-server lease;
:foreach i in=[find where status="bound"] do={
  /ip dhcp-server lease;
  :if ([:len [get $i host-name]] > 0) do={
    :set hostname ([get $i host-name] . "." . $topdomain);
    :set hostip [get $i address];
    /ip dns static;
    :set protected false;
    :set skip false;
    :foreach di in [find] do={
      :if ([get $di name] = $hostname) do={
        :if ([get $di comment] = $DHCPtag) do={
            :if ([get $di address] = $hostip) do={
                :put ("Unchanged: " . $hostname . " : " . $hostip);
                :set skip true;
            } else={
                :put ("Removing: " . $hostname . " : " . $hostip);
                remove $di;
            }
        } else={
            :set protected true;
            :put ("Protected: " . $hostname . " : " . $hostip);
        }
      }
    }
    :if (!$skip && !$protected) do={
        :put ("Adding: " . $hostname . " : " . $hostip);
        /ip dns static add name=$hostname address=$hostip ttl=$ttl comment=$DHCPtag;
    }
  }
}
