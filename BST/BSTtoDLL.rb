require './BST'

=begin
        10
    8       13
  5   9   11  14
   6
=end

def BSTtoDLL(node)
  if !node
    return node
  end

  l_head = BSTtoDLL(node.left)
  r_head = BSTtoDLL(node.right)

  if l_head
    rightmost = l_head
    while rightmost.right != nil
      rightmost = rightmost.right
    end
    node.left = rightmost
    rightmost.right = node
  else
    l_head = node
  end

  if r_head
    node.right = r_head
    r_head.left = node
  else
    node.right = nil
  end

  return l_head

end


class ListNode
  attr_accessor :next, :prev, :value
  def initialize(value)
    @right = nil
    @left = nil
    @value = value
  end
end

class DoubleList
  attr_accessor :head, :tail
  def initialize
    @tail = nil
    @head = nil
  end

  def printForward
    return nil if @head == nil
    node = @head
    nodes = []
    nodes << node.value
    p node.value
    while node.right != nil

      node = node.right
      nodes << node.value
      p node.value
    end
    nodes
  end

  def length
    return 0 if @head == nil
    count = 1
    node = @head
    while node.right != nil
      node = node.right
      count+=1
    end
    count
  end
end

def convertBSTtoDLL(tree)
  list = DoubleList.new
  list.head = BSTtoDLL(tree.root)

  # set the tail

  if list.head.nil?
    return list
  end

  node = list.head
  while node.right != nil
    node = node.right
  end
  list.tail = node

  return list
end



p "list to DLL"
tree = Tree.new
tree.insert(10)
tree.insert(8)
tree.insert(9)
tree.insert(5)
tree.insert(6)
tree.insert(13)
tree.insert(11)
tree.insert(14)

list = convertBSTtoDLL(tree)

print "given
         10
      8      13
         5   9    11   14
       6
expect forward traversal to equal 5,6,8,9,10,11,13,14
"
assert{p list.printForward == [5,6,8,9,10,11,13,14]}

tree = Tree.new
tree.insert(10)
tree.insert(9)
tree.insert(8)
tree.insert(7)

list = convertBSTtoDLL(tree)
print "given
      10
    9
  8
7
expect forward traversal to equal 7,8,9,10
"
assert{p list.printForward == [7,8,9,10]}

tree = Tree.new
list = convertBSTtoDLL(tree)
p "given nil expect forward traversal to equal nil"
assert{p list.printForward == nil}


# merge 2 BSTs A and B
# assume that everything is unique and balanced
# convert each to a DLL
# merge the lists
# convert lists back into BST

def mergeBST(a,b)

  a_list = convertBSTtoDLL(a)
  b_list = convertBSTtoDLL(b)
  dll = DoubleList.new
  dll.head = mergeDLL(a_list.head, b_list.head)
  tree = convertDLLtoBST(dll.head, 0, dll.length)
end

def mergeDLL(a,b)
  return a if b == nil
  return b if a == nil

  if a.value < b.value
    a.right = mergeDLL(a.right, b)
    a.right.left = a
    return a
  else
    b.right = mergeDLL(a, b.right)
    b.right.left = b
    return b
  end
end

def printlist(node)
  p node.value
  while node.right != nil
    p node.value
  end
end

def convertDLLtoBST(list, start, finish)
  return nil if (start > finish)
  mid = start + (finish-start)/2
  left = convertDLLtoBST(list, start, mid-1)
  binding.pry
  parent= Node.new(list.value)
  parent.left = left
  list = list.right
  parent.right = convertDLLtoBST(list, mid+1, finish)
  binding.pry
  return parent
end

a = Tree.new
a.insert(10)
# a.insert(8)
# a.insert(9)
# a.insert(7)


b = Tree.new
b.insert(12)
# b.insert(6)
# b.insert(11)
# b.insert(13)


# find path in binary tree that has the greatest sum

# print "
# 6<->7<->8<->9<->10<->11<->12<->13

#       10
#    8      12
#  7   9  11  13
#   6
# "

# tree = mergeBST(a,b)
# p BFS(tree)