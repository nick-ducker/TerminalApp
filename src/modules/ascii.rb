require_relative 'functions'
require_relative 'data'

require 'tty-screen'

module AsciiArt

  include FunctionsModule
  include DifficultyModule

  def warning
    second_typer "██╗    ██╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
    second_typer "██║    ██║██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
    second_typer "██║ █╗ ██║███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
    second_typer "██║███╗██║██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║"
    second_typer "╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
    second_typer " ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "
    puts
    second_typer "    This game contains, flashing and fast moving text"
    second_typer "             Player discretion is advised"
    sleep(4)
  end

  def title
    second_typer "██████╗ ██╗██╗   ██╗███████╗██████╗  █████╗ ██████╗ "
    second_typer "██╔══██╗██║██║   ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗"
    second_typer "██║  ██║██║██║   ██║█████╗  ██████╔╝███████║██████╔╝"
    second_typer "██║  ██║██║╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══██║██╔══██╗"
    second_typer "██████╔╝██║ ╚████╔╝ ███████╗██████╔╝██║  ██║██║  ██║"
    second_typer "╚═════╝ ╚═╝  ╚═══╝  ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝"
    puts
    print "      "; enter_q
  end

  def game_over(score)
    second_typer" ██████╗  █████╗ ███╗   ███╗███████╗ ██████╗ ██╗   ██╗███████╗██████╗ "
    second_typer"██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔═══██╗██║   ██║██╔════╝██╔══██╗"
    second_typer"██║  ███╗███████║██╔████╔██║█████╗  ██║   ██║██║   ██║█████╗  ██████╔╝"
    second_typer"██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗"
    second_typer"╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗╚██████╔╝ ╚████╔╝ ███████╗██║  ██║"
    second_typer" ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝"
    puts
    sleep(1)
    if score > 0
      print"            " ; third_typer "Well done! Your final score was #{score}."
      sleep (1)
      print"                  " ; type_and_delete "Can you beat it next time?"
      print"        " ; return yes_no "Play again?"
    else
      print"                          " ; third_typer "Too fast for you!"
      sleep (1)
      print"                " ; type_and_delete "Or maybe you're just getting warmed up..."
      print"             " ; return yes_no "Play again?"
    end
  end

  def rules_title
    system "clear"
    second_typer "██████╗ ██╗   ██╗██╗     ███████╗███████╗"
    second_typer "██╔══██╗██║   ██║██║     ██╔════╝██╔════╝"
    second_typer "██████╔╝██║   ██║██║     █████╗  ███████╗"
    second_typer "██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║"
    second_typer "██║  ██║╚██████╔╝███████╗███████╗███████║"
    second_typer "╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝"
end

def rules
  rules_title
  puts
  second_typer "Welcome to DiveBar! The worst job you never (or may have) had!"
  sleep(2)
  puts
  second_typer "The premise is simple. You're a bartender at a busy bar one weekend evening."
  second_typer "It's your job to keep the night running smoothly by performing tasks as quickly as possible when something comes up!"
  sleep(4)
  puts
  second_typer "During the night, you'll be privy to all sorts of strange, wonderous banter from your patrons."
  second_typer "This will probably be distracting, but pay attention! You never know when something will need you attention!"
  sleep(5)

  rules_title
  puts
  second_typer "Lets see how the game works"
  sleep(2)
  second_typer "During your shift you'll hear(see) all sorts of strangeness, like this..."
  sleep(3)

  system 'clear'
  difficulty = difficulty_selector(:d1)
  main_typer("Camouflage paint is belief in the interrelatedness of all things.",difficulty)
  flash("Camouflage paint is belief in the interrelatedness of all things.",difficulty,TTY::Screen.height, TTY::Screen.width)
  sleep(1)

  rules_title
  puts
  second_typer "Depending on how busy it is (difficulty setting), you might see a lot of these, or only a few."
  sleep(4)
  second_typer "But pay attention, because eventually something will [NEED] something!"
  sleep(4)
  second_typer "when you see a word in [SQUARE] [BRACKETS], you'll need to type it out and press enter as fast as you can."
  sleep(4)
  second_typer "If you're too slow or you type it wrong, you'll lose a large amount of points!"
  sleep(4)
  second_typer "If you're fast enough, you'll only lose a small amount of points based on your reaction time."
  sleep(4)
  second_typer "Lets see how it works..."
  sleep(2)

  system 'clear'
  main_typer("OH My GOD! SOMEONES PUKING! GET A [MOP]!!!",difficulty)
  flash("OH My GOD! SOMEONES PUKING! GET A [MOP]!!!",difficulty,TTY::Screen.height, TTY::Screen.width)
  system 'clear'
  puts "OH My GOD! SOMEONES PUKING! GET A [MOP]!!!".colorize(:yellow)
  sleep(1)
  main_typer("[MOP]",difficulty)
  sleep(1)
  
  rules_title
  puts
  second_typer "Simple!"
  sleep(1)
  second_typer "Enjoy your first shift ;)"
  sleep(1)
  second_typer "Press Enter to Continue"
  gets
end

def countdown
  second_typer"██████╗ "
  second_typer"╚════██╗"
  second_typer" █████╔╝"
  second_typer" ╚═══██╗"
  second_typer"██████╔╝"
  second_typer"╚═════╝ "
  sleep 1
  system "clear"
  second_typer"██████╗ "
  second_typer"╚════██╗"
  second_typer" █████╔╝"
  second_typer"██╔═══╝ "
  second_typer"███████╗"
  second_typer"╚══════╝"
  sleep 1
  system "clear"
  second_typer" ██╗"
  second_typer"███║"
  second_typer"╚██║"
  second_typer" ██║"
  second_typer" ██║"
  second_typer" ╚═╝"
  sleep 1
  system "clear"
end

end