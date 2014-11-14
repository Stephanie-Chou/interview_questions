require './BST'
#       10
#    8      13
#  5   9  11  14
#   6

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


p "find the nth node"
p findNthNode(tree.root, 1)
p findNthNode(tree.root, 2)
p findNthNode(tree.root, 3)
p findNthNode(tree.root, 4)
p findNthNode(tree.root, 5)
p findNthNode(tree.root, 6)
p findNthNode(tree.root, 7)
p findNthNode(tree.root, 8)