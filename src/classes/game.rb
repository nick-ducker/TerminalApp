require 'tty-cursor'
require 'tty-screen'

require_relative '../modules/data'

class Game

    include DifficultyModule
    include DataModule

    attr_reader :skipintro, :difficulty, :phrasearr, :promptarr, :cursor, :width, :height, :elapsed, :score

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

end