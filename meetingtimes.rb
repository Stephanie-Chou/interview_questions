# [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

class Array
	def sort_by_time!
		i = 0
		while i < self.length
			i+= 1
			temp = self[i]
			unless temp.nil?
				j = i-1
				while j>=0 && temp.first < self[j].first 
					self[j+1] = self[j]
					j-=1
				end
				self[j+1] = temp
			end
		end
	end
end


def meetings(arr)
	merged = []
	arr.sort_by!{|e| e[0]}
	i = 1
	prev = arr[0]
	while i < arr.length
		curr = arr[i]
		if overlap?(prev, curr)
			prev = merge(prev, curr)
		else
			merged << prev
			prev = curr
		end
		i +=1
	end
	merged << prev
	return merged
end


def overlap?(meeting1, meeting2)
	# over laps if the start time of the meeting2 is less than or equal to the end time of meeting 1

	meeting2[0] <= meeting1[1]
end

def merge(meeting1, meeting2)
	start = meeting1[0] < meeting2[0] ? meeting1[0] : meeting2[0]
	finish =  meeting1[1] > meeting2[1] ? meeting1[1] : meeting2[1]

	[start,finish]
end


arr = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

# p meetings(arr)

# p meetings([[1, 5], [2, 3]])

arr.sort_by_time!

p arr