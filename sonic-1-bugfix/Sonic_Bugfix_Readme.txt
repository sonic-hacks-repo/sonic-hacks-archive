SONIC 1 BUGFIX
+-+-+-+-+-+-+-

By lory1990
November 14th, 2016
Version 1.0


=======================================
OVERVIEW
=======================================
Refer to the changelog below for the list of all the bug fixes. I used the various guides on Sonic Retro
so credit goes to the people who posted them, and those who found and fixed the bugs. Here's the link:

http://info.sonicretro.org/SCHG_How-to:Guide


=======================================
HOW TO APPLY THE PATCHES
=======================================
The patches are in IPS format. To apply them, use a program such as Lunar IPS. 
One patch is for the US/EU version, while the other contains changes from the Japanese version. 
You need to use one patch only; if you want to use the other one, make sure to use a clean ROM.
The original ROM to apply the patches to is the US/European version of Sonic the Hedgehog, even for the rev1 patch. 
If your ROM has the .smd extension, you need a program to convert it to .bin format as the .smd one contains
an extra header. To be sure you have the right version of the original ROM, you need a program such 
as RomHasher to determine if the info is the same as that in the Rom/Iso Information field found in the main page for
this hack.



=======================================
CHANGELOG
=======================================
v1.0
----

- Fixed crash that happens when looking down at the end of act 1 and 2 of Labyrinth Zone.

- Now the Press Start Button text appears on the title screen.

- Fixed level order in the Level Select menu.

- Now you're correctly awarded 100 points instead of 10 when hitting the 100 point 
  marker after the signpost at the end of the level.
  
- Fixed disappearance of scattered rings for levels that have vertical wrapping.

- Lost rings shared the same timer before disappearing. If you lost the rings
  while there were others scattered previously, these will stay around longer
  until the newly scattered rings disappeared. Now every lost ring is independent.
  
- Fixed Sonic using his walking animation while jumping or drowning when standing
  next to some objects.
  
- Fixed drowning bugs when Sonic gets hurt.

- Fixed Sonic disappearing when he dies and ends up above the top boundary of the level.

- Fixed timer HUD not blinking at the 9th minute when you have rings.

- Fixed Level Select graphics bug.

- Sonic no longer takes damage from spikes when he's temporarily invulnerable.

- Fixed scattered rings physics when underwater.

- Fixed physics when Sonic gets into water in hurt state.

- Fixed Sonic's jump height being really low when jumping out of shallow water.


=======================================
CREDITS
=======================================

- Members of Sonic Retro for all the fixes.