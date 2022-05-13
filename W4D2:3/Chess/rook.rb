require_relative 'pieces.rb'
require_relative 'Slideble.rb'

class Rook < Piece
include Slideble
    def symbol
        :RK
    end

    def moves
        hor_moves(self.pos)
    end

end