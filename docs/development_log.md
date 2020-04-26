# Terminal App Development Log

## By Nick Ducker

### 20/4/20
* *1550 :* Created GitHub Repo and cloned to PC
* *1600 :* Created file structure for project
* *1700 :* First version of Purpose and Scope statement

### 21/4/20
* *0830 :* Re-wrote and re-structured Statement of Purpose and Scope V2
* *1200 :* Finished List of Features for SDP V1
* *1300 :* Finished User Interaction and Experience for SDP V1
* *1500 :* Finished Flowchart for SDP V1
* *1600 :* Created User stories in Trello V1
* *1700 :* Part way through Implementation Plan

### 22/4/20
* *1100 :* Finished implementation Plan V1
* *1400 :* Tests outline written for TDD and Manual Tests V1
* *1530 :* First version of Unit tests written
* *1640 :* First version of Manual tests written

### 23/4/20 Status update
At this stage, almost all of the initial documentation has been written. I tried to be as comprehensive as possible in all aspects of the documentation. The features and implementation plan is written with the intent that it could be given to another coder, and they should be able to create a very similar program. 

Perhaps the only part of the documentation that I feel is lacking is an explicit explanation of the gems used. I'll need to make sure I come back around to this before wrapping up the project in presentation.

The latest development has been finishing up writing my automated unit tests in Ruby and the manual test sheet. Between the unit tests and the manual test sheet, I'm pretty confident that I'll be able to test almost every aspect of the program before I actually put it all together. I'm really interested to see how this affects the experience of writing the code. I keep thinking that I'm spending too much time writing documentation and tests, but I'm hoping this pays off in the long run and makes the game extremely easy to code.

It's definitely an interesting experience to try and design every aspect of every method in your head, explain it and write a test for it, before you start coding it!

The next steps will be to start writing the code to pass the tests. Only once all of the tests are passing, will I start looking at my implementation plan.

### 23/4/20
* *0930 :* Debugged unit tests
* *0950 :* Wrote first status update
* *1130 :* Passed terminal class test suite
* *1220 :* Passed phrases and prompts test suite
* *1240 :* Passed difficulty test suite
* *1330 :* Passed functions test suite
* *1345 :* Passed game class test suite
* *1500 :* Passed --help screen manual test
* *1515 :* Passed main_typer manual test
* *1530 :* Passed second and third typer manual test
* *1540 :* Passed string deleter manual test
* *1550 :* Passed y/n prompt manual test
* *1600 :* Passed Enter Q prompt manual test
* *1615 :* Passed Difficulty selection manual test
* *1635 :* Passed Flasher manual test
* *1700 :* Passed Timed input manual test
* *1715 :* Passed Scoring method manual test
* *1730 :* Passed Warning screen manual test
* *1735 :* Passed Title screen manual test
* *1750 :* Passed Game over screen manual tests
* *1820 :* Passed Rule screen manual tests

### 24/4/20
* *0920 :* Passed Countdown and Skip intro manual tests
* *1000 :* Passed Enter Q title and skip rules manual tests
* *1015 :* Passed Check score and prompt array manual tests
* *1020 :* Passed no colour mode manual test
* *1030 :* Re-passed initial unit test suite

### 24/4/20 Status update
After a lot more time than I initially anticipated, I'm finally finished with all my testing. It was interesting to learn a lot more about unit testing and wrap my head around how it works a little better. 

I was surprised to find that the unit testing was actually much more intuitive and fast than doing manual tests. This may also be because most of what I was testing in my manual tests were more loop, graphic and input oriented, therefore sucking up a heap more time.

Additionally, I was surprised how much of the program I ended up writing just by designing many tests that covered most of the programs functioning. At this stage, I'll need to go through the implementation plan to fill in the gaps and flesh out the actual game loops using the tested functions. 

After that, I'll revisit the user stories and make sure I'm ticking off all the boxes there before moving on to adding anything extra that I want to include, refactoring my code and updating my documentation to reflect any small changes introduced in the actual writing of the program.

### 24/4/20
* *1130 :* Implementation complete
* *1900 :* Fixed bug where score checker wouldn't clear prompt array if score was 0
* *1925 :* Fixed bug where gets would crash the program if you passed a command line arg and also fixed a bug where any typing done before the prompt stopped moving would influence the timed input.
* *2000 :* Completed review of user stories and made sure program met them all

### 25/4/20
* *1640 :* Commented all code
* *1700 :* Created shell script file for easy installation
* *1720 :* DRY review complete
  
### 26/4/20
* *0940 :* Playtesting Complete
* 