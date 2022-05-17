class Integer
  # Integer#hash already implemented for you
  self.hash
end

class Array
  def hash
    output = 1
    self.each_with_index do |ele, idx|
    output +=  ele * idx * 2
    end
  return output
  end
end

class String
  def hash
  output = 1
    alphabet = ("a".."z").to_a
    self.each_char.with_index do |letter, idx|
    output = alphabet.index(letter.downcase) * (idx +1 ) 
    end
  return output
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    output = 1
    alphabet = ("a".."z").to_a.reverse.shuffle
    self.each do |k,v|
      if !k.is_a?(Integer) && v.is_a?(String)
        output += alphabet.index(k.to_s.downcase) + 1 * 2 + 3
        output += alphabet.index(v.downcase) + 1 * 2 + 3 
      end

      if k.is_a?(Integer) && v.is_a?(String)
        output += k * 42
        output += alphabet.index(v) * 2
      elsif !k.is_a?(Integer) && v.is_a?(Integer)
        output += alphabet.index(k.to_s) * 2
        output += v * 42
      end

      end
    return output
  end
end
