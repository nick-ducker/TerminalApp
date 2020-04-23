require 'colorize'
require 'tty-cursor'

module FunctionsModule

    @@colours = [
        :green,
        :light_red,
        :red,
        :light_green,
        :yellow,
        :light_yellow,
        :blue,
        :light_blue,
        :magenta,
        :light_magenta,
        :cyan,
        :light_cyan,
    ]

    #reader method for @@colours
    def colours
        return @@colours
    end

    #changes colour to passed key
    def colour_changer(key)
        @@colours = [key]
    end

    #returns a string of score and difficulty
    def score(score,difficulty)
        return "Current Score: #{score}  |  Difficulty: #{difficulty}"
    end

    #selects a random element from an array
    def selector(array)
        return array.shuffle.first
    end

    #deletes a passed variable from an array if found
    def deleter(variable,array)
        array.delete(variable)
        return array
    end

    #checks input against a prompt and returns either true, false or no answer
    def checker(input,prompt)
        input == "no answer" ? (return input) : nil
        match = prompt.split.find{|x| x[0] == "["}.delete("[]")
        input.casecmp(match) == 0 ? (return "true") : (return "false") 
    end

    #types a passed string character by character using a passed sleep array in random colours
    def main_typer(string,sleeparray)
        string.chars.each do |x|
            print x.colorize(selector(@@colours))
            sleep(selector(sleeparray))
        end
    end

    #types a passed string character by character fast in green
    def second_typer(string)
        string.chars.each do |x|
            print x.colorize(@@colours[0])
            sleep(0.003)
        end
    end

    #types a passed string character by character at a medium pace in green
    def third_typer(string)
        string.chars.each do |x|
            print x.colorize(selector(@@colours))
            sleep(0.02)
        end
    end

    #deletes amount of characters equal to passed string
    def string_deleter(string)
        string.chars.each do |x|
            print TTY:Cursor.backward(1)
            print TTY:Cursor.clear_char(1)
            sleep(0.03)
        end
    end

end

