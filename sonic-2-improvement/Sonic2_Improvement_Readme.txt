SONIC 2 IMPROVEMENT
+-+-+-+-+-+-+-+-+-+


=======================================
HOW TO APPLY THE PATCH
=======================================
The patch is in IPS format. To apply it, use a program such as Lunar IPS. The original ROM to apply 
the patch to should be the rev A, or rev 01 of Sonic the Hedgehog 2. If your ROM has the .smd extension,
you need a program to convert it to .bin format as the .smd one contains an extra header. After that,
to be sure you have the rev A or 01 of the original ROM, you need a program such as RomHasher to
determine if the info is the same as that in the Rom/Iso Information field found in the main page for
this hack.



=======================================
CHANGELOG
=======================================

v6.0
----

- In this patch it should be possible to get a Perfect Bonus in every level. Some of the rings were placed differently
  or removed entirely to make this possible or easier. In levels that have more than one path where it's impossible
  to backtrack, you will need to pick the paths which will net you the most rings.

- Now the HUD also shows the number of rings left in a level. In levels where it's not possible to get all rings,
  the value reflects the max number you can reach.
  
- Removed inaccessible rings for Aquatic Ruin 2, Casino Night 2, Mystic Cave 2, Oil Ocean 2 and Metropolis 2.

- Now Tails will get out of his spindash state as soon as he collides with the ground flippers in Casino Night.

- Now debug mode can be used with Tails as well.

- Fixed corrupt graphics for the 'Perfect Bonus' text in Casino Night.

- Now the monitor created through debug mode gives a 1-Up.

- Slightly raised one platform in the underwater section of Aquatic Ruin 2 so you are able to jump onto
  another platform more easily.

- Removed forced-roll object at the end of Casino Night 1 so you're able to enter the slot area.

- The level conditions (rings got, shield, enemies and monitors destroyed, etc) are retained after a Special Stage.

- Now Rexon (the purple snake badnik from Hill Top) doesn't respawn after being destroyed.

- Now the fans in Oil Ocean won't be able to blow you away if you're charging a spindash; for the fans that blow you upwards,
  the spindash gets cancelled.
  
- Fixed rare forced-roll issue after you get out of the last slot area of Casino Night 2.

- Fixed bug for rings not rendering near the vertical screen wrapping line (Metropolis).

- Fixed CPU Tails flying direction when you're near the vertical screen wrapping line.

- Fixed Sonic's input for the first demo.

- Now Tails' tails will spawn along with Tails rather than a few frames later at the start of a level.

- Now, when you exit the level and go to the Sega or Title screen, such as after a demo,
  objects like Tails' tails and shields will no longer despawn too quickly.
  
- Fixed garbled graphics upon exiting the level screen.

- Fixed camera adjusting too late upon loading the level from a star post.

- Fixed position for the end of level signpost in some levels.

- Fixed bug where sometimes it is impossible to grab the lost rings while standing on lava.

- You can no longer go into debug mode when you're dead.

- In Metropolis Zone, while in debug mode, if you reach the vertical wrapping line, you'll suddenly stop.
  This has been fixed.

- Now in Metropolis Zone, lost rings will disappear before they wrap around the level.

- Fixed Tails' tails being drawn behind the Emerald Hill boss.

- Fixed corrupt graphics for ring requirements in the Special Stage. (Credit to Ed Crowther)

v5.4
----

- Fixed position for a couple of rings that were unobtainable in the underwater section of Aquatic Ruin, act 2.

v5.3
----

- Added a path swapper so you won't fall through the floor in an area of Chemical Plant, act 1.

v5.2
----

- Fixed graphics glitches for some text and the stars when collecting rings in Special Stages. (Credit to Storm3000)

v5.1
----

- When you enter Debug mode underwater and then exit it above water, characters will retain the underwater physics.
  This has been corrected. (Credit to Clownacy)

- Fixed buggy BCD converter for the ring requirement when you need 101 or more rings in Special Stages.
  (Credit to Clownacy)

- Fixed corrupt graphics for the air countdown numbers when they show up above water. (Credit to Clownacy)

- The question marks will no longer appear when you die near the areas with falling leaves in Aquatic Ruin Zone.
  (Credit to Clownacy)

- Now the leaves spawner object will show up in Debug mode. (Credit to Clownacy)

- Now spindash is cancelled when you're caught by a Grabber in Chemical Plant Zone. (Credit to Clownacy)

- In the original game, when you get a Game Over, you can't pause; however if Tails dies by Game Over in 2P mode,
  you can pause. This also happens when you get a Time Over for both characters. All the checks have been added
  so you can't pause the game in these situations. (Credit to Clownacy)

v5.0
----

- Now you shouldn't get stuck in the tunnel with the Shield monitor at the end of Emerald Hill Zone 2.

