![Divebar logo](/docs/imgs/divebartitle.png)

## Software Development Plan
---
---
## Statement of Purpose and Scope
**Dive Bar** is a Quick Time Action (QTE) game developed using pure Ruby, solely for use in the command line terminal. It is intended to be a tribute to the classic Japanese QTE games in the "Shenmue" adventure series developed by Sega. 

<details>
  <summary> Description of Application </summary>

  ## Description of Application
  The premise of **Dive Bar** is that you're a bartender working by yourself in a busy dive bar. You will need to perform actions in a hectic environment in order for the night to run smoothly. Failure to perform the tasks will result in angry customers and maybe an empty bar!

  At it's core, the game is based on a simple time pressure mechanic. The player will be shown a sentence and will have to type the highlighted word in the sentence as fast as possible. If the player enters the word in time, and the word is correct, they will only lose a small amount of points based on the time taken to answer. If the player fails to enter the word in time, they will lose points. If the player enters the word in time but the word is wrong, they will also lose points. 

  The twist in this simple mechanic is the way the prompts are displayed to the user. Instead of it simply displaying text and timing the input, **Dive Bar** will throw random snippets of conversation at the user if a confusing manner. Eventually a prompt will be displayed in the same manner, before pausing for user input. A player trying for a high score, or trying to win the game at higher difficulty levels, will have to pay attention to all the snippets until they see the highlighted keyword.
</details>

<details>
  <summary> Motivation </summary>
  
  ## Motivation
  **Dive Bar** is not to designed to redefine gaming mechanics or be a "helpful" program, but is instead intended to be a throwback to the aformentioned QTE games developed by Sega. My hope is that anyone who has previously enjoyed the Shenmue series or enjoys time pressure mechanics in their game experience will get a kick out of this simple program. 

  The QTE mechanic is classically based around some kind of graphical action sequence wherin the player is periodically prompted for input in order to progress further. This input is usually time sensitive. If the player does not hit the correct button, or takes too long to do so, they are penalized and/or must restart the sequence. 

  I did some brainstorming and experimentation with the concept in the week leading up to developing **Dive Bar**. Initially, I wanted to try and create some form of map based "Restaurant Dash" style game, where the player would have to move between tables and a kitchen quickly when prompted. Ultimately I moved away from the idea as it became clear that the scope of the project was too large for the time availabe to develop.

  I then started moving toward the concept of a more text based interaction with a similar mechanic based around entering text. While I think creating a map based game would certainly feel more hectic if coupled with text, I'm happy with the way **Dive Bar** turned out. While it is a simple game, I think it provides good challenges and rewards to players who are willing to spend some time trying to maximise their scores or pass one of the higher difficulty levels.
</details>

----
----

## List of Features in **Divebar**

<details>
<summary> Gems Used </summary>

  ## Gems used
  * **Colorize** : To colour text and banners throughout the game
  * **Faker** : To create randomized lists of phrases for the game
  * **Timeout** : To implement a relatively easy to understand timeout function in game
  * **TTY-prompt** : To create intuitive and easy to use menus and prompts
  * **TTY-screen** : To use hand in hand with tty cursor to randomize where the terminal prints
  * **TTY-cursor** : To move the cursor around the terminal randomly, as well as hide it from view when printing
</details>

#### Core Features

<details>
  <summary>Takes Command Line Arguments to Customize Experience</summary>

   
  *  The game recognizes ARGV input from the terminal and takes a few simple commands to help streamline use for experienced users;
     *   The program is able to skip the title, rules and difficulty settings if given a corresponding argument. This is done by wrapping the Title, Rules and Difficulty in a control flow statement that checks whether a ARGV input of -d1 to -d4 has been given to decide the difficulty. If so, it will skip straight to the game. 


        * The program displays in a "no colour mode" if given the argument -nc. This is acheived by changing the colour array stored in the game class to a single element array that contains the colour colorize gem symbol for white. 
  
        * The program will display a help page if it is passed the argument --help. This is acheived by having the terminal class check for an ARGV statement that matches --help. If so, it will display a help page to the terminal and quit. The help screen is stored in a seperate module to keep code neat. 

</details>

