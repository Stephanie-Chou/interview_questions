require './binarytree'

p "find the maxSum"

def maxSum(node)
  if !node
    return 0
  end
  leftSum = maxSum(node.left)+node.value
  rightSum = maxSum(node.right) + node.value

  return leftSum > rightSum ? leftSum : rightSum
end

p maxSum(tree.root)