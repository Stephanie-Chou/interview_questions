# given two sorted arrays, merge them into a single array
def merge(a,b)
	sorted = []
	i = 0
	j = 0
	while sorted.length <(a.length+b.length)
		# p sorted
		if i == a.length
			sorted<<b[j]
			j+=1
		elsif (j == b.length)
			sorted<<a[i]
			i+=1
		elsif a[i]<b[j]
			sorted<<a[i]
			i+=1
		else
			sorted<<b[j]
			j+=1
		end
	end
	return sorted
end

# tests

a = [1,3,5,6]
b = [2,4,7,8,9]
answer = merge(a,b)
print "two arrays. all numbers unique
a: #{a}
b: #{b}
#{answer}
"

a = []
b = []
answer = merge(a,b)
print "two empty arrays
a: #{a}
b: #{b}
#{answer}
"

a = [1,1,1,1]
b = [1,1,8,9]
answer = merge(a,b)
print "overlapping numbers
a: #{a}
b: #{b}
#{answer}
"

a = [-1,3,5,6]
b = [-2,4,7,8,9]
answer = merge(a,b)
print "some negative numbers
a: #{a}
b: #{b}
#{answer}
"



