class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash

    b_arr = self.map.with_index { |e, i| (e * 3**i).to_s(2).to_i }
    b_sum = b_arr.inject { |acc, e| acc ^ e }.to_s
    b_sum.to_i(2)
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a 
    arr = self.chars.map { |c| alpha.index(c) }
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
