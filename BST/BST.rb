# require 'pry'
# find the least common ancestor in a binary search tree
# a least common ancestor is one where one value is in its right child and the other is in its left child. This solution assumes all values in the tree are unique and that the values exist.
def assert
	raise "ERROR MESSAGE" unless yield
end

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

# tree = Tree.new
# tree.insert(10)
# tree.insert(8)
# tree.insert(9)
# tree.insert(5)
# tree.insert(6)
# tree.insert(13)
# tree.insert(11)
# tree.insert(14)

# =begin
# 			  10
# 		8			  13
# 	5	  9		11	14
# 	 6
# =end













