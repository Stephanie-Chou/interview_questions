class Stack
  def initialize
    @stack = []
    @min = []
  end

  def push(val)
    @stack << val
    (@min.empty? || @min.last > val) ? @min << val : @min << @min.last
  end

  def pop
    @stack.pop
    @min.pop
  end

  def min
    @min.last || nil
  end

  def top
    @stack.last
  end
end


s = Stack.new
s.push(1)
p s.min # => 1
s.pop
s.push(2)
s.push(3)
p s.min # => 2
s.push(1)
p s.min # => 1
