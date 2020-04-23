require 'test/unit'
require 'tty-screen'

require_relative '../classes/terminal'
require_relative '../classes/game'
require_relative '../modules/data'
require_relative '../modules/functions'

# class TerminalTest < Test::Unit::TestCase

#     def test_command_line_argument
    

#         exception = assert_raise("StandardError") { Terminal.new(["-abcdefg"]) }
#         assert_equal("Argument not recognized", exception.message)

#         terminal = Terminal.new(["-nc"])
#         assert_equal(["-nc"],terminal.argv,"Terminal raised an exception when passed a valid argument")

#         terminal = Terminal.new(["-d1"])
#         assert_equal(["-d1"],terminal.argv,"Terminal raised an exception when passed a valid argument")

#         terminal = Terminal.new(["-d4"])
#         assert_equal(["-d4"],terminal.argv,"Terminal raised an exception when passed a valid argument")

#         terminal = Terminal.new(["-d4","-nc"])
#         assert_equal(["-d4","-nc"],terminal.argv,"Terminal raised an exception when passed more than one valid argument")

#         exception = assert_raise("StandardError") { Terminal.new(["-d4","-nc","--help"]) }
#         assert_equal("Too many arguments provided", exception.message)

#     end

#     def test_rescue_statement
        
#         terminal = Terminal.new(["-crash"])
#         assert_equal(false,terminal.start)

#     end

# end

# class PhrasePromptTest < Test::Unit::TestCase
    
#     include DataModule

#     def test_phrase_select
#         phrases = phrase_select()
#         assert_equal(15, phrases.size)
#     end

#     def test_prompt_select

#         prompts = prompt_select(:d1)
#         assert_equal(5, prompts.size)

#         prompts = prompt_select(:d2)
#         assert_equal(5, prompts.size)

#         prompts = prompt_select(:d3)
#         assert_equal(5, prompts.size)

#         prompts = prompt_select(:d4)
#         assert_equal(5, prompts.size)
        
#     end

# end

# class DifficultyTest < Test::Unit::TestCase

#     include DifficultyModule

#     def test_difficulty_hash_select

#         difficulty = difficulty_selector(:d1)
#         assert_equal(8, difficulty.size)
#         assert_equal(Array, difficulty.class)

#         difficulty = difficulty_selector(:d2)
#         assert_equal(8, difficulty.size)
#         assert_equal(Array, difficulty.class)

#         difficulty = difficulty_selector(:d3)
#         assert_equal(8, difficulty.size)
#         assert_equal(Array, difficulty.class)

#         difficulty = difficulty_selector(:d4)
#         assert_equal(8, difficulty.size)
#         assert_equal(Array, difficulty.class)
        
#     end

# end

# class FunctionsTest < Test::Unit::TestCase

#     include FunctionsModule

#     def test_colour_readable

#         assert_equal(Array, colours().class, "Colour Array of Functions module is not readable outside the module")

#     end

#     def test_colour_changer

#         colour_changer(:white)
#         assert_equal([:white], colours(), "Colour changer method does not change module variable to passed argument")

#         colour_changer(:green)
#         assert_equal([:green], colours(), "Colour changer method does not change module variable to passed argument")

#     end

#     def test_score_display

#         assert_equal("Current Score: 10000  |  Difficulty: Easy",score(10000,"Easy"), "Score display method does not display correctly")
#         assert_equal("Current Score: 999  |  Difficulty: Medium",score(999,"Medium"), "Score display method does not display correctly")

#     end

#     def test_select_method

#         array = selector([1,2,3,4,5])
#         assert_equal(Integer, array.class, "Select method does not return a single element")

#         array = selector([5,10,34,99,0])
#         assert_equal(Integer, array.class, "Select method does not return a single element")

#     end

#     def test_delete_method

#         array = deleter(1,[1,2,3,4,5])
#         assert_equal(4, array.size, "Delete method does not delete the passed argument from the passed array")
        
#         array = deleter(20,[10,20,30,40,50,60,70])
#         assert_equal(6, array.size, "Delete method does not delete the passed argument from the passed array")

#     end

#     def test_checking_method

#         assert_equal("true",checker("input","checking the [INPUT]"), "Checker method does not return true on matching input")
#         assert_equal("false",checker("ipnut","checking the [INPUT]"), "Checker method does not return false on non-matching input")
#         assert_equal("no answer",checker("no answer","checking the [INPUT]"), "Checker method does not return no answer on no answer input")

#     end

# end

# class GameTester < Test::Unit::TestCase

#     def test_game_attributes_readable

#         game = Game.new

#         assert_equal(false,game.skipintro, "Either cannot read @skipintro or is not set to correct default value")
#         assert_equal(Array,game.difficulty.class, "Either cannot read @difficulty or is not returning an array")
#         assert_equal(Array,game.phrasearr.class, "Either cannot read @phrasearr or is not returning an array")
#         assert_equal(Array,game.promptarr.class,"Either cannot read @promptarr or is not returning an array")
#         assert_equal(TTY::Cursor,game.cursor,"Either cannot read @cursor or it is not returning correct default value")
#         assert_equal(Integer,game.width.class, "Either cannot read @width or it is not returning an integer")
#         assert_equal(Integer,game.height.class, "Either cannot read @height or it is not returning an integer")
#         assert_equal(nil,game.elapsed, "Either cannot read @elapsed or it is not returning nil")
#         assert_equal(10000,game.score, "Either cannot read @score or it is not returning 10000")

#     end

# end

class ManualTests
   
    include FunctionsModule
    include DifficultyModule
    def initialize
        #main_typer("I am being typed",[0.5,0.05])
        #second_typer("I am being typed quickly")

        #third_typer("Oh no, don't delete me..")

        #string_deleter("Oh no, don't delete me..")

        #yes_no("Do you want to play again?")

        #enter_q()

        #difficulty_menu()

        #random_cursor(TTY::Screen.height, TTY::Screen.width)

        # difficulty = difficulty_selector(:d1)
        # flash("I am being flashed",difficulty,TTY::Screen.height, TTY::Screen.width)

    end

end

#ManualTests.new

def test_timed_input
    game = Game.new
    input = game.timed_input
    puts input
    puts game.elapsed
end

test_timed_input()