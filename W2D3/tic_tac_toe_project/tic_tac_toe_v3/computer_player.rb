class ComputerPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        choice = legal_positions.sample
        puts "Computer #{self.mark_value} chose position #{choice.to_s}"
        choice
    end

end
