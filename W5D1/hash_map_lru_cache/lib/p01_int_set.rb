require "byebug"
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    
    if is_valid?(num) == true
      @store[num] = true
      return true
    else
      return false
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    # if !@store.insert(num)
    #   return false
    # end
    # return true
    @store[num] == true
  end

  # private

  def is_valid?(num)
    if num > @max
      raise 'Out of bounds'
    elsif num < 0
      raise 'Out of bounds'
    else
      return true
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] = num
    # @store[num] = [] 
  end

  def remove(num)
    @store[num % num_buckets] = []
  end

  def include?(num)
    @store.include?(num)
    # return true if @store.insert(num)
    # return false if !@store.insert(num)
  end

  private

  def [](num)
    # @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def include?(num)
    @store.include?(num)
  end

  def insert(num)
    if !@store.include?(num)
      @store[num % num_buckets] = num
          @count += 1
          self.resize! if @count >= @store.length
    end
  end

  def remove(num)
    if @store.include?(num)
    @store.delete(num)
    @count -= 1
    end
  end


  # private

  # def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # num % num_buckets
  # end

  def num_buckets
    @store.length
  end

  def resize!
   
      small = self.store
      # num_buckets *= 2
      # num_size = num_buckets * 2
      # @store1 = @store.dup
      self.store = Array.new(small.length * 2) { Array.new }
      self.count = 0
      small.each {|ele| insert(ele)}


    # if @count >= num_buckets
    #   num_buckets *= 2
    #   # num_size = num_buckets * 2
    #   # @store1 = @store.dup
    #   # @store = Array.new(num_size) { Array.new }
    #   @count = 0
    #   @store.each {|ele| @store.insert(ele)}

    # end

  end
end
