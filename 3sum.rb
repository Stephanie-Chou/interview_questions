def bubble_sort(arr)
	return arr if arr.length <2
	swapped = true
	while swapped == true
		swapped = false
		i = 0
		while i+1< arr.length
			if arr[i]>arr[i+1]
				swapped = true
				temp = arr[i]
				arr[i] = arr[i+1]
				arr[i+1] = temp
			end

			i+=1 
		end
	end
	arr
end

p bubble_sort([-1,5,-3,4,-1,2])


def three_sum(arr)
	return arr if arr.length < 3

	sorted = bubble_sort(arr)
	triplets = {}
	curr = 0;
	

	while curr< arr.length
		first = curr+1;
		last = arr.length-1
		while first < last
			a = sorted[curr]
			b = sorted[first]
			c = sorted[last]
			if !triplets.has_key?([a,b,c]) && (a+b+c == 0)
				triplets[[a,b,c]] = 0
				last -=1
				first +=1
			elsif a+b+c > 0
				last-=1
			else
				first+=1
			end
		end
		curr +=1
	end
	return triplets
end

p three_sum([-1,5,-3,4,-1,2,0,1])