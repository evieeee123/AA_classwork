# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        if self.length > 0
            return self.max - self.min
        end
        nil
    end

    def average
        if self.length > 0
            return self.sum / (self.length * 1.00)
        end
        nil
    end

    def median
        sorted = self.sort
        if self.length % 2 != 0
            return sorted[self.length / 2]
        elsif self.length < 1
            return nil
        else
            mid_idx = self.length / 2
            first = sorted[mid_idx - 1]
            second = sorted[mid_idx]
            return (first + second) / 2.0
        end
        
    end

    def counts
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash
    end

    def my_count(char)
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash[char]
    end

    def my_index(char)
        (0...self.length).each do |i|
            if char == self[i]
                return i
            end
        end
        nil
    end

    def my_uniq
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash.keys
    end

    def my_transpose
        res = []
        height = self.length
        weith = self[0].length
        (0...height).each do |i|
            sub = []
            (0...weith).each do |j|
                sub << self[j][i]
            end
            res << sub
        end
        res
    end

end
