require 'tty-cursor'
require 'tty-screen'
require 'timeout'
require 'io/console'

require_relative '../modules/data'
require_relative '../modules/functions'
require_relative '../modules/ascii'

class Game

    include DifficultyModule
    include DataModule
    include FunctionsModule
    include AsciiArt

    attr_accessor :running, :intro, :difficulty, :phrasearr, :promptarr, :cursor, :width, :height, :elapsed, :score

    def initialize(argv=Array.new)

        @running = true
        @intro = true
        @difficulty = DIFFICULTY[:d1]
        @phrasearr = phrase_select()
        @promptarr = prompt_select(:d1)
        @cursor = TTY::Cursor
        @width = TTY::Screen.width
        @height = TTY::Screen.height
        @elapsed = nil
        @score = 10000
        game_crash(argv)
        command_line_arguments(argv)
    end

    def game_start

        clear()
        warning()

        clear()
        if @intro
            if title()
                clear()
                yes_no("Do you want to read the rules and see a live demo?") ? rules() : nil
                clear()
                difficulty_key = difficulty_menu()
                @difficulty = DIFFICULTY[difficulty_key]
                @promptarr = prompt_select(difficulty_key)
            else
                @running = false
                exit
            end
        end
        
        clear()
        countdown()

        until @promptarr == []

            phrases = @phrasearr.dup
                @difficulty[3].times do
                    clear()
                    phrase = selector(phrases)
                    random_cursor(@height,@width)
                    main_typer(phrase,@difficulty)
                    flash(phrase,@difficulty,@height,@width)
                    phrases = deleter(phrase,phrases)
                end

            clear()
            prompt = selector(@promptarr)
            random_cursor(@height,@width)
            main_typer(prompt,@difficulty)
            flash(prompt,@difficulty,@height,@width)
            input = timed_input()
            scorer(checker(input,prompt))
            deleter(prompt,@promptarr)

            check_score()
        end

        @running = game_over(@score)

    end

private

    #Method takes the filtered command line arguments and changes instance variables accordingly
    def command_line_arguments(array)
        (array.size).times do
            case 
            when array.include?("-nc")
                colour_changer(:white)
                array.delete("-nc")
            when array.any?{ |x| ["-d1","-d2","-d3","-d4"].include? x }
                key = (array[0])[1,2].to_sym
                @difficulty = DIFFICULTY[key]
                @promptarr = prompt_select(key)
                @intro = false                        
            end
        end
    end

    #This method raises an error if the command line argument includes -crash
    def game_crash(array)
        if array.include?("-crash")
            raise StandardError, "Why did you do this to me, John?"
        end
    end

    def timed_input
        begin
            timer = Timeout::timeout(@difficulty[1]) {
                starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
                $stdin.iflush
                input = STDIN.gets.strip
                ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
                @elapsed = (ending - starting).round(2)
                return input
            }
        rescue => exception
            return "no answer"            
        end
    end

    def scorer(string)
        if string == "true"
            system "clear"
            type_and_delete "You answered in enough time!"
            type_and_delete "Answered in #{@elapsed} seconds"
            @score = (@score - (@elapsed * 100)).to_i
            type_and_delete "Your score is now #{@score >= 0 ? @score : 0}"
        elsif string == "false"
            system "clear"
            type_and_delete "You typed it wrong!"
            @score = (@score - @difficulty[2]).to_i
            type_and_delete "Your score is now #{@score >= 0 ? @score : 0}"
        else
            system "clear"
            type_and_delete "You ran out of time!"
            @score = (@score - @difficulty[2]).to_i
            type_and_delete "Your score is now #{@score >= 0 ? @score : 0}"
        end
    end

    def check_score
        if @score <= 0
            @promptarr = []
        end
    end

end