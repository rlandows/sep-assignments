class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent

  def initialize(title, rating)
    @title = title
    @rating = rating
    @left = nil
    @right = nil
    @parent = nil
  end
end


# 
# def insert(root,data)
#
#   if root.left == nil
#     root.left = data
#     data.parent = root
#     return data
#
#   elsif root.left != nil && root.right == nil
#     root.right = data
#     data.parent = root
#     return data
#     # @filled = []
#   elsif root.left != nil && root.right != nil
#     @filled << root
#     parent = root.parent
#     if parent != nil
#       if @filled.include?(parent.right) == false
#         insert(parent.right , data)
#       end
#
#     end
#
#     insert(root.left , data)
#
#   end
#
#
#
#
# end
