---
Title: Acer V5 431 problems with BIOS(Legacy, UEFI), preparation to UNIX
Date: 2023-01-28
Category: Hardware, OpenBSD
Tags: hardware, beginner, OpenBSD
Slug: Acer-V5-431-BIOS-OCC
Authors: David
Summary: Enter to BIOS or boot menu at start-up of Acer V5 431 with windows 10
Status: published
---

[TOC]

# Introduction

One day when I've been scrolling my mastodon wall to find some interesting people
or articles about BSD, I've found account [@prahou](https://bsd.network/@prahou) and his [blog](https://triapul.cz/).
There was a very nice article [Old Computer Rescue - E4300](https://triapul.cz/automa/vyvjnb/), that
article inspired me to dust off 10 years old **Acer Aspire V5 431**. I've wanted to buy some old hardware
as DELL or Lenovo to install FreeBSD or OpenBSD, but I could not decide to right one. When I' ve read
the article and discovered [OCC](https://occ.deadnet.se/), I supposed it would be realy a pity to not
try old computer which lay down at home. Buying another old laptop would be pointless in my case.
Acer is no silver bullet for sure, I definitely prefer DELL, Lenovo or HP, but Acer should be
 suitable for my purposes at least for a while.

Firstly I've analyzed the laptop. I found out the laptop is running and there is installed very laggy windows 10.

# Problem to boot BSD or Linux with Acer V5 431

I've inserted USB with OpenBSD to find out if I am able to install it. So I've turned on the
laptop and pressing the button **F12** as much as possible to invoke boot menu, but nothing happened.
Just Windows booted without any signs of boot menu or USB boot.

# I can not enter to BIOS on Acer V5 431

OK, if I can't invoke a boot menu to choose option booting from USB I have to check BIOS settings.
So I've turned on the laptop again and pressing the button **F2** as much as possible to invoke BIOS settings
but nothing happened again, just windows boot...

Let's google it. I found out that there is a option to get to BIOS through the Windows settings.

When I logged to windows I had to go to settings:

`Windows settings -> Recovery –> Advanced start-up -> Restart now...`

After restart, in the blue screen pick up:

`Troubleshoot -> Advanced options -> UEFI Firmware Settings`

Finally I am in BIOS, AAALELUA. I found option to enable boot menu with **F12**, OK let switch to enable!
Changes saved and exit the bios. Turn off, turn on ... pressing **F12**....blablabla... nothing happend.

I replicated the whole process to get into BIOS. I analyzed BIOS options again to find out
which option could help me to activate function of button F2 and F12 during start-up time of laptop.
There was not any other option, unfortunately. My first idea was that Acer and Windows are entangled
together to lock user in windows space and don't let anybody boot any other OS.

I don't know why but I supposed that if I change UEFI BIOS mode to Legacy BIOS, everything will repair itself.
I could not be far from the truth. After that change I could not boot windows any more and I could not enter to
BIOS any more. Laptop sent me a message, you don't catch me bastard! There will be only Windows man, deal with it.
On the other hand I was able to boot BSD or Linux with Legacy mode.

Thanks to my inconvenience I made laptop where I can install or boot the BSD or the Linux,
but I can not get data from windows and I can not get to BIOS or boot menu. Even though
 I was able to boot USB, it was only because there wasn't other OS on HDD with first priority of boot.
So even if I installed a new OS I would not be able to boot another USB anymore after installation, because of absence boot menu. I would have to remove OS to boot USB. The reason of USB boot is there is no other OS to boot in boot order.
BIOS did not find windows to boot because efi boot is not able to boot in legacy mode.

At this moment I realized I have to find solution to repair invoking boot menu and boot settings
 regardless if I can boot Linux or BSD in Legacy BIOS.

There are several ways what someone wants to do at this point:

1. **Repair invoking boot settings and boot menu at start-up**

`a. Update BIOS firmware`

_or_

`b. Reset BIOS - I am not sure if this option can repair it...`

2. **Save data from installed Windows 10**

`a. Switch BIOS from Legacy mode back to UEFI (Acer Aspire V5 431)`

_or_

`b. Mount Harddisk with windows in Linux or BSD and copy the data`

_or_

`c. Connect HDD with windows to another PC with any OS`

## Repair invoking boot settings and boot menu at start-up

### Update BIOS firmware

I was not sure if updating will repair pressing F2 or F12 at start-up, but I guessed it could.

The update of BIOS can caused brick of your computer, if you decide for update, then
backup your data definitely.

Especially Acer is known with bad reputation about quality of their updates or drivers.
Experienced friend of mine was updating BIOS of Acer in past and he made a brick.

When I [backuped data](#mount-harddisk-with-windows-in-linux-or-bsd-and-copy-the-data) on laptop
I downloaded latest official BIOS/Firmware ver. 2.18 from
Acer [support site](https://www.acer.com/gb-en/support). Problem was how to install downloaded
firmware when I can not boot a windows.

There are several ways how could be done.

1. **Update from regular installation of windowsi** after I [switch Legacy to UEFI](#switch-bios-from-legacy-mode-back-to-uefi-acer-aspire-v5-431) succesfully.
This way was for me succesfull. When I updated the BIOS to the latest available version, the
 buttons **F2** and **F12** started work by expected way.

2. **Windows recovery USB**
I was trying to install with command line which is accesible from windows recovery USB.
Recovery USB was able to boot even if legacy mode was set.
When you are in command line you have to find where your USB is connected. I mean if
it is connected on D:, F: or other letter...
You can try command `wmic logicaldisk get name` to list all connected disk.
When you find the right letter of disk (your USB) just run file (.exe or .bat) to update
 by write full path of file.
Unfortunately, I've got always errors even if I've tried different versions of available BIOS firmwares.

3. **Boot installation files od update during startup**
Unfortunately, same problem as command line desribed above.
There is only different, that if you'd like to make recovery USB of Win10 you need pc with Win10 and so on.
It can be a challenge and time consuming to find PC with Win8 for example.
But you can download any windows version as installation media from microsoft web site.
There are Win 7, 8, 10 ...

I tried recovery USB created from Win10 and installation USB was created from Win8 iso file.
Neither version above helped to update BIOS from command line.

I've read advice on the internet that updating BIOS will reset its configuration to default
 for sure and after that Legacy mode will switch back to UEFI, but I was not able to update
 BIOS other way then from regular installation, so I had to switch back to UEFI by another way.

## Save data from installed Windows 10

### Switch BIOS from Legacy mode back to UEFI (Acer Aspire V5 431)

1. **Use recovery windows USB or windows installation USB**
Unfortunately, neither of these helped me, because I did not find in advanced setting the
option UEFI Firmware Settings for going to BIOS as from regular installation of Windows.

2. **Reset BIOS (clear CMOS)**
This task can make a brick from your laptop before you will do that I strongly advice you
to [backup your data](#mount-harddisk-with-windows-in-linux-or-bsd-and-copy-the-data).

I was searching how to reset BIOS by remove an internal battery of BIOS. Instead of removing
battery I found an [advice](https://www.ifixit.com/Answers/View/227350/No+Access+to+ACER+ASPIRE+V5+471+Bios+(Operating+System+Not+found)) to short two copper pins with shape of triangle under note G2101
located on MotherBoard, see pictures below.


First remove this cover on the back of the laptop.

![Plastic cover]({static}/images/remove_cover.jpg)

If you have a RAM above the pins you have to remove the RAM.

Then just short two pin below the G2101 for 20 - 30 second with for example steel tweezer.
Finally disconnect cable leading under the case of laptop of left side.

![Cooper pins G2101]({static}/images/motherboard.jpg)

Disconnected cable under the plastic case of laptop.

![Disconnected cable]({static}/images/remove_cable.jpg)

Firstly I was little scaried about to short some contacts on motherboard and
it sounds crazy and really dangerous to me. But this approach really work for me
and it restart the BIOS back to default configuration. After this reset I was able to
 boot installed windows 10 again.

### Mount Harddisk with windows in Linux or BSD and copy the data

Before I started do quite dangerous task as short circuit on motherboard or install BIOS firmware
I copied all important data from disk without a need to take out the whole hard disk from laptop.

I boot Artix with GUI and mount hard disk with windows.

```
$ mkdir /run/media/windows_data
$ mount -t ntfs /dev/sda4 /run/media/windows_data
```

Instead of `/dev/sda4` put your device.
Your data will find under `/run/media/windows_data`.


# Conclusion

After all if you have a problem that buttons F2 and F12 are not working at the start-up
of laptop just update your BIOS.

If you switch BIOS to Legacy by accident and you need to switch back to UEFI to boot windows
just short two cooper pins for 20 - 30 second to reset your BIOS.

# Next step

Next step will be installation of OpenBSD.

