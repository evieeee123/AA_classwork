require './item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        @items << Item.new(title, deadline, description)
        if !Item.valid_date?(deadline)
            return false
        end
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if self.size <= index
        true
    end

    def swap(index_1, index_2)
        if !self.valid_index?(index_1) || !self.valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        end
        true
    end

    def [](index)
        if !valid_index?(index)
            return nil
        end
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts '-' * 45
        puts ' ' * 15 + @label.upcase
        puts '-' * 45
        puts 'Index | Item                 | Deadline'
        puts '-' * 45
        @items.each_with_index do |item, idx|
            puts "#{idx}     | #{item.title}          | #{item.deadline}"
        end
        puts "-" * 45
    end

    def print_full_item(index)
        item = self[index]
        return if item.nil?
        puts "-" * 45
        puts "#{item.title}          #{item.deadline}"
        puts item.description
        puts "-" * LINE_WIDTH
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != size - 1
            swap(index, index + 1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

end