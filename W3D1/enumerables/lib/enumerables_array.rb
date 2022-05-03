class Array

    def my_each(&prc)
       
        i = 0
        while i < self.length

        prc.call(self[i])
         i += 1
        end

        self 

    end
    
           
    def my_select(&prc)
        new_arr = []
        
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    
    def my_reject(&prc)
        new_arr = []
        self.each do |ele|
            new_arr.push(ele) unless prc.call(ele)
        end
        new_arr
    end
    
    def my_any?(&prc)

        self.each do |el|
            return true if prc.call(el)
        end

        false

    end     
    
    def my_all?(&prc)

      self.each do |el|
          return false if !prc.call(el)
      end

      true

    end
    
    
    def  my_flatten
         return [self] if !self.is_a? Array

        array = []#[1,2,3]

        self.each do |el| # [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
        
            if !el.is_a?Array #   +=
                array << el
            else
              el.my_flatten #[4, [5, 6]]
            end
        end

        array

    end
    
    def my_zip(*arrs)
        length = self.length
        complete_arr = [self]

        arrs.each do |arr|
            complete_arr << arr
        end

        new_arr = []
        (0...length).each do |i|
            temp = []
            (0...arrs.length + 1).each do |j|
                temp << complete_arr[j][i]
            end
            new_arr << temp
        end
        new_arr
    end
       
    def my_rotate(n = 1)
        newArr = []
        self.each {|el| newArr << el}
        
        if n > 0
            n.times{
            item = newArr.shift
            newArr.push(item)
        }
        end
          
        if n < 0
            (-n).times{
            item = newArr.pop
            newArr.unshift(item)
        }
           
        end
        newArr
    end
    
    
    def my_join(str = nil)

     return self.join('') if str == nil

        new_str = ""
        self.each do |ele|
            new_str += ele + str
        end
        new_str[0...-1]
    end
    
    
    def my_reverse
       newArr =[]
       i = self.length - 1
       while i >= 0
         newArr << self[i]
         i -= 1
       end
        newArr
    end
    
end
    
    
    p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    p [ 1 ].my_reverse               #=> [1]
    # a = [ "a", "b", "c", "d" ]
    # p a.my_join         # => "abcd"
    # p a.my_join("$")    # => "a$b$c$d"
    
    #  a = [ 4, 5, 6 ]
    #  b = [ 7, 8, 9 ]
    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
    
    #   c = [10, 11, 12]
    #   d = [13, 14, 15]
    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
    
    #p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
    # a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true
    
    # p a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]
    
    # p a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []
    
    
    # a = [ "a", "b", "c", "d" ]
    # p a.my_rotate         #=> ["b", "c", "d", "a"]
    # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
    # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
    


def factors(num)
    (1..num).select {|ele| num % ele == 0}
end
 
def bubble_sort!(&prc)
    prc ||= Proc.new {|a, b| a <=> b}

end