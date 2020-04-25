
#This class acts as a game instantiator and looper. It also filters ARGV input, rescues unexpected game errors into a formatted message and contains the help screen for program.
class Terminal

    require_relative 'game'

    attr_reader :argv

    #The initialize method is passed the command line argument array to validate
    def initialize(argvarray=Array.new)

        @argv = command_line_validator(argvarray)

    end

    #this method starts the "play again" game loop and listens for false 
    #from the main game instance. It also formats any unexpected errors and ends the game
    def start
        running = true
        while running
            begin
                game = Game.new(@argv)
                game.game_start
                running = game.running
            rescue => e
                puts "The game crashed!"
                puts
                puts "Error class: #{e.class}"
                puts
                puts "Error message: #{e.message}"
                puts
                puts "#{e.backtrace}"
                puts
                puts "Sorry =("
                return running = false
            end
        end
    end

    #This method takes the ARGV input from the command line and either shows the
    #help page, returns the inputs or raises an error
    def command_line_validator(array)
        if array.any?{ |x| ["-nc","-d1","-d2","-d3","-d4","--help","-crash"].include? x } 
            case
            when array.size > 2
                raise StandardError, "Too many arguments provided"
            when array.include?("--help")
                help_screen()
                exit
            when array.include?("-crash")
                return ["-crash"]
            when array.size <= 2
                return array
            end
        elsif array.empty?
            return array
        else
            raise StandardError, "Argument not recognized"
        end
    end

    #This is the help screen that is displayed when --help is used on the command line
    def help_screen
        system 'clear'
        puts "██████╗ ██╗██╗   ██╗███████╗██████╗  █████╗ ██████╗     ██╗  ██╗███████╗██╗     ██████╗ "
        puts "██╔══██╗██║██║   ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗    ██║  ██║██╔════╝██║     ██╔══██╗"
        puts "██║  ██║██║██║   ██║█████╗  ██████╔╝███████║██████╔╝    ███████║█████╗  ██║     ██████╔╝"
        puts "██║  ██║██║╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══██║██╔══██╗    ██╔══██║██╔══╝  ██║     ██╔═══╝ "
        puts "██████╔╝██║ ╚████╔╝ ███████╗██████╔╝██║  ██║██║  ██║    ██║  ██║███████╗███████╗██║     "
        puts "╚═════╝ ╚═╝  ╚═══╝  ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝    "
        puts
        puts "Welcome to the help screen!"
        puts "========================================================================"
        puts
        puts "=================================================== Command line options"
        puts "ruby init.rb --help"  
        puts "#displays the help screen in the terminal. This contains rules and a" 
        puts "command line guide"
        puts 
        puts "ruby init.rb -nc" 
        puts "#runs the program in black and white"
        puts 
        puts "ruby init.rb -d1"     
        puts "#sets the difficulty of the game from the command line and skips the" 
        puts "introduction, rules and difficulty selection screens." 
        puts "-d1 = easy"
        puts "-d2 = medium"
        puts "-d3 = hard"
        puts "-d4 = insane"
        puts 
        puts "ruby init.rb -crash"
        puts "#will crash the program, if you're into that kind of thing"
        puts 
        puts "You can pass the -nc argument with a -d(x) argument"
        puts "If than one -d(x) argument is passed, the game will select the first one"
        puts "If you pass more than two arguments, the terminal will raise an error."
        puts 
        puts "=================================================== How to play the game"
        puts
        puts "DiveBar is a reaction type game based on typing"
        puts ""
        puts "When the game begins, it will show you a warning, a title screen, the"
        puts "rules and prompt you to select the difficulty"
        puts ""
        puts "The game will then count down and start begin typing and flashing"
        puts "phrases. Eventually one of these phrases will contain a word in square"
        puts "brackets that looks like [THIS]"
        puts ""
        puts "When you see [THIS] word, you must type the word as quickly as possible"
        puts "into the terminal and press enter"
        puts ""
        puts "If you get it right, you lose a small amount of points based on your"
        puts "reaction time. If you get it wrong you will lose a large amount of"
        puts "points. If you run out of time, you will lose a large amount of points."
        puts ""
        puts "The game ends when you either make it through 5 word prompts, or you"
        puts "run out of time."
        puts ""
        puts "============================================= Error handling information"
        puts 
        puts "DiveBar includes formatting for error handling . If you run into a bug"
        puts "or error, feel free to send me a message through github or fork the repo"
        puts "and contribute!"
    end

end