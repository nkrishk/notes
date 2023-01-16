

https://netref.soe.ucsc.edu/node/20#:~:text=The%20typical%20lifetime%20of%20an,a%20certain%20amount%20of%20time.

    arp -a
    
-Displays the content of the ARP cache
    
    arp -d IPAddress
    Example: arp -s 10.0.1.12 00:02:2D:0D:68:C1

-Deletes the entry with the IP address IPAddress.

    arp -s IPAddress MACAddress
-Adds a static entry to the ARP cache that is never overwritten by network events. The MAC address is entered as 6 hexadecimal bytes separated by colons.

    ip neighbor flush all
-Deletes all ARP entries from the ARP cache.
