Contact: https://www.chandrashekar.info/contact
Email: training@chandrashekar.info
Youtube: https://youtube.com/ChandrashekarBabu

Presentation slides: https://files.chandrashekar.info/ilk.pdf
Code Samples: https://files.chandrashekar.info/2022_dec07.zip

------------------------------------ Notes ----------------------------
HURD -> HIRD of Unix Resource Daemons
                HIRD -> HURD of Interpretations Representing Depth
                
"File" -> On Linux, a file is a user-space abstraction to a kernel-managed resource.

API -> Application Programming Interface -> syscalls
ABI -> Application Binary Interface -> Files

------------------------------------------------------------------------------------------------------------
Books and References:
    https://www.amazon.com/Linux-Kernel-Development-Robert-Love/dp/8131758184
    https://www.amazon.com/Professional-Kernel-Architecture-Wolfgang-Mauerer/dp/0470343435/ref=sr_1_1?crid=1PN5V0PTRBVW4&keywords=Professional+Linux+Kernel+Architecture&qid=1670405419&s=books&sprefix=professional+linux+kernel+architecture%2Cstripbooks-intl-ship%2C281&sr=1-1
    https://www.amazon.com/Linux-Programming-Interface-System-Handbook/dp/1593272200/ref=d_pd_sbs_sccl_1_3/143-0612148-0484164?pd_rd_w=9i6tn&content-id=amzn1.sym.3676f086-9496-4fd7-8490-77cf7f43f846&pf_rd_p=3676f086-9496-4fd7-8490-77cf7f43f846&pf_rd_r=C2W46Q4HNJ6GN9B9JS86&pd_rd_wg=1CBRg&pd_rd_r=33a11e1b-3bb5-4e90-9263-d8a4b2de2873&pd_rd_i=1593272200&psc=1
    
    https://lwn.net/
    
Building External Modules: https://docs.kernel.org/kbuild/modules.html

---------------------------------------------------------------------------
Setting up virtual-machine (VirtualBox) for practicing Linux kernel builds
---------------------------------------------------------------------------

For Windows, MacOS (x86) and Linux Users:
   -  Download and install VirtualBox Latest version
       VirtualBox Windows download:
       https://download.virtualbox.org/virtualbox/7.0.4/VirtualBox-7.0.4-154605-Win.exe

       VirtualBox MacOS (x86) download:
       https://download.virtualbox.org/virtualbox/7.0.4/VirtualBox-7.0.4-154605-OSX.dmg

** NOTE FOR MacOS USERS **
    For installation on MacOS: 
        https://apple.stackexchange.com/questions/301303/virtualbox-5-1-28-fails-to-install-on-macos-10-13-due-to-kext-security
    For MacOS Monterey install issues:
        https://discussions.apple.com/thread/253370629

For MacOS (M1/M2 arm64) users:     
    - Download and setup Archlinux on UTM: 
          -  https://mac.getutm.app/
    - ARCHLinux (ARM64 for Mac M1 - UTM)
          - https://mac.getutm.app/gallery/archlinux-arm
   
For Windows, MacOS (x86) and Linux users: 
    1. Download the automation script that creates a new VM in virtualbox and install ArchLinux:
        MacOS / Linux: https://files.chandrashekar.info/vbox_archlinux_setup.sh
        Windows: https://files.chandrashekar.info/vbox_archlinux_setup.ps1
        [* Disclaimer: The powershell script for Windows needs further testing -- can be buggy *]
        
    2. Review the script (modify the shell variables to your requirement if needed)    
        On MacOS / Linux - run the following commands in the Terminal:
            % chmod +x vbox_archlinux_setup.sh
            % ./vbox_archlinux_setup.sh
            
            # After poweroff, before starting the VM, goto settings and verify display settings to be VMSVGA
            
        On Windows:
            Open 'Powershell' prompt and run the downloaded powershell script:
               C:\> cd /D %userprofile%
               C:\users\user1> .\vbox_archlinux_setup.ps1
    
        
    3. On VirtualBox VM, once the installation is complete, shutdown, Remove CD-ROM and reboot the VM.
        - On Windows Command Prompt, you can run the following to 
          change the boot-loader:
            VBoxManage modifyvm ARCHLinuxVM --boot1 disk --boot2 dvd --boot3 none --boot4 none
            
        - On MacOS command prompt: 
            /Applications/VirtualBox.app/Contents/MacOS/VBoxManage modifyvm ARCHLinuxVM \
                          --boot1 disk --boot2 dvd --boot3 none --boot4 none
             
    4. Reboot the VM, ensure that the login prompt is NOT "archiso login:". If so, you can booted from the CDROM.
        Eject the CDROM from the VirtualBox VM and reboot. 
    
    5. One rebooted into ArchLinux installed VM: at the 'login:' prompt,
         Login as user 'root', password: 'welcome'
    
    6. For remote login using MacOS / Windows / Linux: ssh -p 2222 root@localhost
    
