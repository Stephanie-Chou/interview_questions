require 'benchmark'


# Classic Recursive
def fibonacciRecursive(n)
	return n if n<2
	return fibonacciRecursive(n-1)+fibonacciRecursive(n-2)
end

p Benchmark.measure {fibonacciRecursive(30)}

# Memoized
def fibonacciMemoized(n, calculated)
	return n if n<2
	return calculated[n] if calculated.has_key?(n)
	calculated [n] = fibonacciMemoized(n-1, calculated)+fibonacciMemoized(n-2, calculated)
end



p Benchmark.measure {p fibonacciMemoized(30,{})}

# n : 1,2,3,4,5
# =>  1,1,2,3,5

def fibonacciIterative(n)
	i = 1
	fib = 1
	prev_one = 1
	prev_two = 0
	while i<n
		fib = prev_one + prev_two
		prev_two = prev_one
		prev_one = fib
		i+=1
	end
	return fib
end

p Benchmark.measure{p fibonacciIterative(30)}