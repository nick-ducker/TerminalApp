require 'test/unit'

require_relative '../classes/terminal'
require_relative '../classes/game'
require_relative '../module/data'
require_relative '../module/functions'

class TerminalTest < Test::Unit::TestCase

    def test_command_line_argument
    
        assert_equal("Sorry :(",Terminal.new([abcdefg]),"Terminal did not raise an exception when passed an invalid argument")

        assert_equal([-nc],Terminal.new([-nc]),"Terminal raised an exception when passed a valid argument")
        assert_equal([-d1],Terminal.new([-d1]),"Terminal raised an exception when passed a valid argument")
        assert_equal([-d4],Terminal.new([-d4]),"Terminal raised an exception when passed a valid argument")

        assert_equal([-d4,-nc],Terminal.new([-d4,-nc]),"Terminal raised an exception when passed more than one valid argument")

    end

    def test_rescue_statement
        
        assert_equal("Sorry :(",Terminal.new([-crash]), "The Terminal Class did not rescue the game when an error is raised in the game instance")

    end

end

class PhrasePromptTest < Test::Unit::TestCase
    
    include DataModule

    def test_phrase_select

        assert_equal(15, phrase_select().size, "phrase_select method from Data module does not return a 15 element array")

    end

    def test_prompt_select

        assert_equal(5, prompt_select(:d1).size, "prompt_select method from Data module does not return a 5 element array from d1")
        assert_equal(5, prompt_select(:d2).size, "prompt_select method from Data module does not return a 5 element array from d2")
        assert_equal(5, prompt_select(:d3).size, "prompt_select method from Data module does not return a 5 element array from d3")
        assert_equal(5, prompt_select(:d4).size, "prompt_select method from Data module does not return a 5 element array from d4")

    end

end

class DifficultyTest < Test::Unit::TestCase

    include DataModule

    def test_difficulty_hash_select

        assert_equal(8, difficulty_hash_selector(:d1).size, "difficulty hash selector from DataModule does not return an 8 element array from d1")
        assert_equal(8, difficulty_hash_selector(:d2).size, "difficulty hash selector from DataModule does not return an 8 element array from d1")
        assert_equal(8, difficulty_hash_selector(:d3).size, "difficulty hash selector from DataModule does not return an 8 element array from d1")
        assert_equal(8, difficulty_hash_selector(:d4).size, "difficulty hash selector from DataModule does not return an 8 element array from d1")

    end

end

class FunctionsTest < Test::Unit::TestCase

    include FunctionsModule

    def test_colour_readable

        assert_equal(Array, DataModule.colour.class, "Colour Array of Functions module is not readable outside the module")

    end

    def test_colour_changer

        colour_array(:white)
        assert_equal([:white], DataModule.colour, "Colour changer method does not change module variable to passed argument")

        colour_array(:green)
        assert_equal([:green], DataModule.colour, "Colour changer method does not change module variable to passed argument")

    end

    def test_score_display

        assert_equal("Current Score: 10000  |  Difficulty: Easy",score(10000,"Easy"), "Score display method does not display correctly")
        assert_equal("Current Score: 999  |  Difficulty: Medium",score(999,"Medium"), "Score display method does not display correctly")

    end

    def test_select_method

        assert_equal(1, selector([1,2,3,4,5]).size, "Select method does not return a single element")
        assert_equal(1, selector([5,10,34,99,0]).size, "Select method does not return a single element")

    end

    def test_delete_method

        assert_equal(4, deleter(1,[1,2,3,4,5]).size, "Delete method does not delete the passed argument from the passed array")
        assert_equal(6, deleter(20,[10,20,30,40,50,60,70]).size, "Delete method does not delete the passed argument from the passed array")

    end

    def test_checking_method

        assert_equal("true",checker("input","checking the [INPUT]"), "Checker method does not return true on matching input")
        assert_equal("false",checker("ipnut","checking the [INPUT]"), "Checker method does not return false on non-matching input")
        assert_equal("no answer",checker("no answer","checking the [INPUT]"), "Checker method does not return no answer on no answer input")

    end

end

class GameTester < Test::Unit::TestCase

    def test_game_attributes_readable

        game = Game.new

        assert_equal(false,game.skipintro, "Either cannot read @skipintro or is not set to correct default value")
        assert_equal(Array,game.difficulty.class, "Either cannot read @difficulty or is not returning an array")
        assert_equal(Array,game.phrasearr.class, "Either cannot read @phrasearr or is not returning an array")
        assert_equal(Array,game.promptarr.class,"Either cannot read @promptarr or is not returning an array")
        assert_equal(TTY::Cursor,game.cursor,"Either cannot read @cursor or it is not returning correct default value")
        assert_equal(Integer,game.width.class, "Either cannot read @width or it is not returning an integer")
        assert_equal(Integer,game.height.class, "Either cannot read @height or it is not returning an integer")
        assert_equal(nil,game.elapsed, "Either cannot read @elapsed or it is not returning nil")
        assert_equal(10000,game.score, "Either cannot read @score or it is not returning 10000")

    end

end