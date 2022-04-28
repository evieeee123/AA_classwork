class Player

    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        usermove = gets.chomp
        res = []
        usermove.split(" ").each do |ele|
            res << ele.to_i
        end
        res
    end

end
