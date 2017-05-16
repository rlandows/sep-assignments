require 'benchmark'
require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)

    addNode = node


    if @head.nil?
      @head = addNode
      @tail = addNode
      return @head
    end

    current_node = @head


    until current_node.next == nil
      current_node = current_node.next
    end

    current_node.next = addNode
    @tail = addNode

  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail

    remover = @tail
    current_node = @head

    if current_node.nil?
      return @tail = nil
    end

    if current_node.next.nil?
      return  @tail = nil
    end

    until current_node.next == remover
      current_node = current_node.next
    end

    current_node.next = nil
    @tail = current_node

  end

  # This method prints out a representation of the list.
  def print
    current_node = @head

    until current_node.next == nil
      puts current_node.data
      current_node = current_node.next
    end

    puts current_node.data
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)

    current_node = @head

    if node == current_node
      return remove_front
    elsif node == @tail
      return remove_tail
    end

    until current_node.next == node
      current_node = current_node.next
    end

    current_node.next = node.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node

  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head.nil?
      return nil
    end

    front = @head
    @head = @head.next
    return front

  end

  def check_time
    counter = 0
    current_node = @head

    until counter == 5000
      current_node = current_node.next
      counter += 1
    end
    current_node
  end

  def delete_node_at(index)
    counter = 0
    current_node = @head
    previous_node = @head

    until counter == index
      previous_node = current_node
      current_node = current_node.next
      counter += 1
    end

    previous_node.next = current_node.next
  end
end

array2 = (1..10000).map { |i| Node.new(i) }
array = (1..10000).map { rand(1..5000) }

def inserter(array)
  link = LinkedList.new
  array.each do |x|
    link.add_to_tail(x)
  end
  link
end

wow = inserter(array2)

a = Benchmark.measure do |x|
# puts array.delete_at(5001)
# inserter(array2)
wow.delete_node_at(5000)
end

puts a
