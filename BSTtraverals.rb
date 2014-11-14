
require './BST'

tree = Tree.new
tree.insert(10)
tree.insert(8)
tree.insert(9)
tree.insert(5)
tree.insert(6)
tree.insert(13)
tree.insert(11)
tree.insert(14)





def inorder(node)
  return if !node
  inorder(node.left)
  print "#{node.value} "
  inorder(node.right)
end

def preorder(node)
  return if !node
  print "#{node.value} "
  preorder(node.left)
  preorder(node.right)
end

def postorder(node)
  return if !node
  postorder(node.left)
  postorder(node.right)
  print "#{node.value} "
end

p "traversals"

p "inorder"
inorder(tree.root)
p "preorder"
preorder(tree.root)
p "postorder"
postorder(tree.root)


# def BFS(node)
#   q = []
#   q << node
#   while q
#     curr = q.shift

#     print "#{curr.value} "
#     q << curr.left if curr.left
#     q << curr.right if curr.right
#   end
# end


def BFS(root)
  q = []
  q.push(root)

  nodes = []
  while !q.empty?

    node = q.shift
    nodes << node.value
    if node.left!= nil
      q.push(node.left)
    end
    if node.right!= nil
      q.push(node.right)
    end
  end
  nodes
end

p "Expect BFS to print [10,8,13,5,9,11,14,6]"
assert{p BFS(tree.root)==[10,8,13,5,9,11,14,6]}

# print "BFS: "
# BFS(tree.root)
