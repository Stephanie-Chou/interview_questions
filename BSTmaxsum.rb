require './BST'

p "find the maxSum"
tree = Tree.new
tree.insert(5)
tree.insert(3)
tree.insert(2)
tree.insert(4)
tree.insert(1)
tree.insert(6)
tree.insert(7)
tree.insert(10)
def maxSum(node)
  if !node
    return 0
  end
  leftSum = maxSum(node.left)+node.value
  rightSum = maxSum(node.right) + node.value

  return leftSum > rightSum ? leftSum : rightSum
end

p maxSum(tree.root)


def largest(node)

  until node.right == nil
    node = node.right
  end

  return node
end

p largest(tree.root).value

p "Second Largest Element"
# in order traversal, store
def secondLargest(node)
  until node.right.right == nil
    node = node.right
  end

  return node
end
p secondLargest(tree.root).value


p "Balanced?"

def balanced?(node)

  right = maxDepth(node.right)
  left = maxDepth(node.left)
  # difference between left and right branch depth is less than 1
  return (right-left).abs < 2
end


p balanced?(tree.root)
tree2 = Tree.new
tree2.insert(5)
tree2.insert(3)
tree2.insert(2)
tree2.insert(4)
tree2.insert(1)
p balanced?(tree2.root)