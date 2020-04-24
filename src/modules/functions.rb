require 'colorize'
require 'tty-cursor'
require 'tty-prompt'

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
    def main_typer(string,difficulty)
        string.chars.each do |x|
            print x.colorize(selector(@@colours))
            sleep(selector(difficulty[4]))
        end
    end

    #types a passed string character by character fast in green
    def second_typer(string)
        string.chars.each do |x|
            print x.colorize(@@colours[0])
            sleep(0.003)
        end
        puts
    end

    #types a passed string character by character at a medium pace in multicolor
    def third_typer(string)
        string.chars.each do |x|
            print x.colorize(selector(@@colours))
            sleep(0.02)
        end
        puts
    end

    #deletes amount of characters equal to passed string
    def string_deleter(string)
        string.chars.each do |x|
            print TTY::Cursor.backward(1)
            print TTY::Cursor.clear_char(1)
            sleep(0.03)
        end
    end

    #combines third type and delete method
    def type_and_delete(string)
        string.chars.each do |x|
            print x.colorize(selector(@@colours))
            sleep(0.02)
        end
        sleep(1.5)
        string.chars.each do |x|
            print TTY::Cursor.backward(1)
            print TTY::Cursor.clear_char(1)
            sleep(0.03)
        end
    end

    def yes_no(prompt)
        third_typer(prompt)
        puts
        return TTY::Prompt.new.yes?("?")
    end

    def enter_q
        third_typer "Press Enter to continue or q to quit"
        puts
        running = true
        while running 
            input = STDIN.getch
            case input
            when "\r" 
                running = false
                return true
            when "q"
                running = false
                return false
            else
                next
            end
        end
    end 

    def difficulty_menu
        third_typer "Select your desired difficulty"
        puts
        TTY::Prompt.new.select("?") do |menu|
            menu.choice 'Easy', :d1
            menu.choice 'Medium', :d2
            menu.choice 'Hard', :d3
            menu.choice 'Insane', :d4
        end
    end

    def random_cursor(height,width)
        print TTY::Cursor.down(rand(0..(height - 5))) + TTY::Cursor.forward(rand(0..(width - 10)))
    end

    def flash(string,difficulty,height,width)
        difficulty[5].times do
            system 'clear'
            random_cursor(height,width)
            puts string.colorize(selector(@@colours))
            sleep(difficulty[6])
        end
    end

    def clear
        system 'clear'
    end

    def br
        puts
    end
end

