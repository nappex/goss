date: 2026-04-06
title: How to run Geekworm x735 script on Freedombox

## Overview

When I installed the x735 script by the official [guide](https://wiki.geekworm.com/X735-script) to [FreedomBox](https://freedombox.org/), then the fan of my X735 V2.5 Power Management Board was not rotating at all.

See below the hardware and software specification when I struggled with this problem.

Hardware kit:

- Raspberry Pi 4 Model B
- X825 V2.0 2.5" SATA HDD/SSD Storage Board
- X825-C8 Case
- X735 V2.5 Power Management Board

```console
$ sudo dmesg | grep -i rasp
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.4
```

```console
$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 13 (trixie)
Release:        13
Codename:       trixie
```

```console
$ uname -a
Linux freedombox 6.12.74+deb13+1-arm64 #1 SMP Debian 6.12.74-2 (2026-03-08) aarch64 GNU/Linux
```

### Errors

Errors which I've got during testing...

```console
$ sudo python3 pwm_fan_control.py
Traceback (most recent call last):
x735-script/pwm_fan_control.py", line 10, in <module>
IO.setup(servo,IO.OUT)
RuntimeError: Mmap of GPIO registers failed
```

## How to solve

Firstly I will show outputs which could affect the function of the [fan x735 v2.5](https://wiki.geekworm.com/index.php/X735).

```console
$ ls /sys/class/pwm/
pwmchip0
```

```console
$ ls /sys/class/pwm/pwmchip0
device  export  npwm  power  pwm1  subsystem  uevent  unexport
```

```console
$ sudo dmesg | grep -i pwm
```

```console
$ sudo dmesg | grep -i overlay
```

```console
$ ls /boot/firmware/overlays/
hifiberry-dac.dtbo  pi4-spidev.dtbo  README.md
```

By the last command is obvious there are only two overlays installed by default.
None of these seems as the right one for pwm-2chan.

### Solution

The solution is to add missing overlay, because when I add all available `pwm*` overlays from [GitHub raspberry](https://github.com/raspberrypi/firmware/tree/master/boot/overlays) then the fan started rotate!

The problem is that I do not know how to properly add the overlays to the system if should be
- the whole kernel recompiled with new overlays, or
- there is some interface/framework for adding the overlays, or
- download the raw file from [GitHub raspberry](https://github.com/raspberrypi/firmware/tree/master/boot/overlays) to `/boot/framework/overlays` is just enough

I choosed the last one as the simplest one for me.

```console
curl -s https://api.github.com/repos/raspberrypi/firmware/contents/boot/overlays |
jq -r '.[] | select(.name | startswith("pwm")) | "\(.download_url)"' |
wget -i - -P /boot/firmware/overlays/
```

The command above will download all overlays which begin with `pwm`.
Honestly not all of these are required, but I do not have a time tested by one by one or some right combination of files,
but just the file `pwm-2chan.dtbo` did not work for me so I downloaded all these files and the fan start correctly rotating.

## Other tips

Do not edit `/boot/firmware/config.txt` directly, then udpate could rewrite this file on debian and fan will stop working.

Instead edit the `/etc/default/raspi-firmware-custom` as is adviced in `/boot/firmware/config.txt`

```console
$ cat /boot/firmware/config.txt
# Do not modify this file!
#
# It is automatically generated upon install or update of either the
# firmware or the Linux kernel.
#
# If you need to set boot-time parameters, do so via the
# /etc/default/raspi-firmware, /etc/default/raspi-firmware-custom or
# /etc/default/raspi-extra-cmdline files.
```

```console
$ cat /etc/default/raspi-firmware-custom
# configuration for x735 script of geekworm
dtoverlay=pwm-2chan,pin2=13,func2=4
```

## Helpful resources to solve similar problem

- [Official rpi overlays README](https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README)
- [Documentation overlays, device trees and parameters](https://www.raspberrypi.com/documentation/computers/configuration.html#device-trees-overlays-and-parameters)
- [Customize Linux Kernel to add new hardware support on RaspberryPi](https://bootlin.com/blog/enabling-new-hardware-on-raspberry-pi-with-device-tree-overlays/)
- [raspberrypi-utils, collection of useful scripts](https://github.com/raspberrypi/utils)
- [dtmerge, dtoverly(tool for applying pre-compiled overlays to a live system) and dtparam](https://github.com/raspberrypi/utils/tree/master/dtmerge)

