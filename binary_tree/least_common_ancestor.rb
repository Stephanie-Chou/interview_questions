require './binarytree'


def LCA(node, val1, val2)
  left = exists?(node.left, val1, val2)
  right = exists?(node.right, val1, val2)

  if left == true && right == true
    return node
  elsif left == true
    LCA(node.left, val1, val2)
  else
    LCA(node.right, val1, val2)
  end
end

def exists?(node, val1, val2)

  if node == nil
    return
  elsif node.value == val1 || node.value == val2
    return true
  else
    return true if exists?(node.left, val1, val2) == true
    return true if exists?(node.right, val1, val2) == true
  end

  return false

end

# p "Expect LCA of 7 and 10 to be 5"
root = buildTree
 assert{p LCA(root, 7, 10).value == 5}