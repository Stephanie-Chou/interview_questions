class Node
  attr_accessor :next, :val
  def initialize(val = nil)
    @val = val
    @next = nil
  end

  def insert(val)
    if !self.val
      return self.val = val
    end

    dummy = self
    while dummy.next
      dummy = dummy.next
    end
    dummy.next = Node.new
    dummy.next.val = val
  end

  def print
    dummy = self

    while dummy.next
      p dummy.val
      dummy = dummy.next
    end
    p dummy.val
  end
end


def swapPairs(head)
  return head if head.next == nil
  dummy = head.next
  a = head
  b = head.next
  prev = nil
  while b
    a.next = b.next
    b.next = a
    prev.next = b if prev
    prev = a
    a = prev.next
    b = a ? a.next : nil
  end
  return dummy
end

head = Node.new(0)

head.insert(1)
head.insert(2)
head.insert(3)
head.insert(4)
head.insert(5)
head.insert(6)
head.insert(7)

# head.print

answer = swapPairs(head)
answer.print

p "*"*100
def kth_from_end(node, k)
  p1 = node
  p2 = nil
  while p1

    p2 = node if k == 0
    k -= 1

    p1 = p1.next
    p2 = p2.next if p2
  end
  p2.val
end


# p kth_from_end(head, 3)


def has_loop?(node)
  p1 = node
  p2 = node

  while p2 && p1
    p1 = p1.next
    p2 = p2.next.next

    return true if p1 == p2
  end
  return false
end


head_loop = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)
head_loop.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node3
p has_loop?(head_loop)