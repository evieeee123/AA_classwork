require_relative 'pieces.rb'
require_relative 'Nullobj.rb'
require_relative 'pawn.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
require_relative 'queen.rb'

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8, NullPiece.instance)}

    end

    def [](pos)
        row, col = pos
        @rows[row][col] 
    end

    def []= (pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    # def set_piece
    #     @rows.each_with_index do |row, idx|
    #         if idx == 0 || idx == 1 || idx == 6 || idx ==7
    #             row.each_with_index do |el, idx2|
    #                 @rows[idx][idx2] = Piece.new
    #             end
    #         end
    #     end
    # end
    
    def fill_pawns
        @rows.each_with_index do |row, idx|
            if idx == 1
                row.each_with_index do |el, idx2|
                    @rows[idx][idx2] = Pawn.new([idx,idx2], self, :B)
                end
            elsif idx == 6
                row.each_with_index do |el, idx2|
                    @rows[idx][idx2] = Pawn.new([idx,idx2], self, :W)
                end
            end
        end
    end

    def fill_black_rows
        @rows[0].each_with_index do |el, idx|
            if idx == 0 || idx == 7
                @rows[0][idx] = Rook.new([0, idx], self, :B)
            elsif idx == 1 || idx == 6
                @rows[0][idx] = Knight.new([0, idx], self, :B)
            elsif idx == 2 || idx == 5
                @rows[0][idx] = Bishop.new([0, idx], self, :B)
            elsif idx == 3
                @rows[0][idx] = Queen.new([0, idx], self, :B)
            else
                @rows[0][idx] = King.new([0, idx], self, :B)
            end
        end
    end

    def fill_white_rows
        @rows[7].each_with_index do |el, idx|
            if idx == 0 || idx == 7
                @rows[7][idx] = Rook.new([7, idx], self, :W)
            elsif idx == 1 || idx == 6
                @rows[7][idx] = Knight.new([7, idx], self, :W)
            elsif idx == 2 || idx == 5
                @rows[7][idx] = Bishop.new([7, idx], self, :W)
            elsif idx == 3
                @rows[7][idx] = Queen.new([7, idx], self, :W)
            else
                @rows[7][idx] = King.new([7, idx], self, :W)
            end
        end
    end
    
    def move_piece(start_pos, end_pos)
        #if self[start_pos] != NullPiece && self[end_pos] == NullPiece && vaild_pos?(start_pos) && vaild_pos?(end_pos) #NullPiece.empty?
        if !self[start_pos].is_a?(NullPiece) && self[end_pos].empty? && vaild_pos?(start_pos) && vaild_pos?(end_pos) #NullPiece.empty?

            self[end_pos] = self[start_pos]
            self[start_pos] = NullPiece.instance
        else
            raise "not valid"            
        end
    end

    def vaild_pos?(position)
        row, col = position
        return true if row < 8 && row >= 0 && col < 8 && col >= 0
        false
    end
end