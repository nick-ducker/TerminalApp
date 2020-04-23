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

  def game_over
    second_typer" ██████╗  █████╗ ███╗   ███╗███████╗ ██████╗ ██╗   ██╗███████╗██████╗ "
    second_typer"██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔═══██╗██║   ██║██╔════╝██╔══██╗"
    second_typer"██║  ███╗███████║██╔████╔██║█████╗  ██║   ██║██║   ██║█████╗  ██████╔╝"
    second_typer"██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗"
    second_typer"╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗╚██████╔╝ ╚████╔╝ ███████╗██║  ██║"
    second_typer" ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝"

end