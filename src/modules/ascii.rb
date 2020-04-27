# frozen_string_literal: true

require_relative 'functions'
require_relative 'data'

require 'tty-screen'

# Module to contain all the large ASCII titles for the game as well as large blocks of text required.
module AsciiArt
  include FunctionsModule
  include DifficultyModule

  # warning screen shown at the start of each game
  def warning
    fast_green_typer '██╗    ██╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ '
    fast_green_typer '██║    ██║██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ '
    fast_green_typer '██║ █╗ ██║███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗'
    fast_green_typer '██║███╗██║██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║'
    fast_green_typer '╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝'
    fast_green_typer ' ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ '
    br
    fast_green_typer 'This game contains flashing and fast moving coloured text'
    fast_green_typer '           Player discretion is advised'
    sleep(4)
  end

  # title screen for game instances
  def title
    fast_green_typer '██████╗ ██╗██╗   ██╗███████╗██████╗  █████╗ ██████╗ '
    fast_green_typer '██╔══██╗██║██║   ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗'
    fast_green_typer '██║  ██║██║██║   ██║█████╗  ██████╔╝███████║██████╔╝'
    fast_green_typer '██║  ██║██║╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══██║██╔══██╗'
    fast_green_typer '██████╔╝██║ ╚████╔╝ ███████╗██████╔╝██║  ██║██║  ██║'
    fast_green_typer '╚═════╝ ╚═╝  ╚═══╝  ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝'
    br
    print '      '; enter_q
  end

  # game over screen and control flow for displaying appropriate win or lose messages
  def game_over(score)
    fast_green_typer ' ██████╗  █████╗ ███╗   ███╗███████╗ ██████╗ ██╗   ██╗███████╗██████╗ '
    fast_green_typer '██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔═══██╗██║   ██║██╔════╝██╔══██╗'
    fast_green_typer '██║  ███╗███████║██╔████╔██║█████╗  ██║   ██║██║   ██║█████╗  ██████╔╝'
    fast_green_typer '██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗'
    fast_green_typer '╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗╚██████╔╝ ╚████╔╝ ███████╗██║  ██║'
    fast_green_typer ' ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝'
    br
    sleep(1)
    if score.positive?
      print '            '
      medium_rainbow_typer "Well done! Your final score was #{score}."
      sleep 1
      print '                  '
      type_and_delete 'Can you beat it next time?'
      print '        '
    else
      print '                          '
      medium_rainbow_typer 'Too fast for you!'
      sleep 1
      print '                '
      type_and_delete "Or maybe you're just getting warmed up..."
      print '             '
    end
    yes_no 'Play again?'
  end

  # rules title screen that clears before printing
  def rules_title
    system 'clear'
    fast_green_typer '██████╗ ██╗   ██╗██╗     ███████╗███████╗'
    fast_green_typer '██╔══██╗██║   ██║██║     ██╔════╝██╔════╝'
    fast_green_typer '██████╔╝██║   ██║██║     █████╗  ███████╗'
    fast_green_typer '██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║'
    fast_green_typer '██║  ██║╚██████╔╝███████╗███████╗███████║'
    fast_green_typer '╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝'
  end

  # rules automated demo method
  def rules
    rules_title
    br
    fast_green_typer 'Welcome to DiveBar! The worst job you never (or may have) had!'
    sleep(2)
    br
    fast_green_typer "The premise is simple. You're a bartender at a busy bar one weekend evening."
    fast_green_typer "It's your job to keep the night running smoothly by performing tasks as quickly as possible when something comes up!"
    sleep(4)
    br
    fast_green_typer "During the night, you'll be privy to all sorts of strange, wonderous banter from your patrons."
    fast_green_typer 'This will probably be distracting, but pay attention! You never know when something will need you attention!'
    sleep(5)

    rules_title
    br
    fast_green_typer 'Lets see how the game works'
    sleep(2)
    fast_green_typer "During your shift you'll hear(see) all sorts of strangeness, like this..."
    sleep(3)

    clear
    difficulty = DIFFICULTY[:d1]
    round_typer('Camouflage paint is belief in the interrelatedness of all things.', difficulty)
    string_flasher('Camouflage paint is belief in the interrelatedness of all things.', difficulty, TTY::Screen.height, TTY::Screen.width, 10_000)
    sleep(1)

    rules_title
    br
    fast_green_typer 'Depending on how busy it is (difficulty setting), you might see a lot of these, or only a few.'
    sleep(4)
    br
    fast_green_typer 'But pay attention, because eventually something will [NEED] something!'
    sleep(4)
    br
    fast_green_typer "when you see a word in [SQUARE] [BRACKETS], you'll need to type it out and press enter as fast as you can."
    sleep(4)
    br
    fast_green_typer "If you're too slow or you type it wrong, you'll lose a large amount of points!"
    sleep(4)
    br
    fast_green_typer "If you're fast enough, you'll only lose a small amount of points based on your reaction time."
    sleep(4)
    br
    fast_green_typer 'Lets see how it works...'
    sleep(2)

    clear
    round_typer('OH My GOD! SOMEONES PUKING! GET A [MOP]!!!', difficulty)
    string_flasher('OH My GOD! SOMEONES PUKING! GET A [MOP]!!!', difficulty, TTY::Screen.height, TTY::Screen.width, 10_000)
    clear
    promptcolour = colours
    puts 'OH My GOD! SOMEONES PUKING! GET A [MOP]!!!'.colorize(promptcolour[0])
    sleep(1)
    round_typer('[MOP]', difficulty)
    sleep(1)

    rules_title
    br
    fast_green_typer 'Simple!'
    sleep(1)
    fast_green_typer 'Enjoy your first shift ;)'
    sleep(1)
    fast_green_typer 'Press Enter to Continue'
    gets
  end

  # countdown that shows before the game begins
  def countdown
    fast_green_typer '██████╗ '
    fast_green_typer '╚════██╗'
    fast_green_typer ' █████╔╝'
    fast_green_typer ' ╚═══██╗'
    fast_green_typer '██████╔╝'
    fast_green_typer '╚═════╝ '
    sleep 1
    system 'clear'
    fast_green_typer '██████╗ '
    fast_green_typer '╚════██╗'
    fast_green_typer ' █████╔╝'
    fast_green_typer '██╔═══╝ '
    fast_green_typer '███████╗'
    fast_green_typer '╚══════╝'
    sleep 1
    system 'clear'
    fast_green_typer ' ██╗'
    fast_green_typer '███║'
    fast_green_typer '╚██║'
    fast_green_typer ' ██║'
    fast_green_typer ' ██║'
    fast_green_typer ' ╚═╝'
    sleep 1
    system 'clear'
  end
end
