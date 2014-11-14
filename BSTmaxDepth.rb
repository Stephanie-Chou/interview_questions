def maxDepth(node)

  return -1 if !node

  "node: #{node.value}"
  leftDepth = maxDepth(node.left)
  rightDepth = maxDepth(node.right)

  return rightDepth > leftDepth ? rightDepth+1 : leftDepth+1
end

p "Expect maxDepth to be 3"
assert{ p maxDepth(tree.root)}