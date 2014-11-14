# m x n = size of array


def uniquepaths(m,n)
 count = 0
 return 1 if m == 1 or n == 1

 count += uniquepaths(m-1, n)
 count += uniquepaths(m, n-1)

 return count
end

p uniquepaths(3,4)
p uniquepaths(10,10)