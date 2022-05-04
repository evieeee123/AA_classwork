class Card
    CARD = [1, 2, 3, 4, 5, 6, 7, 8, 9, "A", "J", "Q", "K"]

    def self.get_card
        CARD
    end
    
    attr_reader :value
    def initialize(value, face = false)
        @value = value
        @face = face
    end

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def to_s
        if @face == true
            value.to_s
        else
            " "
        end
    end

    def ==(card)
        card.value == self.value
    end

end