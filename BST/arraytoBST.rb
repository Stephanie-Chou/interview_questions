require './BST'

def arraytoBST(arr)
  return Node.new(arr.first) if arr.length < 2
  mid = arr.length/2 - 1

  root = Node.new(arr[mid])

  root.right = arraytoBST(arr[mid+1..-1])
  root.left = arraytoBST(arr[0...mid])
  return root

end

def inorder(node)
  return if !node
  inorder(node.left)
  print "#{node.value} "
  inorder(node.right)
end
arr = [1,2,3,4,5,6]
tree = Tree.new
p tree.root = arraytoBST(arr)
inorder(tree.root)

