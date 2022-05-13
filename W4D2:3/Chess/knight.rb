require_relative "Stepable.rb"
# require_relative "piece.rb"

class Knight < Piece
include Stepable
    def symbol
        :KN
    end

    def move_dirs
        knight_moves(self.pos)
    end
end