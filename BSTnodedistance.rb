require './BST'
require "./BSTLCA"

tree = Tree.new
tree.insert(10)
tree.insert(8)
node9 = tree.insert(9)
tree.insert(5)
node6 = tree.insert(6)
tree.insert(13)
tree.insert(11)
node14 = tree.insert(14)

# =begin
#         10
#     8       13
#   5   9   11  14
#    6
# =end
# this example uses a BST. but we should assume that we could get just a normal Binary tree.

def node_dist(root, n1, n2)
  lca = LCA(root, n1.value, n2.value)

  dist(root, n1) + dist(root, n2) - 2* dist(root, lca)
end

def dist(root, n)
  return 0 if root == n

  q = []
  q << [root, 0]

  while q

   curr = q.pop

    return curr.last if curr.first == n

    q << [curr.first.left, curr.last+1] if curr.first.left
    q << [curr.first.right, curr.last+1] if curr.first.right
  end
end



# p dist(tree.root, node6)
# p dist(tree.root, node9)

p node_dist(tree.root, node6, node9)
p node_dist(tree.root, node6, node14)