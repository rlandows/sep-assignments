require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    new_node = Node.new(key,value)
    idx = index(key, @size)
    if @items[idx] == nil
      @items[idx] = new_node

    else
      new_idx = next_open_index(idx)
      if new_idx == -1
        resize
        idx = index(key,@size)
        @items[idx] = new_node
      else
        @items[new_idx] = new_node
      end

    end
    return new_node.value
  end

  def [](key)
    @items.each do |item|
      if item != nil && item.key == key
        return item.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    (0..@items.length).each do |num|
      idx = (num + index) % @items.length

      if @items[idx] == nil
        return idx
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    @size = @size * 2
    new_arr = Array.new(@size)

    @items.each do |item|
      if item != nil
        idx = index(item.key, @size)
        new_arr[idx] = item
      end
    end
    @items = new_arr
  end
end
