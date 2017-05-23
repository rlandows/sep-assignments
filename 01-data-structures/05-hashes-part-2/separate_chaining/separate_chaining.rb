require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
    @size = size
    @item_size = 0
  end

  def []=(key, value)
    @item_size += 1
    idx = index(key,size)
    item = Node.new(key,value)

    if @items[idx] == nil
      @items[idx] = LinkedList.new
      @items[idx].add_to_tail(item)
    else
      @items[idx].add_to_tail(item)

    end


    if load_factor > @max_load_factor
      resize
    end
    return @items[idx].head.value



  end

  def [](key)
    @items.each do |item|
      if item != nil
        current_node = item.head
        if current_node.key == key
          return current_node.value
        else
          until current_node.next == nil
            current_node = current_node.next
            if current_node.key == key
              return current_node.value
            end
          end
        end

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
    (@item_size.to_f / size)
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def item_sizer
    @item_size
  end


  def resize
    @size = @size * 2
    new_arr = Array.new(@size)

    @items.each do |item|
      if item != nil
        idx = index(item.head.key, @size)

          new_arr[idx] = item

      end
    end

    @items = new_arr

  end

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


puts star_wars_movies = SeparateChaining.new(6)
puts star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
puts star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
puts star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
puts star_wars_movies["Star Wars: A New Hope"] = "Number Four"
puts star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
puts star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
puts star_wars_movies.item_sizer
puts star_wars_movies["Star Wars: The Phantom Menace"]
puts star_wars_movies["Star Wars: Attack of the Clones"]
puts star_wars_movies["Star Wars: Revenge of the Sith"]
puts star_wars_movies["Star Wars: A New Hope"]
puts star_wars_movies["Star Wars: The Empire Strikes Back"]
puts star_wars_movies["Star Wars: Return of the Jedi"]
