module Stepable
    KI_MOVES = [[1,0],[1,1],[0,1],[-1,-1],[0,-1],[-1,0],[1,-1],[-1,1]]
    KN_MOVES = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]]
    def knight_moves(pos)
        p_moves = []
        KN_MOVES.each do |x, y|
            next_move = [x + pos[0], y + pos[1]]
            position_on_board = self.board[next_move[0], next_move[1]]
            if (position_on_board.empty? || position_on_board.color != self.color) 
                p_moves << next_move
            end
        end
        p_moves
    end
    
    def king_moves(pos)
        p_moves = []
        KI_MOVES.each do |x, y|
            next_move = [x + pos[0], y + pos[1]]
            position_on_board = self.board[next_move[0], next_move[1]]
            if position_on_board.empty? || position_on_board.color != self.color
                p_moves << next_move
            end
        end
        p_moves
    end

    def vaild_pos?(pos)
        return true if pos[0] < 8 && pos[1] < 8 && pos[0] >= 0 && pos[1] >= 0
    end

end