require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2.0
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        num_ships = @board.num_ships
        if num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        end
        false
    end

    def turn
        player_move = @player.get_move
        if !@board.attack(player_move)
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end

end