--------------------------------------------------------------
Building the Linux Kernel
---------------------------------------------------------------
Sync up with Linux GIT repositories
------------------------------------------
mainline kernel:
    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

stable kernel:
    git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
      -- or --
    git clone https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git

Building the Linux kernel from source tarball
-----------------------------------------------------
# Login as root user into the VM

# Ensure system clock to be synchronized
% timedatectl set-ntp true

% cd /root

# Download the kernel source tarball
% curl -O https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.11.tar.xz

# Untar the kernel source tarball in /usr/local/src
% tar xvf linux-6.0.11.tar.xz -C /usr/local/src/

# Write-protect the kernel source folder (for safety reasons):
% chattr -Rf +i /usr/local/src/linux-6.0.11

# Prepare the build folder under /usr/local/build
%  mkdir -p /usr/local/build/linux-6.0.11-custom

# Create a kernel build configuration using 'menuconfig' target
% cd /usr/local/src/linux-6.0.11
% make O=/usr/local/build/linux-6.0.11-custom menuconfig
      # Select all relevant options to enable and build in the TUI
      
-- or -- 
# Choose a ready-made configuration for virtualbox hardware setup
% curl -o /usr/local/build/linux-6.0.11-custom/.config https://files.chandrashekar.info/kernel-config-vbox

# Verify that the file is NOT a  HTML document
% head /usr/local/build/linux-6.0.11-custom/.config

# NOTE: for debian/ubuntu distributions, install the following:
    % sudo apt install build-essential flex bison bc gawk sed libncurses-dev libelf-dev libssl-dev dwarves linux-headers-$(uname -r)
    
    # https://wiki.debian.org/BuildADebianKernelPackage

# Update .config using the old template .config file
% make O=/usr/local/build/linux-6.0.11-custom oldconfig

# Run make menuconfig (if needed) to review further changes
% make O=/usr/local/build/linux-6.0.11-custom menuconfig

# Run the kernel build and create a build tarball
% make -j$(nproc) O=/usr/local/build/linux-6.0.11-custom tarxz-pkg

# Setup a new hard drive to install and test the freshly built kernel
% lsblk # confirm existence of a second hard drive (generally 'sdb')

# Partition the new hard drive
% cfdisk /dev/sdb
   # Select 'dos' label
   # Create new partition (default size - full size), primary
       --> Press Enter thrice
       --> Confirm a table that shows /dev/sdb1
       --> Write, 'yes', Quit

% lsblk    # confirm existence of sdb1

# Format the partition with ext4 filesystem
% mkfs.ext4 /dev/sdb1

# Mount the newly formatted partition
% mount /dev/sdb1 /mnt

# Install the kernel in the mounted partition
% tar xvf /usr/local/build/linux-6.0.11-custom/linux-6.0.11-custom-x86.tar.xz -C /mnt 

# Install grub boot loader on the new hard drive
% grub-install --boot-directory=/mnt/boot  /dev/sdb


# Reboot, Press F12 key on virtualbox boot logo, select '2) hard disk' by pressing 2
# Verify grub boot with a grub> prompt

grub> search.file /boot/vmlinuz-6.0.11-custom
(hd1,msdos1).  # This should be the output

grub> linux /boot/vmlinuz-6.0.11-custom root=/dev/sdb1

grub> boot

# The kernel would boot and panic looking for /sbin/init. Reboot.

----- Building and installing busybox for userspace ------
# Download busybox tarball
% curl -O https://busybox.net/downloads/busybox-1.35.0.tar.bz2

# Untar into /usr/local/src
% tar xvf busybox-1.35.0.tar.bz2 -C /usr/local/src

# Create a separate build folder
% mkdir -p /usr/local/build/busybox

# Write protect source folder
% chattr -Rf +i /usr/local/src/busybox-1.35.0/

# Configure and build busybox
% cd /usr/local/src/busybox-1.35.0
% curl -o /usr/local/build/busybox/.config https://files.chandrashekar.info/busybox-config
% make O=/usr/local/build/busybox menuconfig  # Select all options
% make -j$(nproc) O=/usr/local/build/busybox
% make -j$(nproc) O=/usr/local/build/busybox install


