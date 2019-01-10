---
title: Home Networking
subtitle: It's not that complicated
date: 'October 28, 2018'
toc-title: Table Of Contents
---

## Go Professional

If your home networking needs are simple[^simple_home_network], get a [consumer wireless router](https://thewirecutter.com/reviews/best-wi-fi-router/).
But if you need more from your home network, you'll be frustrated with consumer networking equipment.

[^simple_home_network]:
A single WIFI router provides full coverage and you only need a single WIFI network/SSID.

Don't be afraid to use professional networking equipment. Unfortunately, small-business networking equipment
like [Cisco](https://www.cisco.com/c/en/us/solutions/small-business.html) or [Aruba](https://www.arubanetworks.com/)
are too expensive for most homes, but [Ubiquiti](https://www.ubnt.com/) is reasonably priced and provides
all the features you need for your home network.

## My Setup

### Requirements

I have a number of requirements beyond simple home networking. Primarily, a single WIFI router does not provide
full coverage for my house: I have a ranch-style home that is very long[^house_length]; there is no central location for
a WIFI router that provides a strong signal everywhere. Most frustratingly, the signal was weakest in the garage
(my workshop) and the master bedroom, and there was no signal at all in the yard.

[^house_length]:
120 feet!

At the same time, with the growth of the Internet of Things (IoT), I now have multiple Amazon Echos & Dash
buttons, Sonos speakers, [digital art frame](https://www.electricobjects.com/),
[weather station](https://www.ambientweather.com/amws1000wifi.html),
[air quality monitor](https://www.purpleair.com/sensors), Raspberry Pis, smart TVs, and more. Because IoT devices
are infamous for their [poor network security](https://www.google.com/search?q=iot+security+attacks) I want them
on their own network, segregated from my primary home network.

I attempted to solve these issues with consumer equipment - I tried (multiple times) using an older WIFI router
configured as an access point to extend the range, but configuration was difficult and error prone. I tried
using WIFI range extenders, but they were just as flaky and difficult to configure. I tried configuring multiple SSIDs
and controlling their access in the router, but again configuration was difficult.

I was tired of trying; *I want a professional solution that just works*.

### Equipment

*Listed roughly in order of connection.*

[Arris SURFBoard SB6141 DOCSIS 3.0 Cable Modem](https://smile.amazon.com/dp/B00YUU5628)
:    My ISP is Comcast Xfinity, so I need a cable modem. Renting their cable modem is expensive and is managed
     by them - [they enable a public WIFI hotspot by default](https://www.xfinity.com/support/articles/disable-xfinity-wifi-home-hotspot).

[UniFi Security Gateway (USG)](https://www.ubnt.com/unifi-routing/usg/)
:    The brains of the network - it manages the LAN, VLAN, and WLAN, with multiple SSIDs, sandboxing of networks,
     DHCP service, and bridges my home network to the ISP's network.

[D-Link 24-Port Rackmountable Gigabit Switch DGS-1024D](https://www.amazon.com/D-Link-24-Port-Rackmountable-Gigabit-DGS-1024D/dp/B0002TPFTA)
:    Connects everything in the server closet and all Ethernet ports around the house. If a device is stationary
     (Sonos, Fire TV, etc) then it uses Ethernet instead of WIFI.

[UniFi AP AC LITE](https://www.ubnt.com/unifi/unifi-ap-ac-lite/)
:    The actual WIFI access points, they are connected via POE Ethernet to the switch, and are managed by the USG.
     There is one at each end of the house to provide full coverage across the house and yard.

[UniFi Cloud Key](https://www.ubnt.com/unifi/unifi-cloud-key/)
:    The cloud key is not required, you can run the controller software on your own PC. The cloud key gives you
     "always on" access and metrics, it is also connected to the switch. I managed the home network for 2 years without
     the cloud key, but I really like having the metrics continously recorded, including a speedtest of the ISP.

[Adafruit Ad Blocking Kit for Pi-Hole](https://www.adafruit.com/product/3974)
:    Block ads & tracking on the home network for all devices. Using ad-blocking plugins for browsers is simple enough,
     but it's harder to setup ad-blocking for phones, tablets, etc. The solution is to block ads at the network level,
     using DNS to route ad requests to a blackhole.

### Configuration

Workaround for an issue in the latest version of the USG software:

* [Bug: USG3 randomly dropping WAN. Workaround: disable the Uplink Connectivity Monitor & Speed Test](https://community.ubnt.com/t5/UniFi-Routing-Switching/Bug-USG3-randomly-dropping-WAN-Workaround-disable-the-Uplink/td-p/2544759)


## FAQ

**Why don't you use [Eero](https://eero.com/) to solve the WIFI coverage problems?**

The drawback to mesh networking, and WIFI range extenders in general, is they are simply repeaters for existing WIFI,
and can only provide as much bandwidth as the original WIFI link. If you have two repeaters on the same WIFI, they
must share the original WIFI's bandwidth, at worst providing only 50% if each are fully utilized.

I want full bandwidth available for all WIFI devices, which requires access points connected to Ethernet instead
of simply repeating the WIFI signal.

This is probably overkill, as most devices never fully utilize the available WIFI bandwidth.

## Appendix

### Internal Endpoints

* Cloud Access: [https://unifi.ubnt.com](https://unifi.ubnt.com)
* USG (router): [https://192.168.1.1](https://192.168.1.1)
* Cloud Key: [https://192.168.1.103](https://192.168.1.103)
* Controller: [https://192.168.1.103:8443](https://192.168.1.103:8443)
* Pi-Hole: [http://192.168.1.116/admin](http://192.168.1.116/admin)

