require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
    @size = size
  end

  def []=(key, value)
    idx = index(key,size)
    item = Node.new(key,value)
    if puts @items[idx].class == Node
    # if puts @items[idx] != nil
    return "hello"
      temp_node = @items[idx]
      # if puts temp_node.is_a?(Node)
      #   @items[idx] = LinkedList.new
      #   @items[idx].add_to_tail(temp_node)
      #   @items[idx].add_to_tail(item)
      # elsif temp_node.instance_of?(LinkedList)
      #   @items[idx].add_to_tail(item)
      # end

    end

    @items[idx] = item
    if load_factor > @max_load_factor
      resize
    end
    return item.value



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

  # Calculate the current load factor
  def load_factor
    count = 0
    @items.each do |item|
      if item != nil
        count += 1
      end
    end
    (count.to_f / size)
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def arrayz
    @items
  end


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
#   # Resize the hash
#   def resize
#     arr_size = size
#    until is_prime?(arr_size) && arr_size > next_power(size)
#      arr_size += 1
#    end
#
#    new_arr = Array.new(arr_size)
#
#    @items.each do |item|
#     if item != nil
#      idx = index(item.key, size)
#      new_arr[idx] = item
#     end
#    end
#
#    @items = new_arr
#
#
#   end
#
# def is_prime?(num)
#   (2...num).each do |value|
#     if num % value == 0
#       return false
#     end
#   end
#   return true
# end
#
# def next_power(size)
#   exponent = 1
#
#   until 2 ** exponent > size
#     exponent += 1
#   end
#   2 ** exponent
# end
end

# robert = SeparateChaining.new(6)
# puts robert["seenororor"] = 'tree'
# puts robert["wow"] = "fire"
# puts robert["wow"]
# puts robert.size
# puts robert.index("seenororor", robert.size)
# puts robert.index("wow", robert.size)
# puts robert.load_factor
# puts robert.size
# puts robert["jababab yodadfds"] = 'fidgey'
# puts robert["jenga oodod"] = 'asa'
# puts robert.load_factor
# puts robert["w"] = 'ajsl'
# puts robert.load_factor
# puts robert.size
# puts robert
# puts robert.resize
# puts robert.resize
# puts robert.resize
# puts star_wars_movies = SeparateChaining.new(6)
# puts star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
# puts star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
# puts star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
# puts star_wars_movies["Star Wars: A New Hope"] = "Number Four"
# puts star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
# puts star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
puts h = SeparateChaining.new(4)
puts h["key"] = "value"
puts h["keytwo"] = "value"
puts h.load_factor
puts h["keytwo"] = "value"
puts h.load_factor
puts h.size
puts h.arrayz
