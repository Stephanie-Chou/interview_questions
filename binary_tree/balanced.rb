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