class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize(name,film_actor_hash)
    @name = name
    @film_actor_hash = film_actor_hash
  end
end


# def find_kevin_bacon(node,start)
#   $actors << start.name
#   counter = 0
#   puts start.name
#
#   if puts start.name == "Kevin Bacon"
#       puts "Wow it's Kevin!"
#       return $films
#   end
#   hash = start.film_actor_hash
#
#   if start.name != "Kevin Bacon"
#     hash.each do |movie , actors|
#       if puts actors.include?(node)
#         $films << movie
#         return $films
#       elsif actors.include?(node) == false
#         $films << movie
#         counter += 1
#         if counter == hash.length
#           actors.each do |actor|
#             if $actors.include?(actor.name) == false
#               find_kevin_bacon(node,actor)
#             end
#           end
#         end
#       end
#     end
#   end
#   $films
# end
