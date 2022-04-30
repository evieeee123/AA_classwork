class Item

    attr_reader :title, :deadline, :description

    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        if date_arr[0].to_i > 1000 && (date_arr[1].to_i > 0 && date_arr[1].to_i <= 12) && (date_arr[2].to_i > 0 && date_arr[2].to_i <= 31) && date_arr.length == 3
            return true
        end
        false
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(deadline)
            raise "deadline is not valid"
        end
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise "deadline is not valid"
        end
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end

end