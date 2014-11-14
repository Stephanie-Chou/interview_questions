def func(x, bdg, str)
  p str
  p x
  eval "#{x} += 1", bdg
end

a = 5
func(:a, binding, "banana")
puts a # => 6

def func(bdg, x)
  eval "#{x} += 1", bdg
end

a = 5
func(binding, :a)
puts a # => 6