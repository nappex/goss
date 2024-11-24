date: 2024-09-07
title: How to inspect and solve problems with your home WiFi

## Intro - description of my problem

I had a problem that WiFi kicked my macOS laptop time to time from my home router. Even though the laptop was not kicked off the
quality of the connection was terrible, but not always. Sometimes the time of loading pages was unacceptable to any work, but WiFi was connected and the icon of WiFi strength showed 2 from 3. It was really strange situation. Do not believe icons if you have problem with connection, there is a huge space for mistakes. Use real precise data instead.
There were days when the connection was relatively OK, but some days I was unable to connect to my WLAN.
The speed of my wifi connection varied from 2 Mbps to 140 Mpbs, it was a huge range.
I've tried other laptops and devices from same place where the problem with macOS occurred and the signal was much more stable.

## What can be the reason of problems

**1. Strength of WiFi signal (RSSI)**

RSSI (**R**eceived **S**ignal **S**trength **I**ndicator) is the relative received signal strength in a wireless environment. RSSI is an indication of the power level being received by the receiving radio after the antenna and possible cable loss. Therefore, the greater the RSSI value, the stronger signal. Value of RSSI is in dBm (decibel-milliwatts)[[2]]. The rule is the higher value means stronger signal, but be careful value is a negative number. So value close to 0 is stronger signal. Range 0 to -51 dBm is really strong signal. Signal above the -71 dBm is consider as a weak. I have around -70 dBm and have no problems to surf internet or having a call. Very weak signal is consider between -80 and -100 dBm.

**Ordinary range is from -35 to -74 dBm.**

**2. EIRP**

EIRP (**E**ffective **I**sotropic **R**adiated **P**ower) is close to RSSI and it means **actual amount of signal leaving the antenna** and is a value measured in db and is based on 3 values:
    1. Transmit Power (dBm)
    2. Cable Loss (dB)
    3. Antenna Gain (dBi)

**Units dB**

The dB measures the power of a signal as a function of its ratio to another standardized value.
The abbreviation dB is often combined with other abbreviations in order to represent the values that are compared. Here are two examples:

- dBm, The dB value is compared to 1 mW
- dBw, The dB value is compared to 1 W

You can calculate the power in dBs from this formula:

`Power (in dB) = 10 * log10 (Signal/Reference)`

This list defines the terms in the formula: `log10` is logarithm base 10.

Signal is the power of the signal (for example, 50 mW).

Reference is the reference power (for example, 1 mW).[[1]]

Equation to calculate EIRP is:

`<Transmit Power> - Cable Loss + Antenna Gain = EIRP`

For example a Cisco 1242AG running at full power with these values on antenna:

- 6dBi (802.11a radio)
- 2.5dBi (802.11bg radio)

So then equations are:

- **802.11a** `EIRP = 17dBm (40mw) - 0dB + 6dBi = 23dBm = 200mw of actual output power`
- **802.11bg** `EIRP = 20dBm (100mw) - 0dB + 2.5dBi = 22.5dBm = 150mw (approx) of actual output power`

Based on the example above, in theory, if you were to measure it right at the antenna you should get a RSSI of -23dBm or -22.5dBm respectively.[[1]]

**3. Noise**

Other electronic device as:

- microwave
- cordless phones
- bluetooth

or other which operates on the same or adjacent frequency bands as your WiFi (2,4 GHz or 5 GHz) interfere with your WiFi negatively.[[3]]
The signal which negatively interfere with waves from WiFi is called **Noise**.
The higher noise, the WiFi signal is weaker.
The value logic is same as for RSSI, unit is dBmi, and value close to zero is really strong noise. When value is closer to zero then WiFi signal will be more unstable.
Noise should be as small as possible.

**Ordinary Noise is in range from -90 dBm to -95 dBm**. If you have noise below you should try to find some electronic device which is the source of the noise.

**4. Signal to Noise Ratio (SNR)**

**S**ignal to **N**oise **R**atio sometimes called as abbreviation SNR is:
    - The power level of the RF (radio-frequency) signal relative to the power level of the noise floor. It is the **ratio** of **signal power** to the **noise power** which corrupting the total signal.[[1]]
or by other words
    - measurement of how much relevant WiFi signal there is compared to any other signals that can get in the way.[[3]]

