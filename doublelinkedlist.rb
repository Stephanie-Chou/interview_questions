
# doubly linked list
class DoubleList
	attr_accessor :head, :tail
	def initialize
		@tail = nil
		@head = nil
	end

	def insert(value)
		if @head == nil
			@head = Node.new(value)
			@tail = @head
		else
			node = @head
			while node.right != nil
				node = node.right
			end

			node.right = Node.new(value)
			node.right.left = node
			@tail = node.right
		end
	end

	def printForward
		node = @head
		p node.value
		while node.right != nil

			node = node.right
			p node.value
		end
	end

	def printBackward
		node = @tail
		p node.value
		while node.left != nil

			node = node.left
			p node.value
		end
	end
end


class Node
	attr_accessor :right, :left, :value
	def initialize(value)
		@right = nil
		@left = nil
		@value = value
	end
end

list = DoubleList.new
list.insert(3)
list.insert(1)
list.insert(5)
list.insert(2)
p list
p 'forward'
list.printForward
p 'backward'
list.printBackward


