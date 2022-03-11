require_relative '../lib/players.rb'

class Game < Players
  def print_board(b)
    a = @available
    puts "\n           Available            TIC-TAC_TOE\n             moves\n\n" \
     "          #{a[0]} | #{a[1]}  | #{a[2]}            #{b[0]}  |  #{b[1]}  | #{b[2]}\n" \
     "       ****************      ******************\n"  \
     "          #{a[3]} | #{a[4]}  | #{a[5]}            #{b[3]}  |  #{b[4]}  | #{b[5]}\n" \
     "       ****************      ******************\n"  \
     "          #{a[6]} | #{a[7]}  | #{a[8]}            #{b[6]}  |  #{b[7]}  | #{b[8]}\n\n"   \
     "       -----------------------------------------------------\n"
  end 

  def start_game
    while true
      Utilities.clear_terminal
      player_name = Utilities.ask_the_name("Player-1")
      difficult = Utilities.difficulty_level
      sleep(2)
      Utilities.clear_terminal
      2.times { puts "\n" }
      print_board(@board)
      # loop through until the game was won or tied
      until game_is_over(@board) || tie(@board)
        flag = false
        Utilities.players_msg(player_name)
        hum_move = get_human_spot
        sleep(1)
        Utilities.clear_terminal
        Utilities.user_moves(player_name, hum_move)
        print_board(@board)
        sleep(1)
        if !game_is_over(@board) && !tie(@board)
          get_computer_default if !difficult
          get_computer_hard if difficult
          print_board(@board)
          sleep(1)
          flag = true
        end
      end
      if game_is_over(@board)
        Utilities.clear_terminal
        print_board(@board)
        flag ? Utilities.winning_msg("COMPUTER") : Utilities.winning_msg("YOU")
      else
        Utilities.clear_terminal
        print_board(@board)
        Utilities.its_a_tie_msg
      end
      if game_is_over(@board) || tie(@board)
        repeat = Utilities.play_again?
        sleep(1)
        Utilities.thanks unless repeat
        break unless repeat
        reset
      end
    end
  end
end

game = Game.new
game.start_game
