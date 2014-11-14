require './BST'

#       10
#    5      13
#  4   8
# 3
# 1



tree = Tree.new
tree.insert(10)
tree.insert(5)
tree.insert(4)
tree.insert(3)
tree.insert(1)
tree.insert(8)
tree.insert(13)

# given a tree and a sum, find all paths with that specified sum.

def findPathSum(node, sum, stack)
  # preorder traversal
  # if leaf, check the sum.
  if !node
    p stack if sum == 0
  else
    sum -= node.value
    stack << node.value
    p node.value
    findPathSum(node.left, sum, stack)
    findPathSum(node.right, sum, stack)
    stack.pop
  end
end

findPathSum(tree.root, 23, [])