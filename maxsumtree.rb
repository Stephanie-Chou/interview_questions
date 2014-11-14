# Given a tree *not nessecarily binary* find the max sum grouping of nodes. Caveats: if you choose a node, you cannot choose its parent or children. You are not restricted to single paths.
# for our purposes, we'll say it's a binary tree but it shouldn't matter.



class Tree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = Node.new(value)
    else
      add(@root, value)
    end
  end

  def add(node, value)
    if value > node.value
      if node.right == nil
        node.right = Node.new(value)
      else
        add(node.right, value)
      end
    else
      if node.left == nil
        node.left = Node.new(value)
      else
        add(node.left, value)
      end
    end
  end
end

class Node
  attr_accessor :left, :right, :value
  def initialize(value)
    @left = nil
    @right = nil
    @value = value
  end
end



# logic: for each node, bring the max of either its (children's children + itself) or the maxSum of its children

def maxSumTree(node)

  return 0 if !node

  children_sum = maxSumTree(node.right)+maxSumTree(node.left)

  curr_sum = node.value

  if node.right
    curr_sum += maxSumTree(node.right.right) + maxSumTree(node.right.left)
  end
  if node.left
    curr_sum += maxSumTree(node.left.right) +maxSumTree(node.left.left)
  end

  [children_sum, curr_sum].max
end

=begin
        8
    2       10
  1   4    9
        5

10+5+2+1 = 18

8+9+5 = 21

bring 4 or 5
  4
   5

bring 10 or 9

    10
  9


  bring 1 and 4 = 5
  or
  bring 1 and 5 = 6
  or
  bring 2 and 5 = 9

    2
  1   4
        5
=end

tree = Tree.new
tree.insert(8)
tree.insert(2)
tree.insert(4)
tree.insert(5)
tree.insert(1)
tree.insert(10)
tree.insert(9)

p maxSumTree(tree.root)


tree = Tree.new
tree.insert(8)
tree.insert(2)
tree.insert(4)

p maxSumTree(tree.root)


=begin

      10
    5    11
  1   8
=end

tree = Tree.new
tree.insert(10)
tree.insert(11)
tree.insert(5)
tree.insert(8)
tree.insert(1)

p maxSumTree(tree.root)
