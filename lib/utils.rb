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
        if user == "COMPUTER"
            puts "\n               I AM SORRY THE #{user} WON! TRY AGAIN!!! \n\n".red
        else
            puts "\n               CONGRATULATIONS #{user} WON!!! \n\n".light_green
        end
    end

    def self.difficulty_level
        puts "\n\n             Enter 1 for the Computer to play a bit hard against you\n\n             Enter any key for Computer to play easy against you".light_yellow
        level = gets.chomp
        # @play_mode = play_mode
        if level == '1'
          puts "\n\n             Computer play hard mode activated!.  You can still win if you play nicer".light_red
        else
          puts "\n\n             Computer play easy mode activated!".green
        end
        level == '1' ? true : false
    end

    def self.its_a_tie_msg
        puts "\n               IT'S A DRAW!!! TRY AGAIN!".yellow
    end

    def self.thanks
        3.times { puts "\n" }
        puts '      **************You terminated the Game!!!!************'.light_green
        puts '      ***Thank You for playing it, I hope you enjoyed it***'.light_green
        puts '      *****You can always come back for more games :D******'.light_green
        3.times { puts "\n" }
        puts '      ***********Created by: Ismael Antonio**************'.light_yellow
    end

    def self.play_again?
        puts "\n               DO YOU WANT TO PLAY AGAIN!?".yellow
        puts "\n\n             Enter >>>'y'<<<  to play again.\n             Enter any key to end the game".light_blue
        repeat = gets.chomp.upcase
        repeat == "Y" ? true : false
    end

    def self.ask_the_name(player)
        puts "\n\n               #{player}, please write your name\n\n"
        puts ""
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

    def self.players_msg(player)
        puts "\n\n         #{player} your symbol is >>>'O'<<< and the Computer is >>>'X'<<<.\n                 it's your turn to play now...".light_yellow
    end
end