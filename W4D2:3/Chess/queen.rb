# require_relative 'pieces.rb'
require_relative 'Slideble.rb'

class Queen < Piece
include Slideble
    def symbol
        :QN
    end

    def moves
        both_moves(self.pos)
    end

end