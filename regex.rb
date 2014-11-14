#regex with . and *
def is_match?(str, p)
	# p "str: #{str} pattern: #{p} "
	return true if p.empty?

	if (p[1] == '*')
		i = 0
		while (i<str.length && (p[0]=='.' || p[0]== str[0]))
			return true if is_match?(str[i+1..-1], p[2..-1])
			i +=1
		end
		return is_match?(str, p[2..-1])
	end

	return (!str.empty? && (p[0] =='.' || p[0]==str[0])) ? is_match?(str[1..-1], p[1..-1]) : false
		# p "not empty and the first letter matches
end


def match(str, p)
	i = 0
	while i< str.length
		return true if is_match?(str[i..-1], p)
		i+=1
	end
	return false
end

p "match('abbc', '.b*c')"
p match("abbc", ".b*c")

p "match('abbc', 'ab*c')"
p match("abbc", "ab*c")

p "match('abbc', 'ab*d')"
p match("abbc", "ab*d")


p "match('aabc', 'a*.d*')"
p match("aabc", "a*.d*")
