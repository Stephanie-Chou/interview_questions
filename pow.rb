def powIterative(a, b)
  return 1 if b == 0
  total = a
  (b-1).times do |i|
    total *= a
  end
  total
end

p powIterative(3,3)

def powRecursive(a,b)
  return 1 if b == 0
  return a if b == 1
  a* powRecursive(a, b-1)
end

p powRecursive(3,4)
p powRecursive(10,0)