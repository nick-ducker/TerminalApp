# frozen_string_literal: true

require 'colorize'
require 'tty-cursor'
require 'tty-prompt'

# This module is intended to house the game functions not related to game class instance variables
module FunctionsModule
  # Colour array used for the game in normal colour settings
  @@colours = %i[
    green
    light_red
    red
    light_green
    yellow
    light_yellow
    blue
    light_blue
    magenta
    light_magenta
    cyan
    light_cyan
  ]

  # reader method for @@colours
  def colours
    @@colours
  end

  # changes colour to passed key
  def colour_changer(key)
    @@colours = [key]
  end

  # returns a string of score and difficulty
  def score_display(score, difficulty)
    "Current Score: #{score}  |  Difficulty: #{difficulty[7]}".colorize(@@colours[0])
  end

  # selects a random element from an array
  def selector(array)
    array.sample
  end

  # deletes a passed variable from an array if found
  def deleter(variable, array)
    array.delete(variable)
    array
  end

  # checks input against a prompt and returns either true, false or no answer
  def checker(input, prompt)
    input == 'no answer' ? (return input) : nil
    match = prompt.split.find { |x| x[0] == '[' }.delete('[]')
    input.casecmp(match).zero? ? (return 'true') : (return 'false')
  end

  # types a passed string character by character using a passed sleep array in random colours
  def main_typer(string, difficulty)
    string.chars.each do |x|
      print x.colorize(selector(@@colours))
      sleep(selector(difficulty[4]))
    end
  end

  # types a passed string character by character fast in green
  def second_typer(string)
    string.chars.each do |x|
      print x.colorize(@@colours[0])
      sleep(0.003)
    end
    br
  end

  # types a passed string character by character at a medium pace in multicolor
  def third_typer(string)
    string.chars.each do |x|
      print x.colorize(selector(@@colours))
      sleep(0.02)
    end
    br
  end

  # deletes amount of characters equal to passed string
  def string_deleter(string)
    string.chars.each do |_x|
      print TTY::Cursor.backward(1)
      print TTY::Cursor.clear_char(1)
      sleep(0.03)
    end
  end

  # combines third type and delete method
  def type_and_delete(string)
    string.chars.each do |x|
      print x.colorize(selector(@@colours))
      sleep(0.02)
    end
    sleep(1.5)
    string.chars.each do |_x|
      print TTY::Cursor.backward(1)
      print TTY::Cursor.clear_char(1)
      sleep(0.03)
    end
  end

  # yes no method that takes a simply prompt that is typed out before the question is asked.
  def yes_no(prompt)
    third_typer(prompt)
    br
    TTY::Prompt.new.yes?('?')
  end

  # enter or q method used for title screen. Blocks all input except enter or q
  def enter_q
    third_typer 'Press Enter to continue or q to quit'
    br
    running = true
    while running
      input = STDIN.getch
      case input
      when "\r"
        running = false
        return true
      when 'q'
        running = false
        return false
      else
        next
      end
    end
  end

  # difficulty selection menu to set desired difficulty
  def difficulty_menu
    third_typer 'Select your desired difficulty'
    br
    TTY::Prompt.new.select('?') do |menu|
      menu.choice 'Easy', :d1
      menu.choice 'Medium', :d2
      menu.choice 'Hard', :d3
      menu.choice 'Insane', :d4
    end
  end

  # places the cursor in a random place according to the height and width given
  def random_cursor(height, width)
    print TTY::Cursor.down(rand(0..(height - 5))) + TTY::Cursor.forward(rand(0..(width - 10)))
  end

  # flashes a string using a difficulty hash to dictate amount of flashes, and time between flashes. Also places cursor randomly and displays score and difficulty
  def flash(string, difficulty, height, width, score)
    difficulty[5].times do
      clear
      puts score_display(score, difficulty)
      random_cursor(height, width)
      puts string.colorize(selector(@@colours))
      sleep(difficulty[6])
    end
  end

  # a simple system clear shortener
  def clear
    system 'clear'
  end

  # a simple break shortener
  def br
    puts
  end
end