<details>
  <summary>Interactive title & rule screens</summary>

  * Instead of a fully static timed title screen, the **Dive Bar** will prompt the user to press any key to continue, or q to quit. This is done through the use of a superficial terminal class that is only responsible for looping the game. By default this loop has a "running" variable that is set to true. During each iteration of the loop, this variable will listen to an instance of the game class. If the instance returns false, this will change the running variable and cause the game to quit gracefully.

  * **Dive Bar** also has a rule screen that is optional. The user is given a yes/no prompt (using the tty prompt gem) that feeds into a simple when statement within the "rules" function of the game class. A yes will display the rules, a no will cause the game to move onto the difficulty settings. 

  * The rule page itself has a written explanation of the game, followed by a quick demo of the game mechanic, walking the user through a tutorial of how the game works. 

    This is done by essentially recycling the game class functions into the rule ?? function(or class??) and giving the game a "tutorial" difficulty by default, where only one snippet will be displayed, followed by a prompt with an extremely long prompt. 

</details>

<details>
  <summary>Preset Difficulty Settings</summary>

  * After the rule prompt, the player will be prompted with multiple choice menu (using the tty prompt gem) to select their difficulty. 
  
    The choices are Easy, Medium, Hard or Insane. The player is able to use their keyboard to select the level of difficulty they desire. The selection is then passed to a difficulty function within the game class. This changes the default difficulty instance variable from "tutorial" to one of the 4 choices by referencing a hash contained in a difficulty module included in the game class. 

    The hash contained in the difficulty module contains a suite of values for each level of difficulty. The difficulty method calls the requested difficulty key within this hash, then assigns the associated array to the difficulty instance variable within the game class.

    The difficulty instance variable now contains an array(??maybe another hash??) of values associated with controlling the difficulty of the game. 
    
    This controls:
    * The amount of phrases to flash and how they are flashed before a prompt. 
    * The speed at which the phrases and prompts are typed out.
    * The amount of time given to input a prompt.
    * The length of the prompted word to be input by the player.
    * The penalties for spelling a word wrong or running out of time. 

</details>

<details>
  <summary>Randomized Sets of Phrases and Prompts</summary>

  * Phrases:
    
    Each time the game is instantiated by the terminal app, the games data module should generate an array containing three differently themed arrays of phrases (using the Faker gem). It will then randomly pass one of these arrays to the phrases instance variable to be used in the game itself. This is included to encourage replayability, giving the player a relatively fresh set of quotes each time they replay the game. 

  * Prompts

    The prompts work similarly to the phrases in the sense that the data module passes a random array of prompts to the game instance each time the game is instantiated, depedant on the difficulty. The difference is that the prompts themselves are hardcoded into the data module. The prompts of each difficulty are completely different to one another. However, each difficulty comes with 2 sets of 5 prompts. Each set for a given difficulty mirrors the other in all but the word to be typed. This also encourages replayability and keeps the game fresh.

</details>

<details>
  <summary>Confusing Display</summary>
    
  * During the game, the user will be shown a series of random phrases pulled from the phrase array. The way these phrases are displayed are modified in x different ways to confuse the user;
    
    * Depending on the difficulty, a random number of phrases will be displayed before the prompt. This is done by creating a x.times loop within the main game loop that uses a difficulty variable in order to choose a random number from a particular range.


    * The game will then choose a random prompt by first duplicating the instance variable prompt array. It will then shuffle the duplicated and selecting whatever is first. This is done with a shuffling function that simply shuffles whatever array is fed to it and returns the first element. 
    * The game selects a random place in the terminal to move the cursor. This is done using a mixture of the tty-screen and tty-cursor gems. When the game is instantiated, it gathers the size of the screen and assigns them to line and column variables. Using TTY-cursor, the cursor is then moved to a random line and column on the screen using a move_cursor function
    * The game will then use a typer function to "type" out in a broken fashion the phrase by printing each character, then sleeping for a random amount of milliseconds selected from a range dependant on difficulty. This creates a "stop starty" rhythm to the way the text is displayed. Each character is also colored randomly (using the colorize gem) by randomly choosing a symbol from an instance variable array on each character. 
      
      Once the phrase has been typed out, the screen is cleared then the phrase is flashed, using a flasher function, a random amount of times dependant on difficulty. This is looping a screen clear, calling the move_cursor function, showing the phrase and sleeping for random amount of time.

    * After flashing the phrase, the phrase is then fed to a deleter function that deletes a passed argument that matches an element in the passed array. In this case, we are feeding the phrase displayed with the corresponding duplicated prompt array. This ensures that every prompt displayed will be different and there will be no duplications, as the array will get smaller each iteration.

    * Once the x.times loop responsible for flashing phrases has ended, the same steps are also applied to a single prompt, except at on its final flash it waits for a set amount of time for user input. Once the program gets input, it will delete the prompt from the prompts instance variable using the deleter function. Deleting the prompt from the instances prompt array variable serves a double purpose. Its a tracker for the progress of the game, allowing each iteration of the main game loop to check whether there are still prompts to be used and therefore whether another iteration must be performed. It also ensures that prompts in the prompt array have no chance to be duplicated in following round. 

