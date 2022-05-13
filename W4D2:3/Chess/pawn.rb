require_relative "pieces.rb"

class Pawn < Piece
    # WMOVES = [[1,0]]
    # BMOVES =
    def symbol
        :Pa
    end

    def moves
        row, col = self.pos[0], self.pos[1]
        if self.color == :W
            return [] if row == 0
            if row > 0
                p_moves = [[-1 + row, 0 + col]]
            end
            p_moves << [-2 + row,0 + col] if at_start_row?(self.pos)
            p_moves += self.side_attacks
        else
            return [] if  row == 7
            if row < 7
                p_moves = [[1 + row,0 + col]]
            end
            p_moves << [2 + row,0 + col] if at_start_row?(self.pos)
            p_moves += self.side_attacks
        end
        p_moves
    end

    def at_start_row?(pos)
        if self.color == :W
            return true if pos[0] == 6
        else
            return true if pos[0] == 1
        end
        false
    end

    def side_attacks
        wsa = [[-1, 1], [-1,-1]]
        bsa = [[1,-1], [1,1]]
        arr = []
        row, col = self.pos[0], self.pos[1]
        if self.color == :W
            wsa.each do |x, y|
                if self.board[pos].color == :B
                    arr << [x+row,y+col]
                end
            end
        else
            bsa.each do |x, y|
                if self.board[pos].color == :W
                    arr << [x+row,y+col]
                end
            end
                
        end
        arr
    end
            
end