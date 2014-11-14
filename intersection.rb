# intersect(["a", "b", "e", "e", "e"], ["c", "a", "a", "e", "e", "d", "foo"]) => ["a", "e", "e"]
=begin
first input
a => [1]
b => [1]
e => [3]


second input
check if element exists in hash
  if not: discard
  if so : count how many times element appears in second input
    

a => [1, 2]
b => [1]
e => [3, 2]

loop through hash
  if the value has length 2
    output the key x times where x is the smaller of the two values
  else
    discard that key
=end
def intersect(arr1, arr2)
	exist = {}

	arr1.each do |num|
		if exist.has_key?(num)
			exist[num].first +=1
		else
			exist[num] = [1]
		end
	end

	arr2.each do |num|
		
end