def twoSum(arr, target)
	pairs = {}
	answers = []
	i = 0
	while i< arr.length
		if pairs.has_key?(target - arr[i])
			 answers<< [arr[i], target-arr[i]]
		else
			pairs[arr[i]] = target- arr[i]
		end
		i +=1
	end

	return answers
end

arr = [1,3,4,7,6]
target = 7
p twoSum(arr, target)


arr = [1,3,4,8,6]
target = 8
p twoSum(arr, target)