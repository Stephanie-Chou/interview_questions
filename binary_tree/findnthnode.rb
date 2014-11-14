require './binarytree'


def findNthNode(node, n)
  # go all the way to the left
  s = []
  count = 0
  while node
    s << node
    node = node.left
  end

  while s
    node = s.pop
    count +=1
    return node.value if count == n
    if node.right
      node = node.right
      while node
        s << node
        node = node.left
      end
    end
  end
end

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

p "find the nth node"
p findNthNode(root, 1)
p findNthNode(root, 2)
p findNthNode(root, 3)
p findNthNode(root, 4)
p findNthNode(root, 5)
p findNthNode(root, 6)
p findNthNode(root, 7)
p findNthNode(root, 8)