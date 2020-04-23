require 'tty-cursor'
require 'tty-screen'
require 'timeout'

require_relative '../modules/data'
require_relative '../modules/functions'

class Game

    include DifficultyModule
    include DataModule
    include FunctionsModule

    attr_accessor :skipintro, :difficulty, :phrasearr, :promptarr, :cursor, :width, :height, :elapsed, :score

    def initialize(argv=[])

        game_crash(argv)
        @skipintro = false
        @difficulty = DIFFICULTY[:d1]
        @phrasearr = phrase_select()
        @promptarr = prompt_select(:d1)
        @cursor = TTY::Cursor
        @width = TTY::Screen.width
        @height = TTY::Screen.height
        @elapsed = nil
        @score = 10000

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
                input = gets.strip
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

end