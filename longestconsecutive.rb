# [20, 4, 19, 2, 3, 1, 18]
def longest(arr)
	# arr.select{|i| i== num+1 || i = num-1}

	curr_set = [arr.first]
	max_length = 0 
	arr.sort!

	while !arr.empty?
		num = arr.shift
		if  num == curr_set.last+1
			curr_set << num
		else
			max_length = curr_set.length > max_length ? curr_set.length : max_length
			curr_set = [num]
		end
	end

	return max_length
end

p longest([20, 4, 19, 2, 3, 1, 18])