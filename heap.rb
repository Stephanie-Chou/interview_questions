def max_heapify(arr, i)
  while i < arr.length
    curr = i - 1
    left = 2*i - 1
    right = 2*i
   max = ( left < arr.length && arr[left] > arr[curr] ) ? left : curr

    max = right if (right < arr.length && arr[right] > arr[max])
    if max != curr
      dummy = arr[curr]
      arr[curr] = arr[max]
      arr[max] = dummy
      max_heapify(arr, max)
    end
    i +=1
  end
  return arr
end


# def print (arr)
#   i = 0
#   j = 1
#   while i < arr.length
#     p arr[i]
#     if j == i
#       j = 1
#       p ""
#     end
#     j +=1

#     i+=1
#   end
# end
arr = [20,16,14,6,13,10,1,5,7,2]
max = 1

#         20
#     16      14
#   6  13   10   1
# 5  7 2

p maxheap =  max_heapify(arr, max)

#         20
#     16      14
#   7  13   10   1
# 5  6 2

# max heap the children are less than the node
# Left Child = 2i
# Right Child = 2i+1

# given :
arr = [3,1,8,4,5,2,6,7]

# find the nth smallest node

def findNth(heap, n)
  heapified = heap
  (n-1).times do |i|
    p heapified = max_heapify(heapified, 1)
    heapified.shift
  end

  heapified.shift
end

p findNth(arr, 5)