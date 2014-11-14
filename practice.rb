# longest palindromic substring


#big list of urls, find the top x amount the appears most


# find the nth fibonacci number
def fibonacci(n)
	if n == 1 || n == 0
		1
	else
		fibonacci(n-1)+fibonacci(n-2)
	end
end
p "fibonacci(0): #{fibonacci(0)}"
p "fibonacci(1): #{fibonacci(1)}"
p "fibonacci(2): #{fibonacci(2)}"
p "fibonacci(3): #{fibonacci(3)}"
p "fibonacci(4): #{fibonacci(4)}"
p "fibonacci(5): #{fibonacci(5)}"

def recPermute(soFar, rest)
	if rest == ""
		p soFar
	else
		for i in 0..rest.length-1
			nextGroup = soFar+rest[i]
			# remaining is the rest of the group we have left to look at
			remaining = rest[0...i]+rest[i+1...rest.length]
			recPermute(nextGroup, remaining)
		end
	end
end

def listPermutations(s)
	recPermute("", s)
end

s = "abc"

# listPermutations(s)

arr = [1,2,-3,4,-5,10, -9,11,2]

def maxSubarray(arr)
	max_arr = []
	max_sum = 0;
	for i in 0..arr.length
		for j in i..arr.length
			sub_arr = arr[i..j+i]
			unless sub_arr.empty?
				temp = sub_arr.inject(:+)
				if temp>=max_sum
					max_sum = temp
					max_arr = sub_arr
				end
			end
		end
	end
	return max_arr
end

# p max = maxSubarray(arr)
# p max.inject(:+)


def binarySearch(n, arr)
	mid = arr.length/2-1
	p "arr: #{arr}, mid: #{arr[mid]}"
	if arr.length == 1
		arr[0] == n ? n : -1
	elsif arr[mid]< n
		binarySearch(n, arr[mid+1..-1])
	else
		binarySearch(n, arr[0..mid])
	end
end

# p binarySearch(2, arr.sort)

# determine if a number is a palindrome.
def palindrome?(n)
	n.to_s.reverse == n
end

def palindrome2?(n)
	reversed = 0
	copy = n
	until n ==0
		reversed = reversed*10 + n%10
		n /= 10
	end
	copy == reversed
end

# p "palindrome2(4113): #{palindrome2?(4113)}"
# p "palindrome2(313): #{palindrome2?(313)}"

def lastInCircle(n, arr)
	until arr.length == 1
		(n-1).times do |i|
			arr.push(arr.shift)
		end
		arr.shift
	end
	arr.first
end

# p "last number in Circle [0,1,2,3,4]: #{lastInCircle(3, [0,1,2,3,4])}"


# Asked in Groupon 1st round interview
def toRoman(n)

dict = {
	10=>'X',
	9 => 'IX',
	5 => 'V',
	4 => 'IV',
	1 => 'I'
}
	roman = ""
	dict.keys.each do |key|
		if n >= key
			roman+= dict[key]*(n/key)
			n -= (n/key)*key
		end
	end

	return roman

end

# p "toRoman(30): #{toRoman(30)}"
# p "toRoman(29): #{toRoman(29)}"
# p "toRoman(11): #{toRoman(11)}"
# p "toRoman(9): #{toRoman(9)}"
# p "toRoman(3): #{toRoman(3)}"

# Asked in Groupon 1st round interview

def insertionsort(arr)
	p arr
	i = 0

	while i<arr.length
		i+=1
		temp = arr[i]
		unless temp.nil?
			j = i-1
			while j>=0 && temp<arr[j]
				arr[j+1] = arr[j]
				j-=1
			end
			arr[j+1] = temp
			p arr
		end
	end
end

sort([4,1,2,5,3])
# p "sort [4,1,2,3,5] #{}"
# Other Questions
# why is it important not to push to master?
# You have not taken algorithms. If someone at work gave you a problem that required you to write an algorithm, what would you do?
# How would you rate yourself as a self learner?

