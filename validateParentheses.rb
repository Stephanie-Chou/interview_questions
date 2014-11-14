def valid?(str)
	stack = []
	parens = {
		'(' => ['open', ')'],
		')' => ['close', '(']
	}
	i= 0
	while i != str.length
		if parens.has_key?(str[i])
			if parens[str[i]][0] == 'close'
				if stack.last == parens[str[i]][1]
					stack.pop()
				else
					return false
				end
			else
				stack<< str[i]
			end
		end

		i+=1
	end

	return stack.empty?
end

p valid?('()')
p valid?(')(')
p valid?('())')
p valid?('(9+1)/2 +(100+1)-1')
p valid?('((9+1)/2 +(100+1))-1')
