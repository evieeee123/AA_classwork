require './board.rb'
require './human_player.rb'

class Game

    def initialize(n, *player_marks)
        @players = player_marks.map {|mark| HumanPlayer.new(mark)}
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn 
        @current_player = @players.rotate!.first
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