require 'benchmark'
require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @searched = []
    @queue = []
    @stack = []
    @counter = 1
    @data = nil
    @printing = root
  end

  def insert(root, node)
    @counter += 1
    compare = root
    if node.rating < compare.rating
      if compare.left == nil
        compare.left = node
        node.parent = compare
      else
        compare = compare.left
        insert(compare, node)
      end
    elsif node.rating > compare.rating
      if compare.right == nil
        compare.right = node
        node.parent = compare
      else
        compare = compare.right
        insert(compare, node)
      end
    end



  end

  # Recursive Depth First Search
  def find(root, data)
    @data = nil
    # puts root.title

    if data == nil
      return nil
    end

    if @searched.uniq.length == @counter
      @searched = []
      return nil
    end

    compare = root

    # puts compare.title
    if @searched.length == 0 && compare.left != nil
      compare = compare.left
      find(compare,data)

    end

    if compare.left != nil && @searched.include?(compare.left) == false
      compare = compare.left
      find(compare,data)
    end



    if compare.left == nil || @searched.include?(compare.left)

      if compare.title == data

         @data = compare
         return @data

      end

      if  @data != nil
        @searched = []
        return @data
      end
      @searched << compare

      if compare.right != nil && @searched.include?(compare.right) == false
        compare = compare.right
        find(compare,data)
      elsif compare.right == nil || @searched.include?(compare.right)
        if compare.parent != nil
          compare = compare.parent
          find(compare, data)
        else
          @searched = []
          return nil
        end
      end


    end

    # found_node = nil
    #
    # if root.nil?
    #   if root.rating == data.rating
    #     found_node = data
    #   elsif root.rating > data.rating
    #     found_node = self.find(root.left, data)
    #   else
    #     found_node = self.find(root.right, data)
    #   end
    # end
    #
    # found_node

    # found_node = nil
    #
    # if root.nil?
    #   if root.rating == data.rating
    #     found_node = data
    #   else
    #     found_node = self.find(root.left, data)
    # 
    #     if found_node.nil?
    #       found_node = self.find(root.right, data)
    #     end
    #   end
    # end
    #
    # found_node
  end

  def delete(root, data)
    @data = nil
    @searched = []
    if data == nil
      return nil
    end


   delete_node = find(root,data)
   parent = delete_node.parent
   left_or_right = nil

   if delete_node.left == nil && delete_node.right == nil
     if parent.left == delete_node
       parent.left = nil
     elsif parent.right == delete_node
       parent.right = nil
     end
   end


  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if @root == nil
      return nil
    end
    value = @root
    if @stack.empty?
      @stack << value
    end

    if @stack.include?(value.left) == false && @stack.include?(value.right) == false
      @queue << value.left
      @queue << value.right
    end

    @queue.each do |item|
      @stack << item
      if item.left != nil
        @queue << item.left
      end

      if item.right != nil
        @queue << item.right
      end
    end

    @stack.each do |item|
      puts "#{item.title}" + ":" + " #{item.rating}"
    end
  end

end

arr = (1..1000).to_a


puts root = Node.new(1, 1)
puts tree = BinarySearchTree.new(root)

arr.each do |num|
  new_node = Node.new(num,num)
  tree.insert(root,new_node)
end


a = Benchmark.measure do |x|
  tree.delete(root,500)
end

puts a
