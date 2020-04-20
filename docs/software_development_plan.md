# (ASCII ART IMAGE)

## Software Development Plan
##### By Nick Ducker

<br>

*Content links*

<br>

## Statement of Purpose and Scope
I created **{title}** as a simple tribute to the game 2001 "Shenmue II" which utilized "Quick Time Event" mechanics quite extensively. It is intended to be for anyone who enjoys games with a time pressure mechanic at its core.

This mechanic is classically based around some kind of graphical action sequence wherin the player is periodically prompted for input in order to progress further. This input is usually time sensitive. If the player does not hit the correct button, or takes too long to do so, they are penalized and/or must restart the sequence. 

I wanted to implement this mechanic in a terminal based simulation of working in a busy restaurant. The player takes the role of a server that must perform time critical "tasks" to ensure the smooth running of the night. 

Initially I experimented with the idea of creating a map that the player must move around, attending different tables when prompted. I eventually moved away from this idea as it became more obvious that this would not be realistic to develop in a short period of time. 

I ended up deciding on a text based interaction where the player is shown quotes and sound from patrons and staff in text at relatively high speed. Eventually one of these text snippets will display with a keyword that the player must type as fast as they can.

If the player types the word correctly, they will be deducted points based on their speed and the difficulty selected. For example, a player who inputs the correct word in 2 seconds will lose more points than a player who inputs the correct word in 1.5 seconds.

If the player spells the word incorrectly, they will lose a set amount of points dependant on the difficulty level. If the player fails to answer in time (also decided by difficulty level), they will lose a set amount of points.

If the player loses all their points before the end of the night, the game ends "negatively". If the player makes it to the end of the night with points, the game ends "positively" with a final score.