</details>

<details>
  <summary>Timed Input</summary>

  *  The player will have a limited amount of time to enter the prompted word once the prompt has stopped moving. This is acheived by using input = time_input. This timed_input function is essentially a error handling function. 
  
     Using the timeout gem, the game starts a timer, then asks for input. If the user enters something before the timer expires, the timed_input function will return that answer. If the user runs out of time, the timeout gem will throw an error. This is handled with a rescue statement which defaults the input to a "no answer" string and returns it.

     Additionally, the timed_input function another times the input by getting the current time just before asking for input and assigns it to a variable. Once input has been entered, the time is again assigned to a different variable. By deducting the starting time from the ending time, we have the amound of seconds it took for the player to enter their answer. This is then saved to an instance variable and used in scoring correct answers. 

</details>

<details>
  <summary>Dynamic Scoring</summary>
  
  * The scoring system is designed to encourage the player to answer accurately in the least amount of time possible. There are a few set rules to the way the scoring system works. 


    * The player will always start with 10,000 points at the start of the game. 


    * The player will lose a small amount of points for each correct input they give based on their input time. For example, if you input the word correctly in 1.879 seconds, you will only lose 188 points.
    * The player will lose a large amount of points for incorrect inputs of if the timer expires. The amount of points deducted is based on difficulty. For example, the game on the easiest setting will only decduct 1,000 points for each wrong answer or timeout. However, the game on the hardest setting will deduct 4,000 points for each wrong answer or timeout 

  * The way this is done is with a scoring function that relies on a validator function. First the inputted string is passed to the validator. 
   
    This validator will check first to see if the string fits a hardcoded message returned by the timed input function. If it matches, it will return it's own hardcoded message to be interpreted by the scoring function. 

    If it passes this stage, it will take the input and check it against the word in the prompt, ignoring case. This is done by using square [brackets] on the word you wish the user to input. the validator can call a prompt_scanner method that returns the word within the prompt that needs to be matched.

    Once the input and prompt word have been compared, the validator returns a hardcoded true or false string. 

    This string is then fed to the scoring function that reads it and does one of three things 

    1. type, then delete some text using a type_delete function, congratulating the user and showing them their new total score. The new total score is calculated by rounding the elapsed time to two decimal places and multiplying it by 100, then deducting it from the total score


    2. Uses the type_delete function to tell the user they gave the wrong input, then shows them their new total score. The new total score is calculated by taking a difficulty integer in the difficulty instance variable and deducting that from the total score.
    3. Uses the type_delete function to tell the user they ran out of time, then shows them their new total score. The new score is calculated the same way as the wrong input outcome. 

    For all three of these outcomes, the scoring method checks whether the calculated score is below zero. If so, it displays 0 instead of a negative number.

</details>

----
----

## User Interaction and Experience

<details>
  <summary>Github</summary>

  ## Github
  * The user must first clone the repository from GitHub. The README file in the root directory contains the following information to ensure the user can install and run the program:


    *  Links to install Ruby
    *  Step by step instructions on installing and using bundler to ensure the correct gems are installed for the programs dependencies. 
    *  Step by step instructions for running the basic program
    *  A list of command line arguments you are able to give the program.

  * Once the user has the appropriate gems installed, the user can run the program a variety of different ways from the commmand line. 
    * `ruby init.rb --help` will display a help document and end the program. This help document simply outlines the basic commands and gem dependencies. It also outlines some of the error handling within the program if users are struggling to run the program.
    * `ruby init.rb -nc` will run the program in black and white.
    * `ruby init.rb -d1 -d2 -d3 -d4` will run the program, skipping the title, rules and difficulty selection, using the provided argument to set the difficulty. 
    * `ruby init.rb` will simply run the program.
  
</details>

