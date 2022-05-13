# require_relative 'pieces.rb'
require_relative 'Slideble.rb'

class Bishop < Piece
include Slideble
    def symbol
        :BS
    end

    def moves
        dia_moves(self.pos)
    end

end