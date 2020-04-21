# (ASCII ART IMAGE)

## Software Development Plan
##### By Nick Ducker

<br>

*Content links*

<br>

---
## Statement of Purpose and Scope
**Dive Bar** is a Quick Time Action (QTE) game developed using pure Ruby, solely for use in the command line terminal. It is intended to be a tribute to the classic Japanese QTE games in the "Shenmue" adventure series developed by Sega. 

#### Description of Application
The premise of **Dive Bar** is that you're a bartender working by yourself in a busy dive bar. You will need to perform actions in a hectic environment in order for the night to run smoothly. Failure to perform the tasks will result in angry customers and maybe an empty bar!

At it's core, the game is based on a simple time pressure mechanic. The player will be shown a sentence and will have to type the highlighted word in the sentence as fast as possible. If the player enters the word in time, and the word is correct, they will only lose a small amount of points based on the time taken to answer. If the player fails to enter the word in time, they will lose points. If the player enters the word in time but the word is wrong, they will also lose points. 

The twist in this simple mechanic is the way the prompts are displayed to the user. Instead of it simply displaying text and timing the input, **Dive Bar** will throw random snippets of conversation at the user if a confusing manner. Eventually a prompt will be displayed in the same manner, before pausing for user input. A player trying for a high score, or trying to win the game at higher difficulty levels, will have to pay attention to all the snippets until they see the highlighted keyword. 

#### Motivation

**Dive Bar** is not to designed to redefine gaming mechanics or be a "helpful" program, but is instead intended to be a throwback to the aformentioned QTE games developed by Sega. My hope is that anyone who has previously enjoyed the Shenmue series or enjoys time pressure mechanics in their game experience will get a kick out of this simple program. 

The QTE mechanic is classically based around some kind of graphical action sequence wherin the player is periodically prompted for input in order to progress further. This input is usually time sensitive. If the player does not hit the correct button, or takes too long to do so, they are penalized and/or must restart the sequence. 

I did some brainstorming and experimentation with the concept in the week leading up to developing **Dive Bar**. Initially, I wanted to try and create some form of map based "Restaurant Dash" style game, where the player would have to move between tables and a kitchen quickly when prompted. Ultimately I moved away from the idea as it became clear that the scope of the project was too large for the time availabe to develop.

I then started moving toward the concept of a more text based interaction with a similar mechanic based around entering text. While I think creating a map based game would certainly feel more hectic if coupled with text, I'm happy with the way **Dive Bar** turned out. While it is a simple game, I think it provides good challenges and rewards to players who are willing to spend some time trying to maximise their scores or pass one of the higher difficulty levels.

----

## List of Features in **Divebar**

#### Core Features
* **Takes Command Line Arguments to Customize Experience**
   
  *  The game recognizes ARGV input from the terminal and takes a few simple commands to help streamline use for experienced users;
     *   The program is able to skip the title, rules and difficulty settings if given a corresponding argument. This is done by wrapping the Title, Rules and Difficulty in a control flow statement that checks whether a ARGV input of -d1 to -d4 has been given to decide the difficulty. If so, it will skip straight to the game. 


        * The program displays in a "no colour mode" if given the argument -nc. This is acheived by changing the colour array stored in the game class to a single element array that contains the colour colorize gem symbol for white. 
  
        * The program will display a help page if it is passed the argument --help. This is acheived by having the terminal class check for an ARGV statement that matches --help. If so, it will display a help page to the terminal and quit. The help screen is stored in a seperate module to keep code neat. 

* **Interactive title & rule screens**

  * Instead of a fully static timed title screen, the **Dive Bar** will prompt the user to press any key to continue, or q to quit. This is done through the use of a superficial terminal class that is only responsible for looping the game. By default this loop has a "running" variable that is set to true. During each iteration of the loop, this variable will listen to an instance of the game class. If the instance returns false, this will change the running variable and cause the game to quit gracefully.

  * **Dive Bar** also has a rule screen that is optional. The user is given a yes/no prompt (using the tty prompt gem) that feeds into a simple when statement within the "rules" function of the game class. A yes will display the rules, a no will cause the game to move onto the difficulty settings. 

  * The rule page itself has a written explanation of the game, followed by a quick demo of the game mechanic, walking the user through a tutorial of how the game works. 

    This is done by essentially recycling the game class functions into the rule ?? function(or class??) and giving the game a "tutorial" difficulty by default, where only one snippet will be displayed, followed by a prompt with an extremely long prompt. 

