require './binarytree'

# given root and a sum, return true if there exists a path with that sum.


def pathSum(root, sum)
  return pathExists?(root, sum)
end

def pathExists?(node, sum)

  sum -= node.value
  if node.left == nil && node.right == nil
    return 0 == sum
  else
    return (pathExists?(node.left, sum) if node.left) || (pathExists?(node.right, sum) if node.right)
  end
end


root = buildTree

#       -8
#    4      5
#  3   -2  7  -1
#               10

p pathSum(root, 21)
p pathSum(root, 6)