require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game

    def initialize(n, players)
        @players = players.map do |mark, computer| 
            if computer == true
                ComputerPlayer.new(mark)
            else
                HumanPlayer.new(mark)
            end
        end
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn 
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            choice = @board.legal_position
            pos = @current_player.get_position(choice)
            @board.place_mark(pos, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                puts "Victory! #{current_player.mark_value.to_s} won."
                return
            else
                switch_turn
            end
        end
        puts 'draw'
    end

end