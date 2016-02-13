2015 MLB Pitch Map
==================

hosted at [shinyapps.io](

What is it?
-----------
The data file (not included here) is a csv document with the following column
headers:
> pitch_id,month,batter,stance,pitcher,throws,b_height,sz_top,sz_bot,umpire,x,z,result,stadium,inning

- pitch_id: my own identifying integer
- month: an integer indicating the month in which the pitch was thrown
- batter, pitcher, umpire: the MLB label for each person
- throws, stance: 'L', 'R'; how the pitcher threw and the batter stood
- b_height: batter's height in inches
- sz_top, sz_bot: the predicted strikezone limits in ft.
- x, z: the location of the ball as it crossed home plate (x is right-to-left)
	(in ft.)
- result: 'B' or 'S'
- stadium: integer
- inning: integer

The data only include called balls and strikes. Balls in play were not included.

Due to space constraints, I selected only the 10 batters who saw the most
pitches in 2015. The pitcher, umpire, and stadium data are all limited by the
batters. That is to say that if you select a specific pitcher, you will only see
the pitches he threw to these 10 batters.

The black box in the foreground indicates the average strikezone as predicted by
the pitch f/x device. Pitch f/x only indicates the top and bottom as these are
the measures that change with each batter. The left and right side are
predetermined to be either side of homeplate.

Why is it?
----------
This is the preliminary visualization intended to be used with my strikezone
code wherein I use a neural network to predict batters' called strikezones
(where the umpire calls it as opposed to the pitch f/x predictions).
I am curious whether called strikezones change over the course of a game or
season as well as how they differ from stadium to stadium or umpire to umpire.

Although this was meant to simply be practice for the next step of my project,
it adds a value I did not anticipate and that may otherwise have been lost in my
analysis. One can identify clear patterns when examining left- vs. right-handed
pitchers and batters. I also found it interesting to see how many of the balls
and strikes overlapped for some batters. While this can be explained away as a
machine error at the top or bottom of the strikezone, I find it curious that so
many called strikes are clearly outside of the strikezone on the horizontal
plane and vice versa for balls.

Where is it going?
------------------
- At some point it would be interesting to add some balls in play, specifically
	home runs. Where do specific players hit the most home runs, etc.
- As mentioned above, the ultimate goal is to incorporate this into my
	strikezone heat map code.
