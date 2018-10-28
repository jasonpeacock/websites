---
title: Home Networking
subtitle: It's complicated
author: Jason Peacock
date: 'October 28, 2018'
toc-title: Table Of Contents
---

## Go Professional

If your home networking needs are simple[^simple_home_network], get a [consumer wireless router](https://thewirecutter.com/reviews/best-wi-fi-router/).
But if you need more from your home network, don't settle for consumer networking equipment.

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

I was tired of trying, I wanted a professional solution that just worked.

### Equipment

* 1x USG
* 2x AP-AC-LITE
* 1x Cloud Key

### Configuration

Workaround for an issue in the latest version of the USG software: [Bug: USG3 randomly dropping WAN. Workaround: disable the Uplink Connectivity Monitor & Speed Test](https://community.ubnt.com/t5/UniFi-Routing-Switching/Bug-USG3-randomly-dropping-WAN-Workaround-disable-the-Uplink/td-p/2544759)

## Ad Blocking
