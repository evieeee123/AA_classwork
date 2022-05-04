require './card.rb'

class Board
    
    attr_reader :size, :grid, :num

    def initialize(n)
        @grid = Array.new(n) {Array.new(n)}
        @size = n * n
        @num = n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def populate
        num_pairs = @size / 2
        take_cards = Card.get_card[0...num_pairs]
        total_card = take_cards * 2
        shuffled_card = total_card.shuffle
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                pos = [i, j]
                self[pos] = shuffled_card.pop
            end
        end
    end

    def render
        puts " #{(0...@num).to_a.join(" ")}"
        @grid.each_with_index do |row, idx|
            puts "#{idx} #{row.join(" ")}"
        end
    end

    def reveal?(pos)
        self[pos].reveal
    end

    def won?
        @grid.all? do |row|
            if row.all? {|ele| reveal?(ele)}
                return true
            end
        end
        false
    end

    def reveal(pos)
        if reveal?(pos)
          puts "revealed!"
        else
          self[pos].reveal
        end
        self[pos].value
    end

end