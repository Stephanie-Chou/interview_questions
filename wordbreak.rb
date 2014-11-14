# given a string and a dictionary, check to see if that string can be broken up into words found in that dictionary

def wordbreak(str, dict)
	return true if dict.include?(str)
	str.length.times do |i|
		p prefix = str[0..i]
		next unless dict.include?(prefix)
		p remaining = str[i+1..-1]
		return true if wordbreak(remaining, dict)
	end
	false
end

dict = {'i'=>1, 'like'=> 1,'cookies'=>1, 'cook'=>1}

str = 'ilikecookies'


# dict = {'a'=>1, 'aa'=> 1,'aaa'=>1, 'aaaaaa'=>1}
# str ="aaaaaaaaaabaaaa"
p wordbreak(str,dict)