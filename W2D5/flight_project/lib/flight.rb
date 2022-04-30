class Flight

    attr_reader :passengers

    def initialize(number, capacity)
        @flight_number = number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        end
        false
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|ps| ps.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end