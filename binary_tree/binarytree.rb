class Node
  attr_accessor :right, :left, :value
  def initialize(value = nil)
    @value = value
    @right = nil
    @left = nil
  end
end

def assert
  raise "ERROR MESSAGE" unless yield
end


#       -8
#    4      5
#  3   -2  7  -1
#               10
def buildTree
  root = Node.new(-8)
  node2 = Node.new(4)
  node3 = Node.new(3)
  node4 = Node.new(-2)
  node5 = Node.new(5)
  node6 = Node.new(7)
  node7 = Node.new(-1)
  node8 = Node.new(10)


  root.right = node5
  root.left = node2
  node2.right = node4
  node2.left = node3
  node5.left = node6
  node5.right = node7
  node7.right = node8

  root
end
