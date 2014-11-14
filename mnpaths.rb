# assuming n and m >= 1
def paths(n,m)
  total = n+m-2
  choices = [n-1, m-1].min
  choose(total, choices)
end

# binomial coefficient. Usually seen as n choose k. n choose k means how many subsets can we create from n possible distinct choices?
def choose(total, choices)
  factorial(total)/((factorial(total-choices)*factorial(choices)))
end

# factorial: num!
def factorial(num)
  (1..num).inject(:*) || 1
end

# test cases

def assert
  raise "ERROR MESSAGE" unless yield
end

assert{ p paths(1,1) == 1}
assert{ p paths(2,1) == 1}
assert{ p paths(3,2) == 3}
assert{ p paths(2,3) == 3}
assert{ p paths(10,10) == 48620}

