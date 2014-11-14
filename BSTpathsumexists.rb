require './BST'

# given root and a sum, return true if there exists a path with that sum. just a binary tree. not necessarily a BST


def pathSum(root, sum)
  return pathExists?(root, sum, 0)
end

def pathExists?(node, sum)
  sum -= node.value
  if node.left == nil && node.right == nil
    return 0 == sum
  else
    return pathExists?(node.left, sum) || pathExists?(node.right, sum)
  end
end
