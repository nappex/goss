---
Title: Installation OpenBSD 7.2 within disk encryption
Date: 2023-03-11
Category: unix, openbsd
Tags: advanced, openbsd, unix
Slug: install-openbsd-encryption
Authors: David
Summary: OpenBSD installation with disk encryption
Status: published
---

[TOC]

# Introduction

This article can be consider as following part to article [how to give a new life
of old computer](https://nappex.github.io/myblog/Acer-V5-431-BIOS-OCC)
particulary to laptop Acer. The main motivation of giving a new life
was to install OpenBSD as main OS. Another motivation was article about Old Computer Chanllenge - OCC.
I am planning if everything happen well, to try using it as my main developing machine.
The following article should be about what to do after installation.

All articles about installation OpenBSD I've met declared that installation process of OpenBSD is so
easy! That's true if we presume that your level of knowledge meets certain conditions.

IMHO level of knowledge should be:

* how to mount disk and how the mounting works
* know the diff between partitioning scheme (table) and partitions
* what means /dev/sd0 resp. /dev/rsd0
* how work disks and their drivers on OpenBSD
* how work RAID and why it is useful (for encryption)

Someone can complain that is not necessary. Yes that's true. You can just follow installation
guide and try to insert defaults which should work in the most cases. And if the defaults won't work,
you will just switch to another option. Especially if you combine this approach with reading
[OpenBSD FAQ](https://www.openbsd.org/faq/index.html) then the success will come for sure.

Honestly I do not like this approach but I understand it. When someone just started and wants
to learn things it is good way to start no matter how. Learn by little steps. It is not possible to
learn everything at the start. Amount of knowledge in IT world is huge.
Maybe I suggest to start with something easier. I've started with Linux distros as Ubuntu, Mint, Fedora.
These distros have easier installation process than OpenBSD in my opinion. When you gain
some knowledge from easier distros then you will enjoy process with openbsd more.
A lot of info metinoned in [OpenBSD FAQ](https://www.openbsd.org/faq/index.html) assume
some your knowledge. Nevertheless the FAQ are written very nice. I had just one problem.
I was hurry and then I overlooked some important information. Read the FAQ carefully.
Most of the time all info you need is mention there but sometimes the info you need is not,
so highligt that you notice it at first sight.
That knowledge can be obtained by reading a several books or by trying things
with user friendly linux distro where a lot things are pre-set for user.

Personally I had some basic knowledge when I was started with OpenBSD installation. Because of
tweaking Linux distros as Mint, Fedora, Debian, Artix, Void in past. Even so I have to read
some books to know what I am doing. I wanted to make the install properly and I want to know
what I've set to my PC. When I have the OS which has features as
open source, flexible, customizable and gives me the power to fully operate my computer
I want to use that advantage. I love the power to operate my PC by my rules and not rely
to external service or settings as Windows or Mac do. Books which I strongly recommend for proper installation
are from [Michael W. Lucas](https://mwl.io/). I really love this author. He writes books with
style which perfect suits to my expectations. He explains things from the ground with the context
and he goes after some introduction context deeper and deeper with language of "ordinary" people.
He does not use difficult technical naming or describiton on every corner if not necessary.
The books which helps me a lot with OpenBSD are [OpenBSD Mastery: Filesystems](https://mwl.io/nonfiction/os#omf)
and [Absolute OpenBSD 2nd edition](https://mwl.io/nonfiction/os#ao2e). The latter book can be little bit
obsolete because it was written at 2014.

Installation starts with laptop Acer V5 431, where I am able to boot both legacy and UEFI.
The tech spec of laptop are:

* Laptop model: Acer V5-431 (BIOS V2.18)
* CPU: Intel Celeron 1007U (2 cores) 1500GHz
* RAM: 4 Gb DDR3 (max is 8GB)
* Disk: Seagate ST500LT012 500GB SATA (find out it by `$disklabel -p g sd0` and check the label)
* Wifi card: Atheros AR9462 (not supported)
* Ethernet: Realtek 8168 (proprietary [dongle](https://www.notebookcheck.net/Review-Acer-Aspire-V5-431-Notebook.83411.0.html#1021134-7))
* GPU: Mesa Intel HD Graphics 2500 (IVB GT1)
* Audio: Realtek ALC269
* Card reader: Realtek RTL8411

The article describes installation of OpenBSD
* version 7.2
* CPU architecture `amd64`
* image filename `install72.img`

# Install preparation

## Hardware review, drivers availability

### CPU

Process unit is amd64 with two cores. Everything should works fine.

### GPU

Laptop contains Mesa Intel HD Graphics 2500, which is supported by OpenBSD driver `intel(4)`.
Manual page for this driver declares that support Intel(R) HD Graphics: 2000-6000.

Only one problem occurs. During startup screen is blinking. When X server is loaded, blinking will stop.
So far I dont know if it is problem with OpenBSD or laptop.

### Wireless network card

Unfortunately my wifi card is not support. OpenBSD does not provide driver for it.
So I solve that issue that I am using external USB wifi card Atheros 9271 which is supported
by driver `athn`. This USB wifi card should be available for purchase in most eshops.

Another USB wifi card which should be fine, working and available in eshops is TP-Link TL-WN722N.
I dont test TP-Link card, but driver `urtwn(4)` listed this WiFi.

There are dozens of USB wifi cards which are supported by OpenBSD, but I found two problems
with them. First problem is that most of them is difficult to buy in eshops and second problem
is that reviews were not quite good about the quality and reliability.

### Ethernet

There is also little problem because laptop contain proprietary
[dongle](https://www.notebookcheck.net/Review-Acer-Aspire-V5-431-Notebook.83411.0.html#1021134-7)
where can be connected either RJ45 or VGA, but special adapter is needed for both.

Fortunately ordinary adapter USB-RJ45 from apple worked fine.

### Disk

Disk is handled by driver `sd` without any problem.

### Audio

Audio is working pretty well without any extra tweaking after installation.

### WebCam

My first attempt failed, but I did not explore too much so far.

### Fucntion key to control volume and screen brightness

The `Fn` on keyboard in combination with other keys. Specifically arrow keys on Acer V5.
This functionality is working out of the box immediately after installation.
It is really cool. Most of the time I had problem with that funcionality on FreeBSD or Linux distros.

### Conclusion

I do not recommend to buy this old laptop for OpenBSD because of problematic network interfaces.
You can handle it with a several adapters, but you will find more old laptops whose network
interfaces will be more compatible (without need of extra adapters) and accexible with OpenBSD.

That is pity because other things working quite well. Unfortunately network interfaces are
really important aspect for comfortable usage in my opinion.

## Wireless network

If your laptop has only wifi card without ethernet socket there is a little problem with driver.
There is problem with driver also if OpenBSD support your wifi card. OpenBSD image does not
contain all available drivers out of the box. OpenBSD does not want to mess your system with
drivers which are not intend to use. I like that approach, but it has a drawback.
You can easily install all available drivers with command `fw_update`. It will detect your
hardware and download just drivers you need nothing more. Unfortunately this command takes
the drivers from internet. If you can not connect to the internet by other option than a wifi.
You have to manually download on other computer particular driver for your wifi, put on USB and
install with `fw_update` manually. Note the install proces does not need the internet.
So you can solve missing driver after installation. Theres are instructions in FAQ chapter
[Bootstrapping wireless firmware](https://www.openbsd.org/faq/faq4.html#WifiOnly). You will
find there a link to all available firmwares and download the needed one.

## Preparation of install media

I'll cover only preparation of USB stick. Nowadays other devices are not use a lot.

### Donwload the right image of OpenBSD

Go to [download page](https://www.openbsd.org/faq/faq4.html#Download). There is main table
where you click the version you want and directly download the image file.

There are some little bit confusing parts. If you directly download image you just download
the image without signing key and without file containing hashes to verify donwloaded image.
Unfortunately further links to these files are not showed at first sight.

You have to look at the first sentence below the table and there is html link to [mirror sites](https://www.openbsd.org/ftp.html).
Currently you can choose the mirror from a list you most prefer. When I was exploring some of these mirrors they look ok.
The latest version of OpenBSD should be found at all of mirrors, but some of mirrors
contains also older version for example the 6.8 and older. On top of that in mirrors you found
all needed files to installation - images, patches, file sets (image contains its, but you can download it separately here).
You will find there the file with hashes, signature file, public key to verify your image.
I strongly recommend to verify every file you download from the internet to avoid future problems.
There is located also file with name `INSTALL.<CPU_architecure>`. This file is very handy because
it describes how to install OpenBSD on specific CPU architecture. If you do not want to read
any book I recommend to you read this file and [FAQ](https://www.openbsd.org/faq/index.html) at least.

To choose right image you have to know the type of CPU architecture. Most of laptops are
amd64 in nowadays, but some of them can be also ARM. Neverthless you should not have a problem
to find image for your CPU architecture if you don't have really exotic hardware.


### Verify the image file

I will not describe how to verify the image. Nice tutorial how to do it is in [Download section](https://www.openbsd.org/faq/faq4.html#Download). Under the table with images available to download. I just mention that you will find
link to public key in text, but there is no link for file with SHA256 hashes and signature.
These files you will find in mirrors link.


### Create install media - USB

There are dozen of articles how to write image file of OS to USB so I will not replicate them.
OpenBSD FAQ show usage with `dd` program on OpenBSD or Linux. You can use `BalenaEtcher` on
MacOS or `RUFUS` on Windows.


# Installation OpenBSD with disk Encryption

It seems that the encryption itself how I am describing will not be necessary from OpenBSD 7.3.
This version should have encryption of disk included in regular installation mode and you will not
have to make it manually from shell.

When you have prepared USB stick as install media boot it, perhaps with `F12`. If OpenBSD booting went well
you should see four option to choose in terminal. (I)nstall, (U)pgrade, (A)utoinstall, (S)hell.
Type a leading letter and enter to confirm the choice. The reason why the letters are in parentheses.
Install ordinary install process. Upgrade I have not used it yet, but it will be likely option when
you have already installed OpenBSD and you want to upgrade it to higher version.
Autoinstall, it should make automatic installation for you, but I did not try it. So I don't know
details. Shell is shell.
If you choose any other option than shell you can enter to shell with exclamation mark `!` and
if you want to return back type exit. It is not recommended to use `Ctrl-C`. This information is written
in prompt. READ carefully what Installer write to you, all needed informations are mentioned there.


## Indetify the disk for installation

Choose from option Shell. Now you can operate your computer from live OpenBSD.
Indetifying disk is one of thing which are not documented well in FAQ. I didn't find it at least.
There is a point when OpenBSD documentation assume that the reader has some basic knowledge.
I did not have it. I suppose all OSes I've tried in past before OpenBSD served me
names and basic info about disk in really nice and easy overview. I saw all connected disks
and the decision which to choose was really without any thinking. OpenBSD will not serve you
these information. When you want to install OpenBSD you have to know which disk you want to use.
Disk names are create from the name of driver which operates the disk and number. Choosing the right
driver for the disk OpenBSD makes automatically. For example we have one SATA disk. SATA disks are
operated by driver `sd`. The name of disk will be `sd0`. If you connect another SATA disk it'll be
`sd1` and so on. USB sticks are operated by `sd` also.

Information about connected disks can be found out with several tools.

### sysctl

First tool is [sysctl(2)](https://man.openbsd.org/man2/sysctl.2) - command to get or set system information.

```sh
$ sysctl hw.disknames
hw.disknames=sd0:,sd1:,wd0:ced4326a18397569,cd0:
```

It lists all connected disks, if there is hex number after identificator it means Filesystem was recognize by
OpenBSD. If not there is no native filesystem to OpenBSD on disk (native filesystem is FFS).

Advantage is - easy command to memorize. Quick usage to get quick basic overview about disks.

Disadvantage of this tool is you do not see details about disk. Only the name and if
the filesystem is native to OpenBSD.

### dmesg

Other tool for to find out connected disks is [dmesg(8)](https://man.openbsd.org/dmesg) (display the system message buffer).
We can review startup messages, info during boot with this command. There are messages
about which disks were connected.

```sh
$ dmesg | grep -E '^[wsc]d\d+'
```

We grep output for names of expected disk drivers as `wd`, `sd` and `cd` with
at least one number and the name must be at the start of line. We don't see only the name
of connected disk but also the sizes and other details. Details are not written in well arranged way.
So sometimes you have to read carefully and finding the information in output. Especially
if output is longer.

Advantage - details about disk, you have option to play with pipes and make better output.

Disadvantage - write the right form of regex and format the output can be challenging for some users.

### fdisk

If you want to use `fdisk` you have to know which disk you want to analyze. This
command needs disk name as argument. You will have to list available disks with
`sysctl` and then you can each analyze. Finally you find out from output info which disk
is the rigth for installation. The output will be more detailed if you use `verbose` option.

```sh
$ fdisk -v sd0
```

### disklabel

Same approach as for `fdisk` can be used for `disklabel` command. Disklabel just print out
different output than `fdisk`.

You can check sizes of disk by:

```sh
$ disklabel -p g sd0
```

or `verbose` option

```sh
$ disklabel -v sd0
```

There is keyname `label` which show manufacture name of your disk. It could help you for example.

### Conclusion

Someone can complain that's really annoying approach. Maybe it is not really user friendly.
In my opinion it is not so much horrible. I was enjoying the juggling with several tools and the
investigation process to collect info about disk.

Honestly I am really happy that OpenBSD do it like that. I've learned a lot by this way.
It pushed me to learn how do it and why... Now I know what is under the hood.
When you will use operation system which show you disk and everthing about them, you don't have any
reason to learn or dig where the information come from until problems occur.
I have to admit that I like user friendly gui window where all info about disk are listed
and you just click to disk which you want to choose without any work too.
But I feel much better when I know what is happening behind the scene. And what to do manually
if automatic process will fail.

## Fill your disk with random data

New harddisks are filled with zeroes or ones. If you install OS on you laptop some parts change
to real data. Aversary can recognize which parts of disk is used for real data and which parts
are unused.

Firstly, we have to create special files which will be representing your disk. If you are
little skilled in unix you know that is files located in `/dev`. These files are created automatically
on other unix most of the time. In OpenBSD you have to make it manually if you handle your disk
from shell by script `MAKEDEV`.

```sh
$ cd /dev && sh MAKEDEV sd0
```

You have to change directory to dev, because `MAKEDEV` will create special files in
current dir. Then just run script on the disk. It will create file sd0a, sd0b, ...., sd0p
and rsd0a, rsd0b, ...., rsd0p. sd0<letter> is just ordinary special files for your disk. This
file you will want to use most of the time. rsd<letter> is raw representation of data in your disk.
This file you will use if you will want to write data on your disk by special way. Carefully
check if is used sd or rsd in command.

To write random data on your disk use command below, when you created special files in your
dev directory.

```sh
$ dd if=/dev/urandom of=/dev/rsd0c bs=1m
```

It can take a long time. For 250GB SSD disk it takes about 2 hours. Theres is `rsd0c`
so we using raw special file. Partition `c` is intended for whole disk in OpenBSD.

## Prepare disk for encryption

If you want to encrypt your disk you have to prepare disk from shell before installation.
This should not be needed from OpenBSD 7.3.

OpenBSD uses two commands for disk preparation.

`fdisk` - is used to create partition scheme (table) as GPT or MBR.

and

`disklabel` - is used to create one or more partitions(logical subsections of harddisk) on disk.

OpenBSD makes encryption with RAID. We have to prepare disk as RAID. Finally we can use special
features of RAID to encrypt the disk. We can imagine as the low layer is physical disk,
another layer is software representation of disk by operation system and finally we create
another layer RAID where encryption is applied.

### Create partition scheme

I cover only creation of GPT scheme. It is most used partition scheme, currently.

```sh
$ fdisk -gy -b960 sd0
```

Option `-g` create GPT scheme. Option `-y` answer to all question yes.
Option `-b960` reserved first space of disk to EFI, boot, PMBR and so on. This space
will be used for booting. More info can be found [boot_amd64(8)](https://man.openbsd.org/boot_amd64.8)
or [boot(8)](https://man.openbsd.org/boot.8)

### Create partition as RAID type

When we've created the partition scheme we can fill the scheme(table) with partitions.
We will need just one for whole disk with RAID type.

To create partitions we use command `disklabel`.

To edit partitions on certain disk use command:

```sh
$ disklabel -E sd0
```

It invokes new edit prompt.

```sh
sd0> a a
```

First `a` means add partition, second `a` means partition with name `a`.

Other lines are about the setting of new partition. Size, type, etc...

```sh
offset:[64]
size:[9999] *
FS type:[4.2BSD] RAID
sd0*> w
sd0>q
```

Offset, just enter the default value. For size write asterisk `*` to choose whole disk.
FS type choose `RAID`. We need RAID type to encrypt it. OpenBSD can encrypt only RAID.

Finaly `w`, means write changes to disk. `q` means quit edit prompt of disklabel.

### Encrypt the disk

Currently we have disk `sd0`, we've already created special files `sd0` and `rsd0` in `/dev`.
Then we've already create partition scheme GPT on disk and finally create one partition
marked with letter `a` as whole disk.

Command to manage RAID in OpenBSD is `bioctl`.

To encrypt prepared disk write:

```sh
$ bioctl -c C -l sd0a softraid0
New passphrase:
Re-type passphrase:
sd1 at scsibus2 targ 1 lun 0: <OPENBSD, SR CRYPTO, 005> SCSI2 0/direct fixed
sd1: 19445MB, 512 bytes/sector, 39824607 sectors
softraid0: CRYPTO volume attached as sd1
```

Option `-c` is to select RAID discipline(raidlevel). `C` discipline is encrypt discipline to encrypt disk.
For example discipline `1C` means `RAID1` + `CRYPTO` = encrypting and mirroring disks discipline.

Option `-l` select disk to encrypt.

softraid0 is softraid managment device node.

It is important to notice that it creates a whole new virtual disk `sd1`, which is created from `sd0a`.

We encrypt the disk with a password. It means we create a key which is located at disk and we just
make password for this key. It has advantage that we can change the password any time we need.

There is an option to create key and save to disk. Official documentation of OpenBSD label as Keydisk.
There are also instructions how to make key disk. This approach is probably more safe, but
you can not change the key. It is really recommended to create backup of key disk if you
choose this option.
Personally I did not try to create Keydisk. I'd like to try in future. Then I'll update this section.

### Add zeroes at the start of disk

It is recommended fill start of new disk with zeroes, because info about softraid at the start
can confuse kernel.

To add zeroes run:

```sh
$ dd if=/dev/zero bs=1m count=1 of=/dev/rsd1c
```

Currently, we have prepared encrypted disk `sd1` for installation. Now you can write `exit`
to go back to installation.

## Installation

I don't cover all questions just the most important in my opinion.

**Which disk is the root? sd1**

It is a disk we created with encryption from RAID partition.

**Setup a user? <username>**

I recommend to create a new user. But you can create it later if you want.

**Start sshd(8) by default?[yes] no**

It can be enabled later. If you want to use as laptop I assume you don't need sshd.

**Do you expect to run X Window System?[yes]**

If you are installing on laptop, yes will be probably the right answer.

**Do you want the X Window System to be started by xenodm?[no] yes**

X Window System can be started by `startx` or `xenodm`. `xenodm` should be more secure.
If you are not sure you can choose no, it can be enabled later.

**Use (W)hole disk MBR, whole disk(G)PT, ... (E)dit? [whole] G**

It sets the partition scheme.
Use what is suitable for you. This article uses GPT.

**Use (A)uto layout, (E)dit auto layout, (C)ustom? [a] c**

It sets layout of partitions.
Custom layout invoke `disklabel` command to editing prompt.

There are several rules to follow.

* Don't add partition with letter `c`. This partition is reserver by OpenBSD for whole disk.
* If you use GPT scheme automatically (set by installer). Don't use partition `i` it reserved by default
to EFI boot.

There are several recommendations.

* Use partition `a` for mountpoint `/` (root).
* Use partition `b` for swap.

Example of layout. It does not include sizes, because it depends on your needs and size of
your harddisk.

PARTITION   |   Mountpoint  |   Note
----------- | ------------- | ------
 a          | /             | root
 b          | swap          | swap space
 c          |               | whole disk
 d          | /tmp          | temporary files
 e          | /var          | variable data
 f          | /usr          | user system resources
 g          | /usr/X11R6    | X applications
 h          | /usr/local    |
 i          |               | EFI BOOT
 j          | /usr/src      |
 k          | /usr/obj      |
 l          | /home         |


**Location of sets? (cd0 disk ...)  [cd0] disk**

This question can be little bit complicated.
Disk means sd0, sd1, wd0, .... USB stick is disk.
Sets mean file sets to install. File sets are locate on USB stick.
Unfortunately the USB stick itself is not mounted. We just boot OpenBSD to RAM, but
USB is not mounted.
We select disk, because installation is from USB. Then we have to choose which disk is
out USB.

**Is disk already mounted [yes]: no**

**Which disk contains install media [sd0]: sd2**

Most of the time `sd0` is main harddisk. USB should be `sd1` or `sd2`.
This part will mount your USB.

**Which sd2 partitions has install sets [a]:**

Select default a.

**Pathname to sets [7.2/amd64]:**

Select default.
Then select sets which you want to install. How to select or deselect is nicely described
in installer.

Congratulations!

After sets install, the installation is done.
When you restart your laptop it should ask you for password to de-encrypt harddisk.

I'd like to make other articles about steps after installation. There will be info about
how to setup you `cwm`, `xterm`, `X Window System` or how speed up your system.

