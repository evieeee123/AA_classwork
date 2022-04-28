class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    # def valid?(position)
    #     row, col = position
    #     position.all? do |i|
    #         i >= 0 && i < @grid.length
    #     end
    # end

    def valid?(position)
        row, col = position
        position.each do |i|
            if i < 0 || i > @grid.length
                return false
            end
        end
        true
    end

    def empty?(position)
        self[position] == "_"
    end

    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise "invalid mark"
        end
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all?(mark)
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |col|
            col.all?(mark)
        end
    end

    def win_diagonal?(mark)
        left = (0...@grid.length).all? do |i|
            position = [i, i]
            self[position] == mark
        end
        right = (0...@grid.length).all? do|i|
            row = i
            col = @grid.length - 1 - i
            position = [row, col]
            self[position] == mark
        end
        if left || right
            return true
        else
            return false
        end
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |ele|
                if ele == "_"
                    return true
                end
            end
        end
        false
    end

end