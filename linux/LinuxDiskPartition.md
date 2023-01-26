
#### this is not for LVM , but we can expand for single disk(HDD) mounted to VM and then grow it later to add to LVM

https://www.golinuxcloud.com/extend-resize-primary-partition-non-lvm-linux/

    cloud-user@chn-jenkins-agent-1:~$ sudo su -
    root@chn-jenkins-agent-1:~#
    root@chn-jenkins-agent-1:~#
    root@chn-jenkins-agent-1:~# parted /dev/sda
    GNU Parted 3.4
    Using /dev/sda
    Welcome to GNU Parted! Type 'help' to view a list of commands.
    (parted) p
    Model: VMware Virtual disk (scsi)
    Disk /dev/sda: 537GB
    Sector size (logical/physical): 512B/512B
    Partition Table: gpt
    Disk Flags:

    Number  Start   End     Size    File system  Name  Flags
     1      1049kB  2097kB  1049kB                     bios_grub
     2      2097kB  1904MB  1902MB  ext4
     3      1904MB  21.5GB  19.6GB

    (parted) u
    Unit?  [compact]? s
    (parted) p
    Model: VMware Virtual disk (scsi)
    Disk /dev/sda: 1048576000s
    Sector size (logical/physical): 512B/512B
    Partition Table: gpt
    Disk Flags:

    Number  Start     End        Size       File system  Name  Flags
     1      2048s     4095s      2048s                         bios_grub
     2      4096s     3719167s   3715072s   ext4
     3      3719168s  41940991s  38221824s

    (parted) rm 3
    Error: Partition(s) 3 on /dev/sda have been written, but we have been unable to inform the kernel of the change, probably
    because it/they are in use.  As a result, the old partition(s) will remain in use.  You should reboot now before making further
    changes.
    Ignore/Cancel? Ignore
    (parted) p
    Model: VMware Virtual disk (scsi)
    Disk /dev/sda: 1048576000s
    Sector size (logical/physical): 512B/512B
    Partition Table: gpt
    Disk Flags:

    Number  Start  End       Size      File system  Name  Flags
     1      2048s  4095s     2048s                        bios_grub
     2      4096s  3719167s  3715072s  ext4

    (parted) mkpart
    Partition name?  []? /dev/sda3
    File system type?  [ext2]? ext4
    Start? 3719168s
    End? 960750418s
    (parted) p
    Model: VMware Virtual disk (scsi)
    Disk /dev/sda: 1048576000s
    Sector size (logical/physical): 512B/512B
    Partition Table: gpt
    Disk Flags:

    Number  Start     End         Size        File system  Name       Flags
     1      2048s     4095s       2048s                               bios_grub
     2      4096s     3719167s    3715072s    ext4
     3      3719168s  960750418s  957031251s  ext4         /dev/sda3



#### NO INCREASE

    root@chn-jenkins-agent-1:~# df -h /dev/sda3
    Filesystem      Size  Used Avail Use% Mounted on
    udev            7.8G     0  7.8G   0% /dev
    root@chn-jenkins-agent-1:~#




#### Then grow partion

https://stackoverflow.com/questions/11014584/ec2-cant-resize-volume-after-increasing-size

    cloud-user@chn-jenkins-agent-1:~$ lsblk
    NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
    loop0                       7:0    0    15M  1 loop /snap/aws-cli/130
    loop1                       7:1    0 116.7M  1 loop /snap/core/14447
    loop2                       7:2    0 116.7M  1 loop /snap/core/14399
    loop3                       7:3    0  55.6M  1 loop /snap/core18/2654
    loop4                       7:4    0  55.6M  1 loop /snap/core18/2667
    loop5                       7:5    0  63.2M  1 loop /snap/core20/1738
    loop6                       7:6    0  63.3M  1 loop /snap/core20/1778
    loop7                       7:7    0 141.4M  1 loop /snap/docker/2285
    loop8                       7:8    0 139.4M  1 loop /snap/docker/2343
    loop9                       7:9    0 308.6M  1 loop /snap/google-cloud-sdk/308
    loop10                      7:10   0 334.8M  1 loop /snap/google-cloud-sdk/310
    loop11                      7:11   0   103M  1 loop /snap/lxd/23541
    loop12                      7:12   0 111.9M  1 loop /snap/lxd/24322
    loop13                      7:13   0  49.6M  1 loop /snap/snapd/17883
    loop14                      7:14   0  49.8M  1 loop /snap/snapd/17950
    sda                         8:0    0   500G  0 disk
    ├─sda1                      8:1    0     1M  0 part
    ├─sda2                      8:2    0   1.8G  0 part /boot
    └─sda3                      8:3    0 456.3G  0 part
      └─ubuntu--vg-ubuntu--lv 253:0    0  18.2G  0 lvm  /
    cloud-user@chn-jenkins-agent-1:~$ growpart /dev/sda 3
    sfdisk: cannot open /dev/sda: Permission denied
    /usr/bin/growpart: 160: cannot create /dev/sda: Permission denied
    cloud-user@chn-jenkins-agent-1:~$ sudo growpart /dev/sda 3
    CHANGED: partition=3 start=3719168 old: size=957031251 end=960750419 new: size=1044856799 end=1048575967
    cloud-user@chn-jenkins-agent-1:~$
    
    
#### then add the grown space to LVM 

    cloud-user@chn-jenkins-agent-1:~$ sudo lvm
    lvm> lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
      Size of logical volume ubuntu-vg/ubuntu-lv changed from 18.22 GiB (4665 extents) to 498.22 GiB (127545 extents).
      Logical volume ubuntu-vg/ubuntu-lv successfully resized.
    lvm> exit
      Exiting.
    cloud-user@chn-jenkins-agent-1:~$ sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
    resize2fs 1.46.5 (30-Dec-2021)
    Filesystem at /dev/ubuntu-vg/ubuntu-lv is mounted on /; on-line resizing required
    old_desc_blocks = 3, new_desc_blocks = 63
    The filesystem on /dev/ubuntu-vg/ubuntu-lv is now 130606080 (4k) blocks long.

    cloud-user@chn-jenkins-agent-1:~$ df -h
    Filesystem                         Size  Used Avail Use% Mounted on
    tmpfs                              1.6G  1.3M  1.6G   1% /run
    /dev/mapper/ubuntu--vg-ubuntu--lv  491G   16G  455G   4% /
    tmpfs                              7.9G     0  7.9G   0% /dev/shm
    tmpfs                              5.0M     0  5.0M   0% /run/lock
    /dev/sda2                          1.8G  247M  1.4G  15% /boot
    tmpfs                              1.6G  4.0K  1.6G   1% /run/user/1001
    cloud-user@chn-jenkins-agent-1:~$
