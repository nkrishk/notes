# Regex


#### Python

Prefer to use this for new line 

     [\r\n]{1,2}
     
https://stackoverflow.com/questions/4544636/what-does-s-s-mean-in-regex-in-php

By default ```.``` doesn't match new lines - ```[\s\S]``` is a hack around that problem.

```re.DOTALL``` will do the trick i think - need to check

Collect Ping statics

<details>
<summary> Ping linux statistics regex - own </summary>

```
MAC
krinata2@KRINATA2-M-QKVQ ~ % ping 10.90.21.75 -c 1
PING 10.90.21.75 (10.90.21.75): 56 data bytes
64 bytes from 10.90.21.75: icmp_seq=0 ttl=47 time=378.429 ms

--- 10.90.21.75 ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 378.429/378.429/378.429/0.000 ms
krinata2@KRINATA2-M-QKVQ ~ %
UBUNTU 14.4
ansvt@TFTP-Server:~$ ping 8.8.8.8 -c 1
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=114 time=19.6 ms

--- 8.8.8.8 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 19.672/19.672/19.672/0.000 ms
ansvt@TFTP-Server:~$


re.compile(r"---[\s\S]+---[\r\n]{1,2}(?P<pkt_transmitted>[\d]+)\s[\s\S]+tran[\s\S]+\s
     r"(?P<pkt_received>[\d]+)\s[\s\S]+rece[\s\S]+\s"
     r"(?P<percent_loss>[\d]{1,3}.[\d]{1,3})%\s.*loss"
     r"(, time\s(?P<total_time>[\d]+)ms)*")
```

</details>

https://stackoverflow.com/questions/587345/regular-expression-matching-a-multiline-block-of-text

Try this:

    re.compile(r"^(.+)\n((?:\n.+)+)", re.MULTILINE)
I think your biggest problem is that you're expecting the ^ and $ anchors to match linefeeds, but they don't. In multiline mode, ^ matches the position immediately following a newline and $ matches the position immediately preceding a newline.

Be aware, too, that a newline can consist of a linefeed (\n), a carriage-return (\r), or a carriage-return+linefeed (\r\n). If you aren't certain that your target text uses only linefeeds, you should use this more inclusive version of the regex:

    re.compile(r"^(.+)(?:\n|\r\n?)((?:(?:\n|\r\n?).+)+)", re.MULTILINE)
    
    # Error in packet.
    # Reason: notWritable (That object does not support modification)
    # Failed object: iso.3.6.1.4.1.9.9.117.1.2.1.1.2.50001
    p3 = re.compile(r'Error in packet.[\r\n]+Reason:\s(?P<error>.+)[\r\n]+Failed object:\s(iso|1)(?P<oid>[.\d]+)', re.MULTILINE)

BTW, you don't want to use the DOTALL modifier here; you're relying on the fact that the dot matches everything except newlines.



