require_relative "room"

class Hotel
  
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        everyword = @name.split(" ")
        res = everyword.map do |word|
            word.capitalize
        end
        res.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        end
        false
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            p "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        @rooms.values.any? do |room|
            room.available_space > 0
        end
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{v.available_space}"
        end
    end

end
