arr = [1,2,3,4,5,5,6,7,8,9,10].shuffle

def twice(arr)
	arr.sort!
	arr.inject(:+)-sum(arr.last);
end

def sum(n)
	i = 0
	sum = 0
	while i <= n
		sum += i
		i+=1
	end
	sum
end


p twice(arr)