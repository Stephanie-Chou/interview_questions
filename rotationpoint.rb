
=begin
[3,4,5,6,7,1,2]
semi sorted binary search	

3 4 5

7 1 2
	
=end
def rotationPoint(arr)
	lower = 0
	upper = arr.length - 1
	

	while lower<upper
		mid = lower + (upper-lower)/2
		p "#{arr[lower..upper]}"
		if arr[mid]<arr[lower]
			# we are looking for something in the lower half
			upper = mid
		else
			# we are looking for something in the upper half
			lower = mid
		end
		return arr[upper] if lower+1 == upper
	end
end


p rotationPoint([3,4,5,6,7,1,2])

p rotationPoint([9,6,7])


p rotationPoint([9,6])


p rotationPoint([6,9])