- Sometimes you cannot enter the tunnel with the Rings monitor towards the beginning of Emerald Hill Zone 2
  due to a redundant path swapper. With the path swapper removed, the tunnel should always be accessible.

- Now characters are pushed down a steep slope when their ground velocity is 0 instead of stopping completely.

- Removed invisible object that made the characters use their balancing animation while on the floor in Chemical
  Plant Zone 2.

- Tweaked Tails AI logic for the following situations:

  * He will no longer jump all the time when Sonic and Tails are standing still next to an object.
  * He will stand still if he's close to Sonic on a moving platform instead of moving around inconsistently.
  * He will get out of his spindash state if he hits a spring.
  * He will prioritize catching up with Sonic as opposed to staying in duck position when you're holding Down.

- All signposts at the end of act 1 of each zone (and act 2 for Metropolis) are correctly centered now.

- Fixed more instances where characters would use the walking animation instead of the appropriate one while pushing
  against objects.

- Now Tails has the same underwater deceleration as Sonic's while rolling.

v4.2
----

- Now characters collide with monitors instead of destroying them while rolling upwards with little horizontal speed.

v4.1
----

- Fixed Sonic's hitbox upon transforming. (Credit to Clownacy)

- In the Level Select, when you highlight a different zone, the new icon briefly shows the wrong colors. This
  has been fixed. (Credit to Clownacy)
  
- Fixed rings disappearing at the top of the screen even if their bottom half is still onscreen. (Credit to Clownacy)

- Now rings shake with the rest of the screen, for example during earthquake sequences. (Credit to Clownacy)

v4.0
----

- Tails now gets out of his catch-up flying state even when Sonic is in mid-air. (From Sonic 3)

- Now characters can duck even if they don't stop completely. (From Sonic 3)

- Fixed spawning issue for the very first badnik (Spiker) at the start of Hill Top Zone, act 1.

- Fixed Super Sonic falling through the end of the high-speed elevators in Metropolis Zone.

- In a Sonic and Tails game, the killed enemies score chain is reset if Tails touches the ground. This has been
  changed so it is affected only by Sonic.
  
- Fixed a couple of inconsistencies with the round launchers in Oil Ocean Zone: the first one happens when both Sonic
  and Tails are inside, and the launcher increases its animation speed; in my opinion this shouldn't happen.
  
  The other one deals with a behaviour after the characters get fired off: the launchers restore their original animation,
  however in some cases the animation is interrupted halfway through; this has been corrected.
  
- Tails in CPU mode will no longer go in his spindash state on oily surfaces in Oil Ocean Zone because they are not spots
  you can spindash.
  
- Now roll-jump state wears off when interacting with a few other objects.

v3.1
----

- You can no longer turn into Super Sonic during the hanging animation after you jump off barriers and hooks
  in Wing Fortress Zone.

- Fixed Super Sonic using normal Sonic graphics during the Tornado sequence at the end of Wing Fortress Zone.


v3.0
----

- Renamed the project to 'Sonic 2 Improvement' since it contains changes other than bug fixes.

- Fixed door graphics glitch in Chemical Plant and Death Egg Zone. (Credit to delta7890)

- Now, in order to turn into Super Sonic, you need to press any button to jump, followed by a different button
  to double-jump. (Taken from Sonic 3 Complete)

- Removed spikes in the infamous pit in Mystic Cave Zone, act 2 to avoid getting stuck when you're Super Sonic.
  (Credit to delta7890)

- Now roll-jump state wears off when turning into Super Sonic.

- Drawbridges in Mystic Cave suffer from collision problems: while they are opening, the hitbox is misplaced and,
  as you jump off the vine switch, you get pushed down. For some others, the hitbox is placed somewhere else, that's
  why you don't bump into it, however you can go through the bridges.
  
  I only fixed the getting pushed down part by turning off the collision completely. That way you can land on ledges
  without having to wait for the bridges to open completely (especially in act 2). However, be careful not to jump off
  too early since you can still go through them.


v2.4.1
------

- The Death Egg music was supposed to play again after defeating Silver Sonic. There's an instruction which doesn't
  properly load the music. After fixing the instruction, the music now plays again after defeating the boss.
  (Credit to Clownacy)
  

v2.4
----

- Fixed another glitch with Tails' animation. (Credit to Clownacy)

- Now spindash status is cancelled when using objects such as springs and tubes.

v2.3
----

- For some objects if one character is pushing against them and the other character destroys them, the pushing
  character keeps using the pushing animation when moving. This won't happen anymore.
  
- Fixed other animation glitches related to Tails. (Credit to Clownacy)

- Fixed X/Y flip issue with sprites in 2P mode. (Credit to Clownacy)

