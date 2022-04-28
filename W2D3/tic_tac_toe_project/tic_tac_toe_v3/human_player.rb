class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        position = nil
        until legal_positions.include?(position)
            puts "Player #{mark_value.to_s}, enter two numbers representing a position in the format `row col`"
            position = gets.chomp.split(" ").map(&:to_i)
            puts "#{position} is not a legal position" if !legal_positions.include?(position)
            raise "invalid input" if position.length != 2
        end
        position
    end

end