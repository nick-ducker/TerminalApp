class Terminal

    attr_reader :argv

    #The initialize method is passed the command line argument array to validate
    def initialize(argvarray)

        @argv = command_line_validator(argvarray)

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