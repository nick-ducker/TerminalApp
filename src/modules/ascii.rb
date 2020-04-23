require_relative 'functions'

module AsciiArt

  include FunctionsModule

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

end