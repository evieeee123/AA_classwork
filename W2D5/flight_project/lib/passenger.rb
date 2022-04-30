class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(number)
        if @flight_numbers.include?(number.upcase)
            return true
        else
            return false
        end
    end

    def add_flight(number)
        if !self.has_flight?(number)
            @flight_numbers << number.upcase
        end
    end
end