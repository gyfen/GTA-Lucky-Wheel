# GTA Lucky Wheel

This script helps getting the podium vehicle at the lucky wheel.
I included an .ahk file as well, this is so you can edit the script.
To use the .ahk file you need to have *AutoHotkey* installed.
If you don't want to edit the file and just want to use it, you can delete the .ahk and just use the .exe.

From my testing this is quite inconsistent, but I decided to release it anyway.

**This will NOT guarantee you to always get the vehicle. It's just a tool to do the timing for you.**

***

## Instructions
### Requirements:

-Fullscreen mode: Windowed borderless

### How to use:

To use the script, simply open the .exe (or .ahk). It will run in the background.

To stop the script, open you systemtray and rightclick the green **H**.

#### In-game:

You will need to record coordinates of a lucky wheel spin dialogue.

1) Stand in front of the lucky wheel.

2) Press **E**.

3) Try to put your cursor on the white area highlighted by arrow on the image
   below. 
   If you don't have cursor shown on your screen, try ALT+TAB on the work table and
   try to predict where this white area will be, then press CAPSLOCK. Repeat
   until the steps below will work for you. 

![Lucky wheel spin dialogue](https://user-images.githubusercontent.com/63922776/100398641-a3eacd80-3060-11eb-9032-20fa566470df.png "Lucky wheel spin dialogue")


#### At the GTA 5 Casino:

1) Stand in front of the lucky wheel.

2) Press **E**.

3) Press **F1**.

4) Wait for it to spin.

*Optional:*

5) Press **CTRL + ALT + A** if you don't get the desired price.

When you press **F1** you should see a tooltip in the upper-left corner of your screen.

### How to edit the file/delay:

Right-click the .ahk file and click *edit*.

You'll see some text saying "delay := (insert number here)".

Adjust this value to your likings.

***

## Hotkeys

**F1:** Starts the spin

**CTRL + ALT + A:** Quits GTA V *instantly*

**CAPSLOCK:** Lets you change coordinates of wheel spin dialogue which is used to
detect when to start the delay timer

**F2:** Lets you put manually defined coordinates of spin dialogue into the
Windows registry to be read and used by script upon the next execution. Put the appropriate coordinates into the script file first
before pressing this key!

***
-Gyfen and Peppa
