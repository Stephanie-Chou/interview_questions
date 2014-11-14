def sort_range(arr)
  m = 0
  i = 1
  while i < arr.length
    if arr[i] < arr[i-1] && m == 0
      m = i-1
    end
    n = i if arr[m] > arr[i]
    i+=1
  end

  p "#{m} to #{n}"
end

arr = [1,2,4,3,5,6,2,8,9]

sort_range(arr)
