#!/usr/bin/env ruby
require_relative '../lib/players'
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Style/InfiniteLoop
# rubocop:disable Metrics/BlockNesting
# rubocop:disable Metrics/AbcSize
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
      single_mode = Utilities.single_mode?
      if single_mode
        @player_names[0] = Utilities.ask_the_name('Player number 1')
        difficult = Utilities.difficulty_level
      else
        (1..2).each do |i|
          @player_names << Utilities.ask_the_name("Player number #{i}")
        end
      end
      sleep(2)
      Utilities.clear_terminal
      2.times { puts "\n" }
      print_board(@board)
      # loop through until the game was won or tied
      until game_is_over(@board) || tie(@board)
        flag = false
        Utilities.players_msg(@player_names[0])
        hum_move = false
        hum_move = human_spot(@player_names[0]) until hum_move
        winner = @player_names[0]
        sleep(1)
        Utilities.clear_terminal
        Utilities.user_moves(@player_names[0], hum_move)
        print_board(@board)
        sleep(1)
        next unless !game_is_over(@board) && !tie(@board)

        if single_mode
          computer_default unless difficult
          computer_hard if difficult
          flag = true
        else
          Utilities.players_msg(@player_names[1], 'X')
          hum_move = false
          hum_move = human_spot(@player_names[1], 'X') until hum_move
          winner = @player_names[1]
        end
        print_board(@board)
        sleep(1)
        Utilities.user_moves(@player_names[1], hum_move) unless single_mode
      end
      print_board(@board)
      if game_is_over(@board)
        flag ? Utilities.winning_msg('COMPUTER') : Utilities.winning_msg(winner)
      else
        Utilities.its_a_tie_msg
      end
      next unless game_is_over(@board) || tie(@board)

      repeat = Utilities.play_again?
      sleep(1)
      Utilities.thanks unless repeat
      break unless repeat

      reset
    end
  end
end

game = Game.new
game.start_game

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Style/InfiniteLoop
# rubocop:enable Metrics/BlockNesting
# rubocop:enable Metrics/AbcSize
