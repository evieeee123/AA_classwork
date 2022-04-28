class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Player #{mark_value.to_s}, enter two numbers representing a position in the format `row col`"
        user_input = gets.chomp.split(" ").map(&:to_i)
        raise "invalid input" if user_input.length != 2
        user_input
    end

end