<details>
  <summary>The Game</summary>

  ## The Game

  * When run normally, the program will begin the game and show the title screen, prompting the user for any key or q to quit. If the user presses any key other than q, the game progresses. If the user presses q, the program quits with a gameover screen and thanks for playing.
  * The user will be prompted again if they would like to see the rules with a simple yes no statement. If the user selects no, they skip the rules and are taken to the difficulty setting screen. If the user selects yes, they are taken to the rules page.
  * On the rules page, the user shown the general outline of the game in text and prompted to press any key. Next they will be taken through an interactive live demo of the game itself. Once this has finished, they will be prompted to press any key and taken to the difficulty setting.
  * The user is prompted to select a difficulty setting from easy through to insane. Once they have made a selection the game starts.
  * The user is shown an ascii art countdown from three to one
  * From now until the game over screen, the current score and level of difficulty is displayed at the top of the screen
  * The user is then shown a random phrase. Each of these phrases is first typed onto a random part of the screen, before being flashed randomly around the screen. This is repeated a random amount of times. 
  * The user is then shown a random prompt containing one word surrounded in square brackets in all caps. It is typed and flashed in the same manner as the phrases before stopping and waiting for user input.
  * The user now must input the word that is surrounded in square brackets and is in all caps before they run out of time. 
  * If the user enters the correct word within the time limit, they will be shown a congratulatory message and their new total score
  * If the user does not enter the correct word within the time limit, they will be told that they have entered the word incorrectly and shown their new total score.
  * If the user does not finishing entering the word withing the time limit, they will be told that they ran out of time and shown their new total score.
  * At this stage the game will loop again as long as theirs either another prompt that hasn't been shown, or the players score is 0.
  * If there are no more phrases left in the array, the user will be shown a positive game over screen with their final score.
  * If the total score is 0, the user will be shown a negative game over screen.
  * A few seconds later, the user will be given a Y/N prompt and asked whether they want to play again.
  * If the user answers yes, the game restarts from the title page.
  * If the user answers no, the game will exit with an exit message.
  * If at any point the game throws an error, the program will stop gracefully and display easy to understand information about what happened.

</details>

----
----

## Manual testing table

