require 'byebug'

module Slideble
    DIA_MOVES = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
    HOR_MOVES = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    def hor_moves(pos)
        p_move = []
        HOR_MOVES.each do |x, y|
            row = pos[0] 
            col = pos[1]
            until row < 0 || row > 7 || col < 0 || col > 7 
                row += x 
                col += y
                next_move = [row, col]
                # debugger
                break if self.board[next_move] == nil

                position_on_board = self.board[[next_move[0], next_move[1]]]
                if position_on_board.empty?
                    p_move << next_move
                elsif position_on_board.color != self.color
                    p_move << next_move
                    break
                else
                    break
                end
            end
        end
        p_move
    end

    def dia_moves(pos)
        p_move = []
        DIA_MOVES.each do |x, y|
            row = pos[0] 
            col = pos[1]
            until row == 0 || row == 7 || col == 0 || col == 7
                row += x 
                col += y
                next_move = [row, col]
                position_on_board = self.board[next_move[0], next_move[1]]
                if position_on_board.empty?
                    p_move << next_move
                elsif position_on_board.color != self.color
                    p_move << next_move
                    break
                else
                    break
                end
            end
        end
        p_move
    end

    def both_moves(pos)
        dia_moves(pos) + hor_moves(pos)
    end

end

