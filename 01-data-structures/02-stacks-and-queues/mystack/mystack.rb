class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    index = @stack.length
    @stack[index] = item
    self.top = @stack[index]
  end

  def pop
    index = @stack.index(self.top)
    if @stack.length != 1
      self.top = @stack[index - 1]
    else
      self.top = nil
    end
    return popper = @stack.delete_at(index)
  end

  def empty?
    if @stack.length == 0
      true
    else
      false
    end
  end
end
