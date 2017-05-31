require 'benchmark'
require_relative 'node'


class BinaryHeap

def initialize(root)
  @root = root
  @stack = [@root]
  @filled = []
  @the_rest = []
end

def insert(root,data)
  puts data
  @stack.each do |item|
    if item.left == nil
      item.left = data
      data.parent = item
      @stack = [@root]
       break
    elsif item.right == nil
      item.right = data
      data.parent = item
      @stack = [@root]
      break
    end

    if item.left != nil && item.right != nil
      @stack << item.left
      @stack << item.right
    end
  end

  if data.parent.rating != nil
    until data.parent == nil || data.parent.rating < data.rating
      # puts data.parent.rating
    if data.parent.rating > data.rating
      temp_parent = data.parent.parent
      temp_holder = data.parent
      if data.parent.left == data
        if data.parent.right != nil
          data.parent.right.parent = data
        end
        temp_left = data.left
        temp_right = data.right
        data.left = data.parent
        data.right = data.parent.right

        data.parent.left = temp_left
        data.parent.right = temp_right
        data.parent.parent = data
        data.parent = temp_parent
        if temp_parent != nil
          if temp_parent.left == temp_holder
            temp_parent.left = data
          elsif temp_parent.right == temp_holder
            temp_parent.right = data
          end
        end


      elsif data.parent.right == data
        if data.parent.left != nil
          data.parent.left.parent = data
        end
        temp_left = data.left
        temp_right = data.right
        data.right = data.parent
        data.left = data.parent.left

        data.parent.left = temp_left
        data.parent.right = temp_right
        data.parent.parent = data
        data.parent = temp_parent

        if temp_parent != nil
          if temp_parent.left == temp_holder
            temp_parent.left = data
          elsif temp_parent.right == temp_holder
            temp_parent.right = data
          end
        end

      end
    end

    end




  end

  if data.parent == nil
    @root = data

    @stack = [@root]
  end

  @stack.each do |item|
    if item.left != nil
      @stack << item.left
      item.left.parent = item
    end

    if item.right != nil
      @stack << item.right
      item.right.parent = item
    end
  end
  @stack = [@root]
end

def find(root,data)
  @stack = [@root]
  @stack.each do |item|
    if item != nil
      if item.rating < data.rating
        @stack << item.left
        @stack << item.right
      elsif item.rating == data.rating
        return data.title

      end
    end
  end

  puts "Sorry, we could not find #{data.title}"
end

def delete(root,data)
  counter = 0
  @stack = [@root]
  @stack.each do |item|
    if item != nil
      if item.rating < data.rating
        @stack << item.left
        @stack << item.right
      end

      if item.rating == data.rating && item.title == data.title
        counter += 1
        if item.left != nil && item.right == nil
          item.left.parent = item.parent
          if item.parent.left == item
            item.parent.left = item.left
          elsif item.parent.right == item
            item.parent.right = item.left
          end
        elsif item.right != nil && item.left == nil
          item.right.parent = item.parent
          if item.parent.left == item
            item.parent.left = item.right
          elsif item.parent.right == item
            item.parent.right = item.right
          end

        elsif item.left != nil && item.right != nil
          @the_rest << item.left
          @the_rest << item.right
          if item.parent.left == item
            item.parent.left = nil
          elsif item.parent.right == item
            item.parent.right = nil
          end

          @the_rest.each do |item|
            if item.left != nil
              @the_rest << item.left
            end

            if item.right != nil
              @the_rest << item.right
            end

            insert(root,item)
          end


        end
      end
    end
  end

  if counter == 0
    @stack = [@root]
    @the_rest = []
    return "Sorry, we could not find #{data.title}"
  end

  @stack = [@root]
  @the_rest = []
end

def print(root)
  @stack = [@root]

  @stack.each do |item|
    if item.left != nil
      @stack << item.left
    end

    if item.right != nil
      @stack << item.right
    end
  end

  @stack.each do |item|
    puts "#{item.title}"
  end

end

end
arr = (2..1000).to_a
puts root = Node.new(1, 1)
puts tree = BinaryHeap.new(root)

arr.each do |num|
  new_node = Node.new(num,num)
  tree.insert(root,new_node)
end


a = Benchmark.measure do |x|
  # arr.each do |num|
  #   new_node = Node.new("#{num}",num)
  #   tree.insert(root,new_node)
  # end
  tree.delete(root,Node.new(500,500))
end

puts a
