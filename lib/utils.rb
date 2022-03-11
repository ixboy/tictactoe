require 'colorize'

module Utilities
  def self.clear_terminal
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end

  def self.user_moves(user, spot)
    puts "\n             #{user} played position number #{spot}".light_magenta
  end

  def self.winning_msg(user)
    5.times { puts "\n" }
    if user == 'COMPUTER'
      puts "\n               I AM SORRY THE #{user} WON! TRY AGAIN!!! \n\n".red
    else
      puts "\n               CONGRATULATIONS #{user} YOU WON THE GAME!!! \n\n".light_green
    end
  end

  def self.difficulty_level
    puts "\n\n             Enter 1 for the Computer to play a bit hard against you\n\n             Enter any key for Computer to play easy against you".light_yellow
    level = gets.chomp
    if level == '1'
      puts "\n\n             Computer player, hard mode activated!.  You can still win if you play nicer".light_red
    else
      puts "\n\n             Computer player, easy mode activated!".green
    end
    level == '1'
  end

  def self.its_a_tie_msg
    puts "\n               IT'S A DRAW!!! TRY AGAIN!".yellow
  end

  def self.thanks
    3.times { puts "\n" }
    puts '      **************You terminated the Game!!!!************'.light_green
    puts '      ***Thank You for playing it, I hope you enjoyed it***'.light_green
    puts '      *****You can always come back for more games :D******'.light_green
    2.times { puts "\n" }
    puts '      ***********Created by: Ismael Antonio**************'.light_yellow
  end

  def self.play_again?
    puts "\n               DO YOU WANT TO PLAY AGAIN!?".yellow
    puts "\n\n             Enter >>>'y'<<<  to play again.\n             Enter any key to end the game".light_blue
    repeat = gets.chomp.upcase
    repeat == 'Y'
  end

  def self.ask_the_name(player)
    puts "\n\n               #{player}, please write your name\n\n"
    player_name = gets.chomp
    if player_name.length >= 2
      puts "\n\n                             Welcome #{player_name.upcase}".light_red
    else
      puts '               Please enter a correct name'
      puts '               Name should be atleast two characters'
      player_name = ask_the_name(player)
    end
    player_name
  end

  def self.players_msg(player, symbol = 'O')
    puts "\n\n            #{player} your symbol is >>>#{symbol}<<<\n             it's your turn to play now...".light_yellow
  end

  def self.choice_msg(player)
    puts "\n          #{player} Please Select available spot between 0 and 8.".light_yellow
  end

  def self.num?(num)
    !num.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil?
  end

  def self.validate_number(num)
    copy = num
    num = num?(num) ? copy.to_i : 10
    num.negative? || num > 8 ? nil : num
  end

  def self.single_mode?
    puts "\n\n             ENTER 1 TO PLAY AGAINST THE COMPUTER\n\n             ENTER ANY KEY TO PLAY AGAINST ANOTHER PLAYER ".light_yellow
    level = gets.chomp
    if level == '1'
      puts "\n\n             SINGLE PLAYER ACTIVATED!... YOU WILL BE PLAYING AGAINST THE COMPUTER".light_red
    else
      puts "\n\n             DUAL PLAYER ACTIVATED!... YOU WILL BE PLAYING AGAINST YOUR FRIEND".green
    end
    level == '1'
  end
end
