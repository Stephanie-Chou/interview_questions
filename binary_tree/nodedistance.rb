require './binarytree'
require "./least_common_ancestor"

#       -8
#    4      5
#  3   -2  7  -1
#               10

root = Node.new(-8)
node2 = Node.new(4)
node3 = Node.new(3)
node4 = Node.new(-2)
node5 = Node.new(5)
node6 = Node.new(7)
node7 = Node.new(-1)
node8 = Node.new(10)


root.right = node5
root.left = node2
node2.right = node4
node2.left = node3
node5.left = node6
node5.right = node7
node7.right = node8


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

p node_dist(root, node2, node5)
p node_dist(root, node3, node8)