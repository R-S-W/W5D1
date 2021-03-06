

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    a_node = get_node(key) 
    a_node ?  a_node.val : nil
  end

  def include?(key)
    get(key) ? true : false
  end

  def append(key, val)
    last_node = @tail.prev
    new_node = Node.new(key, val)
    last_node.next = new_node
    new_node.prev = last_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    a_node = get_node(key) 
    a_node ?  a_node.val = val : nil
  end

  def remove(key)
    a_node = get_node(key)
    before = a_node.prev
    after = a_node.next
    before.next = after
    after.prev = before
  end

  def each(&prc)

    a_node = first
    until  a_node == @tail
      prc.call(a_node)
      a_node = a_node.next
    end

  end

  def get_node(key)
     a_node = @head
    until key == a_node.key
      return nil if a_node == @tail
      a_node = a_node.next
    end
    a_node
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
