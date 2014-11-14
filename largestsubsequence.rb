def largestSubsequence(arr)
  max = 0
  sequence = []
  arr.each_with_index do |el, i|
    j = 0
    while j< i
      sum = arr[j..i].inject(:+)
      if max < sum
        max = sum
        sequence = arr[j..i]
      end
      j += 1
    end
  end
  p sequence
  max
end

arr = [10, -1, 8, 2, -9 ]

p largestSubsequence(arr)

# -1
# 2
# -1 2
# 0
# 2 0


def largest_subsequece_refactored(arr)

end

