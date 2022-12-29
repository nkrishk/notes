

https://pubhub.devnetcloud.com/media/pyats-getting-started/docs/quickstart/manageconnections.html

To disable default configuration:

    dev.connect(init_exec_commands=[], init_config_commands=[])
or

    dev.connect(mit=True)
    
https://pubhub.devnetcloud.com/media/genie-docs/docs/clean/supported_os_platform.html

power cycler
    
https://pubhub.devnetcloud.com/media/unicon/docs/user_guide/proxy.html

Configuring via proxies


https://vincent.bernat.ch/en/blog/2021-pyats-genie-parser

pyats feedback

<details>
<summary>Pyats Feedback</summary>
    
    Cisco pyATS is a framework for network automation and testing. It includes, among other things, an open-source multi-vendor set of parsers and models, Genie Parser. It features 2700 parsers for various commands over many network OS. On the paper, this seems a great tool!
    >>> from genie.conf.base import Device
    >>> device = Device("router", os="iosxr")
    >>> # Hack to parse outputs without connecting to a device
    >>> device.custom.setdefault("abstraction", {})["order"] = ["os", "platform"]
    >>> cmd = "show route ipv4 unicast"
    >>> output = """
    ... Tue Oct 29 21:29:10.924 UTC
    ...
    ... O    10.13.110.0/24 [110/2] via 10.12.110.1, 5d23h, GigabitEthernet0/0/0/0.110
    ... """
    >>> device.parse(cmd, output=output)
    {'vrf': {'default': {'address_family': {'ipv4': {'routes': {'10.13.110.0/24': {'route': '10.13.110.0/24',
       'active': True,
       'route_preference': 110,
       'metric': 2,
       'source_protocol': 'ospf',
       'source_protocol_codes': 'O',
       'next_hop': {'next_hop_list': {1: {'index': 1,
          'next_hop': '10.12.110.1',
          'outgoing_interface': 'GigabitEthernet0/0/0/0.110',
          'updated': '5d23h'}}}}}}}}}}
    
    First deception: pyATS is closed-source with some exceptions. This is quite annoying if you run into some issues outside Genie Parser. For example, although pyATS is using the ssh command, it cannot leverage my ssh_config file: pyATS resolves hostnames before providing them to ssh. There is no plan to open source pyATS. 🤨
    
Then, Genie Parser has two problems:

1. The data models used are dependent on the vendor and OS, despite the documentation saying otherwise. For example, the data model used for IPv4 interfaces is different between NX-OS and IOS-XR.
2. The parsers rely on line-by-line regular expressions to extract data and some Python code as glue. This is fragile and may break silently.
To illustrate the second point, let’s assume the output of show ipv4 vrf all interface is:

      Loopback10 is Up, ipv4 protocol is Up
        Vrf is default (vrfid 0x60000000)
        Internet protocol processing disabled
      Loopback30 is Up, ipv4 protocol is Down [VRF in FWD reference]
        Vrf is ran (vrfid 0x0)
        Internet address is 203.0.113.17/32
        MTU is 1500 (1500 is available to IP)
        Helper address is not set
        Directed broadcast forwarding is disabled
        Outgoing access list is not set
        Inbound  common access list is not set, access list is not set
        Proxy ARP is disabled
        ICMP redirects are never sent
        ICMP unreachables are always sent
        ICMP mask replies are never sent
        Table Id is 0x0
    
Because the regular expression to parse an interface name does not expect the extra data after the interface state, Genie Parser ignores the line starting the definition of Loopback30 and parses the output to this structure:
https://github.com/CiscoTestAutomation/genieparser/blob/88cb6ee4ad540a45c9c0b03c8cd75271f39da424/src/genie/libs/parser/iosxr/show_interface.py#L1246-L1248
    
        {
          "Loopback10": {
            "int_status": "up",
            "oper_status": "up",
            "vrf": "ran",
            "vrf_id": "0x0",
            "ipv4": {
              "203.0.113.17/32": {
                "ip": "203.0.113.17",
                "prefix_length": "32"
              },
              "mtu": 1500,
              "mtu_available": 1500,
              "broadcast_forwarding": "disabled",
              "proxy_arp": "disabled",
              "icmp_redirects": "never sent",
              "icmp_unreachables": "always sent",
              "icmp_replies": "never sent",
              "table_id": "0x0"
            }
          }
        }
    
While this bug is simple to fix, this is an uphill battle. Any existing or future slight variation in the output of a command could trigger another similar undetected bug, despite the extended test coverage. I have reported and fixed several other silent parsing errors: #516, #529, and #530. A more robust alternative would have been to use TextFSM and to trigger a warning when some output is not recognized, like Batfish, a configuration analysis tool, does.

In the future, we should rely on YANG for data extraction, but it is currently not widely supported. SNMP is still a valid possibility but much information is not accessible through this protocol. In the meantime, I would advise you to only use Genie Parser with caution.
    
</details>
