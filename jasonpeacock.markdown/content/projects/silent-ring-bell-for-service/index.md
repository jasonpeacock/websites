---
title: Silent "Ring Bell for Service"
subtitle: A big sign for a little button
date: 'January 10, 2019'
toc-title: Table Of Contents
header-includes: |
    ```{=html}
    <link href="https://vjs.zencdn.net/7.4.1/video-js.css" rel="stylesheet">
    ```
---

## Introduction

![The final result. [Look closely](images/final_result_square_full.jpg), you can see the button square in the fingertip.](images/final_result_square_full.jpg)

[I dislike having to dance around my desk]{.newthought} in my cube, so I usually place it against the wall. This leaves me facing the wall with my back to the rest of the office, which I don't mind, but it's difficult for others to get my attention when I have my headphones on.

Instead of forcing others to tap me on the shoulder, or awkwardly reach around me to knock on my desk to get my attention[^standing_there], I thought a doorbell that flashes a light would be convenient. It needed to be a silent as I work in an open-office[^open_office] floor plan.

[^standing_there]:
It's the most awkward when someone stands silently behind me, waiting for me to notice them. *How long have you been standing there?!*

[^open_office]:
Open-office floor plans suck.

I found such a doorbell: the [Hampton Bay Wireless Table Top Strobe Door Bell Kit](https://www.homedepot.com/p/Hampton-Bay-Wireless-Table-Top-Strobe-Door-Bell-Kit-HB-7778-02/206135529) from Home Depot. This is a battery-powered desktop doorbell with a wireless button - perfect! Other doorbells with lights plug directly into a wall outlet, which doesn't help when the wall outlets are all at the floor.

I also need something to make the doorbell button very obvious. I found this [Ring Bell for Service](https://smile.amazon.com/gp/product/B0747VYDHY) sign on Amazon, I cut out the button symbol in the sign and replaced it with an actual button.

## Unboxing

![The [doorbell](images/doorbell_original_full.jpg) after unboxing.](images/doorbell_original_full.jpg)

### Good news

The desktop unit flashes a bright blue on the top, through the diffuser - exactly what I need to get my attention when sitting on my desk.

There are three selectable sounds: a simple "dong", a compound "ding-dong", or a "Westminster Chimes" tune.

The light flashes with respect to the length of each sound - choosing the "Westminster Chimes" flashes the light the longest, that's what I will probably use.

### Bad news

The volume cannot be adjusted to "off", only "less-loud", via the volume dial[^volume_dial] on the desktop unit. There are also no selectable sounds for "none" - as designed, it will always flash *with sound*.

[^volume_dial]:
The back of the box says "adjustable volume", so technically it's not lying.

## Modifications

### Disabling the speaker

Taking the desktop unit apart shows that it has a basic speaker, with speaker wires. Cutting one of the speaker wires will disable the speaker, but I'm not 100% sure I want the speaker disabled - maybe I'll find a use case later that I need the sound working?

![The [speaker](images/open_back_original_full.jpg) is connected via 2 yellow wires.](images/open_back_original_full.jpg)

I'll add a switch instead of cutting the wires so the speaker can easily be re-enabled if needed.

![A [switch](images/switch_full.jpg) I pulled from my spare parts bin.](images/switch_full.jpg)

The circuit just needs to be interrupted, and it doesn't really matter which side (+/-), pick a wire and cut it.

![[Speaker wires](images/speaker_wires_cut_tinned_full.jpg) cut and tinned.](images/speaker_wires_cut_tinned_full.jpg)

Tinning the wires makes it easier to solder them to the switch pins, which should also be tinned (generously). When you heat the wires and pins together they'll easily join without requiring additional solder[^need_more_hands].

[^need_more_hands]:
This is a good trick when you don't have a good third-hand solution to hold everything aligned perfectly, or you're too lazy to setup your third-hand for a quick job.

![[Speaker switch](images/speaker_switch_connected_full.jpg) connected.](images/speaker_switch_connected_full.jpg)

Check to ensure everything still works by switching the sound off/on during playback.

<figure>
<video-js id="check_speaker_switch" class="vjs-16-9" controls preload="auto" data-setup='{}'>
<source src="images/check_speaker_switch_web.mp4" type='video/mp4'>
</video-js>
</figure>

### Adding more lights

During disassembly of the desktop unit, I noticed the "strobe" effect is from 3 blue LEDs on the circuit board...and the circuit board has room for 2 more LEDs! Maybe the original design had 5 LEDs and they switched to 3 LEDs to save cost?

![[LED](images/leds_original_full.jpg) circuit board.](images/leds_original_full.jpg)

I'll add 2 more blue LEDs[^voltage_drop], because I can and I have some.

![[LEDs and resistors](images/leds_resistors_full.jpg) from my spare parts bin.](images/leds_resistors_full.jpg)

[^voltage_drop]:
"What about the voltage drop?" Good question! The circuit board has the LEDs arranged in parallel, so we don't have to worry about the voltage drop from additional LEDs. This is good because the batteries (3x C) only supply 4.5V total. There are some capacitors which I assume are being used to "strobe" the LEDs at a higher voltage, hence the larger 220&Omega; resistors.

Before getting too far along I test-fit the LEDs and resistors.

![It's not [pretty](images/leds_test_fit_full.jpg) but it works.](images/leds_test_fit_full.jpg)

And checked again to ensure everything still works.

<figure>
<video-js id="check_led_test_fit" class="vjs-16-9" controls preload="auto" data-setup='{}'>
<source src="images/check_led_test_fit_web.mp4" type='video/mp4'>
</video-js>
</figure>

Then I made it pretty, trimming the leads on the LEDs and resistors and soldering them properly.

![Nice and [pretty](images/leds_final_full.jpg) now.](images/leds_final_full.jpg)

And checked again to ensure everything still works. Yes, I really re-checked it after each change, I didn't want to re-assemble the desktop unit and have it mysteriously not working because of a cold solder joint or other silly mistake.

<figure>
<video-js id="check_leds_final" class="vjs-16-9" controls preload="auto" data-setup='{}'>
<source src="images/check_leds_final_web.mp4" type='video/mp4'>
</video-js>
</figure>

### Inserting the button in the sign

Taking apart the doorbell button, it's a small circuit board with a tactile momentary switch and battery. The switch is on the front, and battery holder is on the back. The switch protrudes from the front the perfect amount to be clickable from the front of the sign.

![Button [front](images/button_front_full.jpg).](images/button_front_full.jpg)

![Button [back](images/button_back_full.jpg).](images/button_back_full.jpg)

I'll drill a hole in the sign and attach the circuit board to the back of the sign, with the switch protruding through the sign.

![The [sign](images/sign_original_full.jpg) before drilling.](images/sign_original_full.jpg)

I center-punched the sign where I wanted the hole. The switch is small enough it will fit within the fingertip.

![Center-punching the [sign](images/sign_center_punch_full.jpg) prevents the drill tip from wandering and scratching the surface.](images/sign_center_punch_full.jpg)

Then I drilled it out. A piece of scrap wood was used to support the back and prevent dimpling the sign.

![The [hole](images/sign_drilled_full.jpg) drilled.](images/sign_drilled_full.jpg)

After drilling, the hole was filed square to fit the switch body.

![The [square hole](images/sign_filed_square_full.jpg).](images/sign_filed_square_full.jpg)

Then the switch was inserted.

![The [switch in the hole](images/sign_switch_installed_full.jpg).](images/sign_switch_installed_full.jpg)

I secured it with lots of hot glue, my new favorite tool.

![Sign [backside](images/sign_backside_full.jpg) with glue.](images/sign_backside_full.jpg)

Hot glue is sticky, non-conductive, and insulating. I also used it to secure the battery in the battery holder.

![[Closeup](images/sign_glue_closeup_full.jpg) of the hot glue.](images/sign_glue_closeup_full.jpg)

## Final Result

[Putting everything back together]{.newthought}, it works! Silent, wireless operation with an obvious sign and flashing lights.

<figure>
<video-js id="final_result" class="vjs-16-9" controls preload="auto" data-setup='{}'>
<source src="images/final_result_web.mp4" type='video/mp4'>
</video-js>
</figure>

## Lessons Learned, Feedback, and Improvements

[I'd have liked to use a fancier button]{.newthought}, something like [this](https://www.adafruit.com/product/481), which would have fit in the center circle of the sign perfectly, but illuminated buttons require more power and I'd have to connect a power supply. And it would be much deeper, requiring a standoff mount. In the end, simpler is better.

<!-- Load JS last after page load for best UX -->
<script src="https://vjs.zencdn.net/7.4.1/video.js"></script>