* **Preset Difficulty Settings**
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

* **Randomized Sets of Phrases and Prompts**
  * Phrases:
    
    Each time the game is instantiated by the terminal app, the games data module should generate an array containing three differently themed arrays of phrases (using the Faker gem). It will then randomly pass one of these arrays to the phrases instance variable to be used in the game itself. This is included to encourage replayability, giving the player a relatively fresh set of quotes each time they replay the game. 

  * Prompts

    The prompts work similarly to the phrases in the sense that the data module passes a random array of prompts to the game instance each time the game is instantiated, depedant on the difficulty. The difference is that the prompts themselves are hardcoded into the data module. The prompts of each difficulty are completely different to one another. However, each difficulty comes with 2 sets of 5 prompts. Each set for a given difficulty mirrors the other in all but the word to be typed. This also encourages replayability and keeps the game fresh.

* **Confusing Display**
    
    * During the game, the user will be shown a series of random phrases pulled from the phrase array. The way these phrases are displayed are modified in x different ways to confuse the user;
      
      * Depending on the difficulty, a random number of phrases will be displayed before the prompt. This is done by creating a x.times loop within the main game loop that uses a difficulty variable in order to choose a random number from a particular range.


      * The game will then choose a random prompt by first duplicating the instance variable prompt array. It will then shuffle the duplicated and selecting whatever is first. This is done with a shuffling function that simply shuffles whatever array is fed to it and returns the first element. 
      * The game selects a random place in the terminal to move the cursor. This is done using a mixture of the tty-screen and tty-cursor gems. When the game is instantiated, it gathers the size of the screen and assigns them to line and column variables. Using TTY-cursor, the cursor is then moved to a random line and column on the screen using a move_cursor function
      * The game will then use a typer function to "type" out in a broken fashion the phrase by printing each character, then sleeping for a random amount of milliseconds selected from a range dependant on difficulty. This creates a "stop starty" rhythm to the way the text is displayed. Each character is also colored randomly (using the colorize gem) by randomly choosing a symbol from an instance variable array on each character. 
        
        Once the phrase has been typed out, the screen is cleared then the phrase is flashed, using a flasher function, a random amount of times dependant on difficulty. This is looping a screen clear, calling the move_cursor function, showing the phrase and sleeping for random amount of time.

      * After flashing the phrase, the phrase is then fed to a deleter function that deletes a passed argument that matches an element in the passed array. In this case, we are feeding the phrase displayed with the corresponding duplicated prompt array. This ensures that every prompt displayed will be different and there will be no duplications, as the array will get smaller each iteration.

      * Once the x.times loop responsible for flashing phrases has ended, the same steps are also applied to a single prompt, except at on its final flash it waits for a set amount of time for user input. Once the program gets input, it will delete the prompt from the prompts instance variable using the deleter function. Deleting the prompt from the instances prompt array variable serves a double purpose. Its a tracker for the progress of the game, allowing each iteration of the main game loop to check whether there are still prompts to be used and therefore whether another iteration must be performed. It also ensures that prompts in the prompt array have no chance to be duplicated in following round. 

* **Timed Input**
  
  *  The player will have a limited amount of time to enter the prompted word once the prompt has stopped moving. This is acheived by using input = time_input. This timed_input function is essentially a error handling function. 
  
     Using the timeout gem, the game starts a timer, then asks for input. If the user enters something before the timer expires, the timed_input function will return that answer. If the user runs out of time, the timeout gem will throw an error. This is handled with a rescue statement which defaults the input to a "no answer" string and returns it.

     Additionally, the timed_input function another times the input by getting the current time just before asking for input and assigns it to a variable. Once input has been entered, the time is again assigned to a different variable. By deducting the starting time from the ending time, we have the amound of seconds it took for the player to enter their answer. This is then saved to an instance variable and used in scoring correct answers. 

* **Dynamic Scoring**
  
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



  










