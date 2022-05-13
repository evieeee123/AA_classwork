require_relative "Stepable.rb"
# require_relative "piece.rb"

class King < Piece
include Stepable
    def symbol
        :KI
    end

    def move_dirs
        king_moves(self.pos)
    end
end