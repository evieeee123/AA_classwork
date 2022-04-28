class Board
  
    def initialize(number)
        @grid = Array.new(number) {Array.new(number, :N)}
        @size = number * number
    end

    def size
        @size
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def num_ships
        count = 0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                count += 1 if @grid[i][j] == :S
            end
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        ships = @size * 0.25
        while self.num_ships < ships
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            self[[rand_row, rand_col]] = :S
        end
    end

    def hidden_ships_grid
        (0...@grid.length).map do |i|
            (0...@grid.length).map do |j|
                if @grid[i][j] == :S
                    :N
                else
                    @grid[i][j]
                end
            end
        end
    end

    def self.print_grid(arr)
        arr.map do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