v2.2
----

- Characters no longer switch to the running animation when destroying the monitors after spindashing right
  next to them.
  
- Characters no longer go through the floor or lava when standing on a falling object in Emerald Hill, Hill Top
  and Metropolis Zone.

v2.1
----

- Fixed Tails' behavior and animation bugs in the Casino Night forced-roll areas in a Sonic and Tails game.

- Fixed walk-in-air glitch when a platform falls through the characters in Emerald Hill Zone.

v2.0.1
------

- Restored air speed cap.

v2.0
----

- You can't spindash off the Tornado anymore. (Credit to Esrael)

- Invincibility stars now disappear when turning Super Sonic.

- Now roll-jump status wears off when going into the spin tube in Chemical Plant Zone.

- Fixed HUD glitch when you have more than 99 lives.

- Fixed collision with enemies that are behind the scattering leaves in Aquatic Ruin Zone.

- Fixed height collision when character is ducking or spindashing. (Credit to redhotsonic)

- Removed collision with a few objects when Tails flies to catch up with Sonic.

- Fixed camera looping glitch when looking down and jumping in Metropolis Zone. (Credit to flamewing)

- You can no longer turn Super Sonic in the hanging and bouncing animations.

- Fixed garbled graphics when turning into Super Sonic. (Credit to redhotsonic)

- The clones now disappear when defeating the boss in Metropolis Zone.

- Fixed MTZ boss clones not popping when they hit a character before touching the ground
  for the first time. (Credit to redhotsonic)
  
- Fixed rare crash when Tails hits any MTZ boss clone two frames after Sonic has been hit
  by any clone. (Credit to flamewing)

- Fixed rare glitch where Silver Sonic disappears after landing the last hit. (Credit to flamewing)

- Fixed rare glitch where the Aquatic Ruin Zone boss blasts off after landing
  the last hit. (Credit to flamewing)
  
- Removed interaction with the bridges in Emerald Hill Zone while in debug mode. (Credit to Clownacy)

- Fixed rare crash when defeating the Oil Ocean boss. (Credit to flamewing)

- Fixed rising pillars disappearing while still on screen in Aquatic Ruin Zone. (Credit to Clownacy)

- Fixed Tails' corrupt graphics when you get a Game Over and enter the Continue screen
  in Hill Top Zone. (Credit to Clownacy)
  
- Fixed scrolling glitch while screen is shaking in Aquatic Ruin, Mystic Cave and Death Egg Zone.
  (Credit to Clownacy)

- Fixed stakes disappearing while on screen in Hill Top Zone. (Credit to Clownacy)

- Removed the air speed cap.

- In a Sonic and Tails game the Mystic Cave boss will stop moving on the floor and moves up only
  when he hits Tails; when he hits Sonic, he will just continue moving up to the edge of the screen;
  he also continues moving in a Sonic alone or Tails alone game; now this is fixed, meaning the boss
  will stop and move up as soon as he hits either character. (Credit to redhotsonic)
  
- The Mystic Cave boss now laughs every time the character gets hit. (Credit to redhotsonic)

- Now the screen stops shaking if the character dies during the Mystic Cave boss. (Credit to redhotsonic)
  
v1.1
----

- Fixed freezing issue when entering the special stage using emulators other than
  Kega Fusion. (Credit to terpsfan101)


v1.0
----

- Fixed the Oil Ocean music that keeps playing until reset when activating the continues cheat.

- Fixed Aquatic Ruin waterfall animation glitches.

- Fixed demo playbacks button input logic. (Credit to FraGag)

- Fixed Sonic attempting to turn super at the end of an act. (Credit to MoDule)

- Fixed Super Sonic ring countdown: now one ring is lost after every 60 frames instead of 61. 
  (Credit to MoDule)

- Fixed Super Sonic decelerating too quickly when rolling. (Credit to MoDule)

- Fixed palette cycle showing incorrect color when transforming into Super Sonic twice in the
  same level. (Credit to MoDule)

- Fixed Super Sonic missing palette frame. (Credit to MoDule)

- Fixed missing initial palette cycle when turning into Super Sonic underwater. (Credit to MoDule)

- You probably noticed that Sonic, after roll-jumping, gets moved up too far when he touches the
  ground, preventing you from jumping immediately after. This behavior was corrected. Tails has
  this bug as well, but it's much less noticable and doesn't have any side effects. (Credit to MoDule)

- When you are just above the point at which the characters would be considered submerged, their jump
  height is heavily reduced. This has been fixed. (Credit to MoDule)

- Fixed spindash being cancelled at screen boundaries. (Credit to flamewing)

- Fixed spindash being cancelled the frame you jump after releasing the dash. (Credit to flamewing)

- Fixed character drowning with incorrect animation when in hurt state. (Credit to redhotsonic)

