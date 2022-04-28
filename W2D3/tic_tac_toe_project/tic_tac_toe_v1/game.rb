require './board.rb'
require './human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(player_1_mark)
        @player_2_mark = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1_mark
    end

    def switch_turn 
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                puts 'Victory! ' + @current_player.mark_value.to_s + ' won.'
                return
            else
                switch_turn
            end
        end
        puts 'draw'
    end

end