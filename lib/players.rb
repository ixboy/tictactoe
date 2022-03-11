require_relative './utils.rb'
require_relative './logic.rb'
class Players < Logic
    def initialize
        @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        @available = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        @com = "X" # the computer's symbol
        @hum = "O" # the user's symbol
    end

    private
    
    def get_human_spot(player_name)
      spot = nil
      until spot
        Utilities.choice_msg(player_name)
        choice = gets.chomp
        player_choice = Utilities.validate_number(choice)
        spot = player_choice
        if spot && @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = @hum
          @available[spot] = " "
        else
          spot = nil
        end
      end
      spot
    end

    # computer player hard moves...
    def get_computer_hard
        spot = nil
        until spot
          if @board[4] == "4"
            spot = 4
            @board[spot] = @com
            @available[spot] = " "
          else
            spot = get_best_move(@board, @com)
            if @board[spot] != "X" && @board[spot] != "O"
              @board[spot] = @com
              Utilities.user_moves("Computer", spot)
              @available[spot] = " "
            else
              spot = nil
            end
          end
        end
    end
    
    def get_best_move(board, next_player, depth = 0, best_score = {})
        available_spaces = []
        best_move = nil
        board.each do |s|
          if s != "X" && s != "O"
            available_spaces << s
          end
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
          return best_move
        else
          n = rand(0..available_spaces.count)
          return available_spaces[n].to_i
        end
    end

    # computer player easy moves...
    def get_computer_default
      spot = 4
      until @board[spot] != "X" && @board[spot] != "O"
        spot = rand(0..8)
      end
      @board[spot] = @com
      Utilities.user_moves("Computer", spot)
      @available[spot] = " "
    end
  
    def reset
        @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        @available = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end
end