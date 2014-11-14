require './binarytree'

def max_sum_any_path_helper(root, max)
  return 0 if !root
  left = max_sum_any_path_helper(root.left, max)

  right =  max_sum_any_path_helper(root.right, max)

    # p "current node: #{root.value} left: #{left}, right: #{right}, left-right: #{left+right+root.value} "
  sum = [left, right, left+right+root.value ].max
  if max.value < sum
    max.value = sum
  end
  [right, left].max+root.value
end

class Max_num
  attr_accessor :value
  def initialize
    @value = 0
  end
end
def max_sum_any_path(root)
  max = Max_num.new
  max_sum_any_path_helper(root, max)
  max.value
end

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
p max_sum_any_path(root)