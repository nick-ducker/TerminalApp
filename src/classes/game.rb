# frozen_string_literal: true

require 'tty-cursor'
require 'tty-screen'
require 'timeout'
require 'io/console'

require_relative '../modules/data'
require_relative '../modules/functions'
require_relative '../modules/ascii'

# The main game class that is responsible for the flow of each instantiated game.
class Game
  include DifficultyModule
  include DataModule
  include FunctionsModule
  include AsciiArt

  attr_accessor :running, :intro, :difficulty, :phrasearr, :promptarr, :cursor, :width, :height, :elapsed, :score

  def initialize(argv = [])
    @running = true
    @intro = true
    @difficulty = DIFFICULTY[:d1]
    @phrasearr = phrase_select
    @promptarr = prompt_select(:d1)
    @cursor = TTY::Cursor
    @width = TTY::Screen.width
    @height = TTY::Screen.height
    @elapsed = nil
    @score = 10_000
    game_crash(argv)
    command_line_arguments(argv)
    print @cursor.hide
  end

  # This method runs through associated methods to play game from start to finish
  def game_start
    clear
    warning
    clear
    if @intro
      introduction()
    end
    clear
    countdown
    until @promptarr == []
      game_round()      
    end
    @running = game_over(@score)
  end

  private

  #displays title, rules and difficulty selection
  def introduction
    if title
      clear
      yes_no('Do you want to read the rules and see a live demo?') ? rules : nil
      clear
      difficulty_key = difficulty_menu
      @difficulty = DIFFICULTY[difficulty_key]
      @promptarr = prompt_select(difficulty_key)
    else
      @running = false
      exit
    end
  end

  #Runs a single game round, deleting selected prompt after game.
  def game_round
    phrases = @phrasearr.dup
      @difficulty[3].times do
        clear
        phrase = selector(phrases)
        display_to_user(phrase)
        phrases = deleter(phrase, phrases)
      end

    clear
    prompt = selector(@promptarr)
    display_to_user(prompt)
    input = timed_input
    print @cursor.hide
    scorer(checker(input, prompt))
    deleter(prompt, @promptarr)

    check_score
  end

  #Wraps display methods into a single method to slim code
  def display_to_user(string)
    puts score_display(@score, @difficulty)
    random_cursor(@height, @width)
    round_typer(string, @difficulty)
    string_flasher(string, @difficulty, @height, @width, @score)
  end

  # Method takes the filtered command line arguments and changes instance variables accordingly
  def command_line_arguments(array)
    array.size.times do
      if array.include?('-nc')
        colour_changer(:white)
        array.delete('-nc')
      elsif array.any? { |x| ['-d1', '-d2', '-d3', '-d4'].include? x }
        key = (array[0])[1, 2].to_sym
        @difficulty = DIFFICULTY[key]
        @promptarr = prompt_select(key)
        @intro = false
      end
    end
  end

  # This method raises an error if the command line argument includes -crash
  def game_crash(array)
    raise StandardError, 'Why did you do this to me, John?' if array.include?('-crash')
  end

  # Starts timeout for input as well as flushing the keyboard buffer so previous key strikes will not influence answer
  def timed_input
    Timeout.timeout(@difficulty[1]) do
      starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      print @cursor.show
      $stdin.iflush
      input = STDIN.gets.strip
      ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      @elapsed = (ending - starting).round(2)
      return input
    end
  rescue StandardError
    $stdin.iflush
    'no answer'
  end

  # Changes the score according to the given string by the checker method and displays appropriate message
  def scorer(string)
    system 'clear'
    if string == 'true'
      type_and_delete 'You answered in enough time!'
      type_and_delete "Answered in #{@elapsed} seconds"
      @score = (@score - (@elapsed * 100)).to_i
    elsif string == 'false'
      type_and_delete 'You typed it wrong!'
      @score = (@score - @difficulty[2]).to_i
    else
      type_and_delete 'You ran out of time!'
      @score = (@score - @difficulty[2]).to_i
    end
    type_and_delete "Your score is now #{@score >= 0 ? @score : 0}"
  end

  # Checks the score each prompt and will set the prompt array to an empty array, therefore ending the game, if the score is 0
  def check_score
    @promptarr = [] if @score <= 0
  end
end
