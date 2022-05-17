class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !@store.include?(key)
    temp = key.hash % num_buckets
      @store[temp] += key
    @count += 1
    end 
  end

  def include?(key)
    return false if !@store.include?(key)
    true
  end

  def remove(key)
    if @store.include?(key)
      @store.delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
