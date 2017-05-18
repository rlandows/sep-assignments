class HashClass
require_relative "hash_item"

  def initialize(size)
    @items = Array.new(size)
    @size = size

  end

  def []=(key, value)
    idx = index(key, @size)

    if @items[idx] == nil
      @items[idx] = HashItem.new(key,value)
      return value
    elsif @items[idx].key == key && @items[idx].value == value
      return value
    else
        until @items[idx] == nil
          resize
        end
        @items[idx] = HashItem.new(key,value)

    end
    return value
  end


  def [](key)
    @items.each do |item|
      if item != nil
        if key == item.key
          return item.value
        end
      end
    end
  end

  def resize
    @size = @size * 2
    new_arr = Array.new(@size)

    @items.each do |item|
      if item != nil
        idx = index(item.key, @size)
        if new_arr[idx] == nil
          new_arr[idx] = item
        else
          new_arr.resize
        end
      end
    end

    @items = new_arr


  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |byte|
      sum += byte
    end
    sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
