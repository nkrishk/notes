1. [ Interface ](#interface)
2. [ TFTP Capture ](#tftp)
3. [ L2TP Capture ](#l2tp)
4. [ HOST Capture ](#host)
5. [ src/dst Capture ](#host)
6. [ src/dst Port Capture](#src_dst_port)
7. [ Protocol Capture ](#protocol_capture)
8. [ DHCP Capture ](#dhcp_capture)


### Reference

1. [ 3rd party Document for NETGATE ](https://docs.netgate.com/pfsense/en/latest/diagnostics/packetcapture/index.html)
2. [ Blogspot reference ](http://kmaiti.blogspot.com/2011/01/hot-to-use-tcpdump-command-to-capture.html)
3. [ Detailed ](https://danielmiessler.com/study/tcpdump/)
4. [ some other ](http://openmaniak.com/tcpdump.php)

### Commonly Used tcpdump Flags

       Flag	Description
       -i <interface>	Listen on <interface>, .e.g. -i igb0
       -n	Do not perform reverse DNS resolution on IP addresses
       -r <filename> Read from the saved file <filename>, e.g. -r /user/home/capture.pcap
       -w <filename>	Save capture in pcap format to <filename>, e.g. -w /tmp/wan.pcap
       -s <bytes>	Snap length: Amount of data to be captured from each frame
       -c <packets>	Exit after receiving a specific number of packets
       -p	Do not put the interface in promiscuous mode
       -v	Verbose output
       -e	Print link-layer header on each line!


<a name="interface"></a>
### Interface capture

Helpful in case there are multiple interface in a host and you are intrested in capturing traffic from a particulat interface
```
sudo tcpdump [-i interface]
```

```
sudo tcpdump -i ens35
```
       -i interface
       --interface=interface
              Listen  on  interface.  If unspecified, tcpdump searches the system interface list for the lowest numbered, con-
              figured up interface (excluding loopback), which may turn out to be, for example, ``eth0''.

              On Linux systems with 2.2 or later kernels, an interface argument of ``any'' can be used to capture packets from
              all interfaces.  Note that captures on the ``any'' device will not be done in promiscuous mode.

              If  the -D flag is supported, an interface number as printed by that flag can be used as the interface argument,
              if no interface on the system has that number as a name.

<a name="tftp"></a>
#### TFTP capture

```
sudo tcpdump -i ens35 -n -v udp port 69
```
    -n     Don't convert addresses (i.e., host addresses, port numbers, etc.) to names.
    -v     When parsing and printing, produce (slightly more) verbose output.  For example, the time to  live,  identifica-
              tion,  total  length  and  options in an IP packet are printed.  Also enables additional packet integrity checks
              such as verifying the IP and ICMP header checksum.
              
<a name="host"></a>
### Host capture

Helpful in case there are multiple interface in a host and you are intrested in capturing traffic from a particulat interface
```
sudo tcpdump host [IP or FQDN]
```
To print all packets arriving at or departing from host (via interface ens35):
```
sudo tcpdump -i ens35 host 192.168.1.1
```
To print traffic between 192.168.1.1 and 192.168.1.2 (via interface ens35)
```
sudo tcpdump -i ens35 host 192.168.1.1 and 192.168.1.2
```
To print traffic between 192.168.1.1 and either 192.168.1.2 or 192.168.1.3:
```
tcpdump host 192.168.1.1 and \( 192.168.1.2 or 192.168.1.3 \)
```
 To print all IP packets between **hostA** and any host except **hostB**:
```
tcpdump ip host hostA and not hostB
```

### src/dst capture
To print traffic from only a source or destination (eliminates one side of a host conversation)
```
tcpdump src 192.168.1.1
tcpdump dst 192.168.1.2
```

### To capture entire n/w
capture an entire network using CIDR notation
```
tcpdump net 192.168.1.0/24
```
<a name="src_dst_port"></a>
### src/dst port capture
```
tcpdump src port 80
tcpdump dst port 69
```
<a name="protocol_capture"></a>
### Protocol Capture
```
tcpdump icmp
tcpdump tcp
tcpdump udp
```

<a name="dhcp_capture"></a>
### DHCP Capture

       tcpdump -i eth1 -nn -e  port 67 or port 68