- Fixed Tails' Tails animation when standing next to an object. (Credit to redhotsonic)

- Now also Tails' Tails flash when he gets hurt and is temporarily invulnerable. (Credit to redhotsonic)

- Tails' Tails don't flick anymore when looking up. (Credit to redhotsonic)

- Fixed Tails' speed values when he respawns after disappearing underwater. (Credit to redhotsonic)

- Fixed camera position when Tails rolls. (Credit to MoDule)

- Now rings don't disappear for levels that have vertical wrapping. (Credit to redhotsonic)

- Lost rings share the same timer before disappearing. If you lose the rings while there were others scattered previously,
  these stay around longer until the newly scattered rings disappear. Now every lost ring is independent.
  (Credit to redhotsonic)

- Now rings lost underwater use the correct physics. (Credit to redhotsonic)

- Fixed Rexon crash in Hill Top Zone. (Credit to redhotsonic)

- Fixed monitors collision bug. (Credit to redhotsonic)

- In Emerald Hill Zone there were some values missing for the horizontal scroll at the bottom
  of the screen. Now all values are set. (Credit to qiuu)

- Fixed the blue slime from the Chemical Plant Zone boss not hurting you when you duck. (Credit to redhotsonic)

- Fixed walk-in-air glitch that might happen when standing on an arrow or poles during the Acquatic Ruin Zone boss.
  (Credit to MoDule)
 
- Fixed animation when standing on an arrow or poles during the Acquatic Ruin Zone boss.
  (Credit to MoDule and redhotsonic)

- Fixed Eggman's laughing animation when he hurts you during the Acquatic Ruin Zone boss. (Credit to redhotsonic)

- Fixed Casino Night Zone boss sound when dealing the first hit. (Credit to redhotsonic)

- Fixed Casino Night Zone boss flashing for a long time when dealing the first hit. (Credit to redhotsonic)

- Fixed Hill Top Zone blue mountains scrolling in the background. (Credit to flamewing)

- Fixed speed issues when using the launcher in Oil Ocean Zone while in hurt state. (Credit to MoDule)

- Fixed object under breakable block that propels you into launchers while in hurt state in Oil Ocean Zone.
   (Credit to MoDule)

- Fixed collision problems with the final boss. (Credit to flamewing)

- Fixed falling direction for the hammer after defeating the Aquatic Ruin Zone boss.
  (Credit to Esrael and redhotsonic)

- Fixed falling direction for the claws after defeating the Casino Night Zone boss.
  (Credit to Esrael and redhotsonic)

- Fixed falling direction for the drills after defeating the Mystic Cave Zone boss.
  (Credit to Esrael and redhotsonic)

- Fixed gravity when character falls in water while in hurt state. (Credit to MoDule)

- Disabled floor collision while dying. (Credit to Esrael)

- Now you turn into Super Sonic after pressing a button in midair, just like Sonic 3.

- Fixed Super Sonic flag not getting cleared after dying or finishing the game.

- Fixed speed for Super Sonic when transforming underwater.

- Fixed Super Sonic speed when using speed shoes (even underwater).

- Fixed speed-shoes speed when going in and out of the water.

- The count for emerald that you collected is reset even after you start a new game from the options
  screen.

- If Tails respawns immediately after getting hurt, he won't flash like he used to (the timer
  for the invulnerability was not reset).

- Fixed glitch when character falls into the spin tube while in hurt state in Chemical Plant Zone.

- Fixed animation errors when standing next to a monitor.

- CPU Tails now jumps off vines in Mystic Cave Zone.

- CPU Tails can use flippers in Casino Night Zone.

- Removed spindash state after being pushed up by the seesaw in Hill Top Zone.

- Now roll-jump state wears off when hanging onto vines in Mystic Cave Zone.

- Now roll-jump state wears off when hanging onto barriers and hooks in Wing Fortress Zone.

- Now roll-jump state wears off when using the yellow wall springs in Metropolis Zone.

- You are no longer able to stay on screen after going past the signpost at the end of the level.
  
- Now characters will get off the falling lift automatically in Hill Top Zone.

- Fixed behavior when getting into the spin tube while in hurt state in Metropolis Zone.

- Removed interaction between flying Tails and trapdoors in Metropolis Zone.

- If Tails is in the air and moves during the spindash and touches the ground, he would move
  while charging the spindash (funny, right?). The logic for Tails following Sonic doesn't
  take this into account. This behavior has been corrected.


=======================================
CONTACT
=======================================

If you wish to contact me for anything, use either one of the following accounts:

Email: lory2004@gmail.com

RomHacking.net account: lory1990


=======================================
CREDITS
=======================================

- Members of the Sonic Retro website for the disassembly and countless bug fixes.