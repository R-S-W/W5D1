class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    #return 984570398475 + self.length if self.flatten.empty?
    b_arr = self.map.with_index do |e, i|
      e.is_a?(Array) ? e.hash : (e * 3**i).to_s(2).to_i
    end
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
    h_arr =  []
    self.each do |k,v|
      # new_k = ( k.is_a?(String)  ? k.hash  : k )
      new_k = k.to_s.hash  
      v.is_a?(String) ? new_v = v.hash : new_v = v
      h_arr << [new_k,new_v]
    end
    h_arr.map!(&:sum).sort.hash

    
  end
end