Mathematically it is a difference between RSSI and Noise:

`SNR = RSSI - Noise`

Example:

`SNR = RSSI - Noise = -70dBm - (-95dBm) = 25dBm`, Singal to Noise Ratio is 25 dBm

General rule is that SNR above 20 dBm is good signal.[1]
A higher SNR indicates a cleaner and more reliable signal, while a lower SNR suggests that the signal is being drowned out by noise.[[3]]

SNR was my problem my SNR was between 3 - 10 dBm, because of high noise value. If noise value is similar to signal value then problem with connection always occurred.

**5. 2.4 GHz or 5 GHz**

There are a plenty of articles which describes their difference, but the main difference is that 5GHz has better data bandwith and speeds up your connections.
Conversely 2,4GHz emits signal better over obstacles as wall and to longer distance.
So sometimes you have bad connection because you are connected to 5GHz and your location far away from router or behind several walls or combination of both.


## How inspect WiFi on macOS
Inspection of RSSI level and noise level is pretty easy on macOS. Just hold your option key and right click to WiFi icons in the top right corner.
Then the window is showed with detail information about your WiFi connection as IP address, channel, RSSI, Noise, Tx Rate and so on.

![macOS WiFi window with detailed info](/images/macos_wifi_window.png)
## How inspect WiFi on OpenBSD

Unfortunately I've no idea how to check Wifi on OpenBSD properly.
There is `ifconfig` command to use, but there are not listed parameters of WiFi separately listed. There is only strength of the WiFi signal in perecentage.

If someone knows how to get precise value of dBm for noise and RSSI please let me know.


## Steps to solve problem with WiFi

1. Do not buy a new device if you do not know where is a problem
2. Get real data of your connection to analyze where can be a problem
3. Get RSSI value
If RSSI low
    - move closer to your router
    - compare RSSI value between several laptops, to find out if it is problem of receiving device (laptop) or sending device (router)
    - compare several laptops at same location (same path (distance, obstacles) from router)
4. Get Noise value
If noise is high
    - consecutively turn off all device which can be a source of noise. It can be any electronic device around your laptop or router, or something in path of radio waves from WiFi
    - compare noise value between several laptops
    - compare several laptops at same location
5. Restart all related devices
6. Update all related devices
7. Disconnect all devices from network and keep only trouble one if problems persist
8. Check forums for your devices
9. Check date and time on router and particular laptop
10. Absolutely last option is repairing or buying a new devices

## What was my problem

My problem was the high value of Noise which was around -75 dBm in combination little weaker RSSI. Result was low SNR.
This problem occured only on one laptop. So I try eliminate electronic device which can cause the high value of Noise.
Finally I've found that the problem of noise was little USB Hub I-tec connected to my laptop. When I disconnected this Hub
from my laptop Noise immediately update to ordinary value between -91 - (-95 dBm) and my connection was stable as a time ago.

![USB hub I-tec front](/images/usb_hub/1.JPG)
![USB hub I-tec back](/images/usb_hub/2.JPG)
![USB hub I-tec internals](/images/usb_hub/5.JPG)


## Sources
1. [CISCO community]
[1]: https://community.cisco.com/t5/wireless-mobility-knowledge-base/snr-rssi-eirp-and-free-space-path-loss/ta-p/3128478
[CISCO community]: https://community.cisco.com/t5/wireless-mobility-knowledge-base/snr-rssi-eirp-and-free-space-path-loss/ta-p/3128478
2. [RSSI wiki]
[2]: https://en.wikipedia.org/wiki/Received_signal_strength_indicator
[RSSI wiki]: https://en.wikipedia.org/wiki/Received_signal_strength_indicator
3. [velocenetwork - What is wifi RSSI]
[3]: https://www.velocenetwork.com/tech/what-is-wifi-rssi/
[velocenetwork - What is wifi RSSI]: https://www.velocenetwork.com/tech/what-is-wifi-rssi/
4. [netspotapp - signal to noise]
[4]: https://www.netspotapp.com/wifi-troubleshooting/signal-to-noise-ratio.html
[netspotapp - signal to noise]: https://www.netspotapp.com/wifi-troubleshooting/signal-to-noise-ratio.html
