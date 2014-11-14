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

# =begin
#         10
#     8       13
#   5   9   11  14
#    6
# =end

# only look at nodes that are less than the potential sum
def nodes_with_sum?(node, sum)

end

def get_next_smallest(node)

end


def get_next_largest(node)
end