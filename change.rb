# return the number of ways to make a total out of the denominations
def change(total, denominations)
	return 1 if total == 0 

	return 0 if total < 0

	return 0 if denominations.length == 0
	# choose next coin
	current_coin = denominations.first

	# we can use it as many times as it takes to overshoot the total.
	count = 0
	while total >=0			
		count += change(total, denominations[1..-1])
		total -= current_coin
	end
	return count
end


p change(2,[1,2])