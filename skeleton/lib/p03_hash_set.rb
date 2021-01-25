class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if self.include?(key)
    resize! if @count == num_buckets
    @count+=1
    self[key] << key  
  end

  def include?(key)
    self[key].include?(key)

  end

  def remove(key)
     return unless self.include?(key)
    self[key].delete(key) 
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new = @store.dup
    @store = Array.new(num_buckets*2) {Array.new}
    @count = 0
    new.flatten.each {|num| insert(num) }
  end
end
