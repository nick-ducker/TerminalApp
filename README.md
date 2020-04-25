![Divebar logo](/docs/imgs/divebartitle.png)

## Installation Instructions

1. **Ensure Ruby is installed on your machine.** 
  
    Installation instructions for Ruby can be found [here](https://www.ruby-lang.org/en/documentation/installation/)

2. **You have two choices on how you would like to download the repo**
  
    a. Start up your preferred command line and navigate to where you wish to clone the repository using the cd command, then run git clone (http address provided in the clone tab above)
    ```
    cd (directory you with to clone to)
    git clone (http address found in "Clone or download" tab)
    ```

    b. Download the repository as a ZIP file using the "Clone or download" tab and unzip it into your preferred location using your desktop GUI.

3. **Navigate to the repository src folder using your command line**

    Start up your preferred command line and navigate into the divebar repository
    ```
    cd (location of divebar repository)
    ```
    Once here, use the same command to navigate into the src folder
    ```
    cd src
    ```

4. **You have two choices in how check for and install any Ruby Gems needed for the game** 

    a. Run the bash script by using the command below:
    ```
    ./INSTALL.sh
    ```

    b. **Manual installation using bundler**
      
    * Install bundler if you don't have it already
      ```
      install bundler
      ```
    * Use bundler to check the gemfile and install any dependecies required
      ```
      bundle install
      ```
    If you run into any issues, ensure you are in the src folder. If you are still running into both problems with the script and bundler programs, you can install the gems manually by checking the gemfile to see required gems. 
----
## How to play the game
1. Once installed, ensure you are in the divebar/src directory.

    From here you can run the init.rb file with
    ```
    ruby init.rb
    ```
    There are 4 different command line arguments you can pass to customize your experience
    ```
    ruby init.rb --help  
    #displays the help screen in the terminal. This contains rules and a command line guide

    ruby init.rb -nc     
    #runs the program in black and white

    ruby init.rb -d1     
    #sets the difficulty of the game from the command line and skips the introduction, rules and difficulty selection screens. 
    -d1 = easy
    -d2 = medium
    -d3 = hard
    -d4 = insane

    ruby init.rb -crash
    #will crash the program, if you're into that kind of thing

    You can pass the -nc argument with a -d(x) argument
    If than one -d(x) argument is passed, the game will select the first one
    If you pass more than two arguments, the terminal will raise an error.
    ```

2. If you run into any errors, update your gems using the bash script provided or running a gem update command
    ```
    ./INSTALL.sh

    OR
    
    gem update --system
    ```

---