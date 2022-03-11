require_relative './utils'
require_relative './logic'
require 'pry-byebug'
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength
class Players < Logic
  def initialize
    @board = %w[0 1 2 3 4 5 6 7 8]
    @available = %w[0 1 2 3 4 5 6 7 8]
    @com = 'X' # the computer's symbol
    @hum = 'O' # the user's symbol
  end

  private

  def human_spot(player_name)
    spot = nil
    until spot
      Utilities.choice_msg(player_name)
      choice = gets.chomp
      player_choice = Utilities.validate_number(choice)
      spot = player_choice
      if spot && @board[spot] != 'X' && @board[spot] != 'O'
        @board[spot] = @hum
        @available[spot] = ' '
      else
        spot = nil
      end
    end
    spot
  end

  # computer player hard moves...
  def computer_hard
    spot = nil
    until spot
      if @board[4] == '4'
        spot = 4
        @board[spot] = @com
        @available[spot] = ' '
      else
        spot = comp_best_move(@board)
        if @board[spot] != 'X' && @board[spot] != 'O'
          @board[spot] = @com
          @available[spot] = ' '
        else
          spot = nil
        end
      end
      Utilities.user_moves('Computer', spot) if spot
    end
  end

  def comp_best_move(board)
    available_spaces = []
    best_move = nil
    board.each do |s|
      available_spaces << s if s != 'X' && s != 'O'
    end
    available_spaces.each do |as|
      board[as.to_i] = @com
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      best_move
    else
      n = rand(0..available_spaces.count)
      available_spaces[n].to_i
    end
  end

  # computer player easy moves...
  def computer_default
    spot = 4
    spot = rand(0..8) until @board[spot] != 'X' && @board[spot] != 'O'
    @board[spot] = @com
    Utilities.user_moves('Computer', spot)
    @available[spot] = ' '
  end

  def reset
    @board = %w[0 1 2 3 4 5 6 7 8]
    @available = %w[0 1 2 3 4 5 6 7 8]
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
