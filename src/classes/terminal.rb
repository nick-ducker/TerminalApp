class Terminal

    require_relative 'game'

    attr_reader :argv

    #The initialize method is passed the command line argument array to validate
    def initialize(argvarray)

        @argv = command_line_validator(argvarray)
        @running = true

    end

    #this method should start the "play again" game loop and listen for false 
    #from the main game instance
    def start
        while @running
            begin
                @running = Game.new(@argv)
            rescue => e
                puts "The game crashed!"
                puts
                puts "Error class: #{e.class}"
                puts
                puts "Error message: #{e.message}"
                puts
                puts "Error backtrace: #{pp e.backtrace}"
                puts
                puts "Sorry =("
                return @running = false
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
                #SHOW HELP PAGE
            when array.include?("-crash")
                return ["-crash"]
            when array.size <= 2
                return array
            end
        else
            raise StandardError, "Argument not recognized"
        end
    end

end