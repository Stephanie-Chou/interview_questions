require './BST'

tree = Tree.new
tree.insert(5)
tree.insert(3)
tree.insert(2)
tree.insert(4)
tree.insert(1)
tree.insert(6)
tree.insert(7)
tree.insert(10)
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