# Install busybox on our custom partition
% mount /dev/sdb1   /mnt
% cp -a /usr/local/build/busybox/_install/*   /mnt

# Create important top-level directories
% mkdir /mnt/dev /mnt/proc /mnt/sys /mnt/tmp
% mkdir /mnt/etc /mnt/var

# Create a manual GRUB configuration to automatically boot Linux
% vi /mnt/boot/grub/grub.cfg        # Add the following lines
menuentry "Boot Linux 6.0.11" {
        linux (hd1,1)/boot/vmlinuz-6.0.11-custom root=/dev/sdb1 rw
}

# EOF

% umount /mnt
% reboot

On the ARCHLinuxVM environment, login as root

% mount /dev/sdb1 /mnt
% mkdir -p /mnt/etc/init.d
% vi /mnt/etc/init.d/rcS     # A simple system initialization script. Add the following lines:
#!/bin/sh

PATH=/bin:/usr/bin:/sbin:/usr/sbin
export PATH

mount proc /proc -t proc
mount sysfs /sys -t sysfs
mount tmpfs /tmp -t tmpfs
mkdir -p /dev/pts
mount devpts /dev/pts -t devpts

hostname arch-busybox-vm
echo 0 > /proc/sys/kernel/printk

# Save and quit the editor

% chmod +x /mnt/etc/init.d/rcS

# ----- Building Linux kernel for other devices (offline exercises to try out) -----
# RaspberryPI: https://www.raspberrypi.com/documentation/computers/linux_kernel.html
# Buildroot: https://www.raspberrypi.com/documentation/computers/linux_kernel.html
# Linux From Scratch Project: https://linuxfromscratch.org/lfs/read.html

InitRAMFS / InitRD Setup
------------------------------
Legacy Initrd setup example (suitable for older linux kernels):
    # Create an empty file that can serve as a disk image (a 20 MB image for instance)
    % dd if=/dev/zero of=/root/initrd_image.dat bs=1000 count=20000 
    
    # Create a loopback mountable filesystem
    % mkfs.ext4 /root/initrd_image.dat
    
    # mount the image file as loopback filesystem
    % mkdir /root/initrd_root
    % mount /root/initrd_image.dat /root/initrd_root
    
    # Create top-level directories and setup busybox...
    % cd /root/initrd_root
    % mkdir -p dev proc sys tmp var etc etc/init.d
    % cp -a /usr/local/build/busybox/_install/*  .
    % mv linuxrc init
    % vi etc/init.d/rcS     # Add the following lines
    #!/bin/sh

PATH=/bin:/usr/bin:/sbin:/usr/sbin
export PATH

mount proc /proc -t proc
mount sysfs /sys -t sysfs
mount tmpfs /tmp -t tmpfs
mount devtmpfs /dev -t devtmpfs

hostname arch-busybox-vm
echo 0 > /proc/sys/kernel/printk

     # Save and quit the editor
     
     % cd /root
     % umount /root/initrd_root
--------------------------------------------------------------------------
Modern initramfs image creation (for newer linux kernels since 2.6.34+)

    % mkdir /root/initramfs_root
    % cd /root/initramfs_root
    % mkdir -p dev proc sys tmp var etc etc/init.d
    % cp -a /usr/local/build/busybox/_install/*  .
    % mv linuxrc init
    
    % vi etc/init.d/rcS     # Add the following lines
    #!/bin/sh

PATH=/bin:/usr/bin:/sbin:/usr/sbin
export PATH

mount proc /proc -t proc
mount sysfs /sys -t sysfs
mount tmpfs /tmp -t tmpfs
mount devtmpfs /dev -t devtmpfs

hostname arch-busybox-vm
echo 0 > /proc/sys/kernel/printk

     # Save and quit the editor

      # Create a new cpio archive.
      % mount /dev/sdb1 /mnt
      % find . | cpio -H newc -o | gzip -c > /mnt/boot/initramfs.gz
      
      # Add another boot entry in /mnt/boot/grub/grub.cfg
      % vi /mnt/boot/grub/grub.cfg  # Add the following block below the current menu-entry block
      menuentry "Boot Linux with Initramfs" {
          linux (hd1,1)/boot/vmlinuz-6.0.11-custom
          initrd (hd1,1)/boot/initramfs.gz
      }
      
      # Save and quit
      % umount /mnt
      % reboot
      
      # Press F12 on Virtualbox boot logo, select 2nd hard disk and try booting
      # In the GRUB menu, select the second option ("Boot Linux with Initramfs")
      # If all goes well, you will see kernel boot with init ending with "Press Enter..." to launch a new shell.
      
# To use my customized shell profiles for kernel development:
    curl -o - https://files.chandrashekar.info/root_shell_profile.tar.gz | gunzip -c | tar x

--------------------------------------------------------------------------------------------------
# ----- Building Linux kernel for other devices (offline exercises to try out) -----
# RaspberryPI: https://www.raspberrypi.com/documentation/computers/linux_kernel.html
# Buildroot: https://www.raspberrypi.com/documentation/computers/linux_kernel.html
# Linux From Scratch Project: https://linuxfromscratch.org/lfs/read.html