<details>
  <summary>Table</summary>

  | Feature | Description of feature | Test Case ID | Expected Outcome | Actual Outcome | Is this a problem? | Changes/Comments |
  | ------ | --- | --- | --- | -|- |- |- | -| -|
  | command line --help |User is able to pass --help at the command line to bring up a help screen | 1 | help screen displayed from command line | nothing | Yes | I didn't allow pass the ARGV input to the class itself |
  | | | 2 | help screen displayed from command line |	displays help screen |	Nope! |	Changed the call to go through the init.rb file and passes it correctly to the terminal class |
  |Main typing method|	types out a passed string using a passed array to randomly choose sleep time between each character. Also colourizes randomly |	1 |	String to be typed out on screen in random colours with different pauses between characters |	After a lot of finicking to make it print, it worked properly |	No, but annoying to test |
  |Second typing method |	quickly writes a passed string in green|	1	|types quickly in green |	types at a medium pace in green | 	Ish	| I'm going to make it faster	|
  | | |2 |types quickly in green| types real fast now!|	No	|
  Third typing method|	types out a passed string at a medium pace. Also colourizes randomly|	1	|types out medium in multicolour|	same as expected|	no|	made it a tiny bit faster|
  String deleter method	|deletes amount of characters equal to passed string|	1	|deletes a typed string|	TTY cursor gem threw an error|	yes|	forgot a :|
  | | |2|	deletes a typed string|	as expected	|no
  Y/N prompt|	Should return true or false respectively|	1|	asks a yes or no q and then returns true or false|	as expected|	no
  Enter/Q prompt|	Should return true or false respectively|	1	|Prompts user for enter or q and wont progress until gets that input|	as expected	|no
  Display selection method|	Should display difficulties in menu format and allow you to choose one, then assign the difficulty instance variable |	1 |	Prompts user and returns d1..d4	|as expected|	no
  Random Cursor method|	Should move the cursor to a random place using passed width and height console variables|	1|	Moves cursor to a random place on the screen|	as expected	|no
  Flash method	|Should flash a passed string a passed amount of times. Also will flash in random places each time in a different colour|	1|	flashes string as desribed|	Undefined method for difficulty selector|	yes|	I think I need to assign my difficulty variable first for this test to work.
  | | |2|	flashes string as desribed|	as expected|	no|	Didn't req the right module, duh
  Timed input w/o answer|	Should time out based on passed variable and return no answer string|	1|	returns no answer string|	as expected|	no
  Timed input w/ answer|	Should return answer and set elapsed instance variable to time taken to input|	1|	returns answer an elapsed time|	doesn't set variable|	yes|	Need to figure out why its not setting and returning this variable
  | | | 2	|returns answer an elapsed time |	as expected|	no|	I needed to move the method into the game class itself as its a variable setting class|
  Scoring method true|	Should display positive message and show new score deducted by elapsed * 100 to 2 decimal places|	1|	As described|	as expected	|no|	also needs to sit in the game class as it changes instance variables
  Scoring method false|	Should display negative message and show new score deducted by passed penalty integer |	1	|as decribed|	almost as expected, only deducts 5 points|	yes	|This has to do with the difficulty variable, will tweak the array positions
  |||2|	as decribed	|as expected|	no
  Scoring method no answer |	Should display different negative message and show new score deducted by passed penalty integer|	1	|as decribed|	as expected|	no| 
  Warning screen|	Should show the user a warning screen regarding flashing components of game for 3 second	1|	as described	|as expected|	no
  Title screen|	Should type out title quickly and wait for user input|	1|	as described	as expected	|no
  Game over more than 0	|Should show a positive game over message with final score and ask player if they want to play again|	1	|as described	|as expected	|no
  Game over 0 |	Should show a negative game over message with final score and ask player if they want to play again	|1|as described|	as expected	|no
  game over replay|	Should allow the player to replay or quit depending on y or no answer|	1	|as described|	as expected|	no	
  rules screen|	Should show rules and prompt for input. Should then demo the game automaticallty, then prompt for user input to continue.|	1|	as described	|as expected|	no	
  Countdown|	Should countdown 3 2 1 typed fast and colourized|	1|	as described	|as expected|	no	
  Skip intro|	Game will skip the intro if given a command line arg to set difficulty|	1	|as described|	did not skip intro|	yes|	I need to tweak my case statments, It's not finding any difficulty things
  | | |2|	as described|	as expected	|no|	It will now take the first difficulty argument
  Quit at game title|	Game will quit if you press q at the title screen|	1	|as described	Didn't quit, just kept going|	yes|	Will need to call a method to change the bool value, maybe?
  | | |2|	as described|	Finally works|	no|	This took a bit of finagling, but now the terminal reads the game instance running variable each loop to decide if it should loop again			
  Skip rules|	Game will skip rules if no is selected from skip rules section|	1	| as described	|as expected	|no
  Check score |	Game will check score and end before command prompt is empty if it is equal to 0|	1|	as described|	as expected	|no				
  Prompt array while loop |	Game will end once there are no more prompts left in the prompt array	|1|	as described|	as expected	|no		
  No colour mode|	Game will run in black and white if given correct argument|	1	|as described	as expected| 	no	
  Game runs|	Game should run error free from the init.rb file on normal playthough|	1|	Full play through with on easy with no command line arguments	|Crashed after 1 prompt flash	|yes|	Changed the data array phrases.| Unfortunately Faker will create the same quote 15 times if you duplicate it 15 times in a new array, which makes sense.
  | | |1|	Full play through with on easy with no command line arguments|	as expected|	no	|Hooray!			
  Game will play through normally on all difficulty settings|	1|	Full play through on all difficulties	|as expected|	no	
  Game will play through normally with all -d settings|	using all -d1 to -d4 settings + combos of -d's|	1	|as described|	some words would be incorrect even when correct	|yes|	The checker was reading ?,! and commas as part of the word if it was tacked on at the end of bracket
  | | |2|	as described	|as expected	|no|	yay!
  Game will play through with -nc args passed|	Game should run completely in b/w with -nc passed|	1|	as decribed|	one line in the rules demo was coloured|	yes|	easy bugfix
  | | | 2|	as decribed	|as expected	|no	
  Game will always display help menu when passed| --help	help screen should always take precedence over any other command line arg|	1|	As described	|as expected|	no	
  What happens if I mash the keyboard during the game typing phases?|	The keyboard mash will probably mess with the typing function|	1	|as described|	as expected|	not really|	It doesnt break the game, but it doesnt look good either. I'll see if I can add a keyboard input blocker on the last day

</details>