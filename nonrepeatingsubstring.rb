# hellojello returns 4
# bbbb returns 1
# return length of longest nonrepeating substring

# O(n)

def norepeat(str)
  seen = {}
  count = 0
  max = 0
  longest = ''
  curr_string = ''
  str.split('').each do |letter|
    if seen.has_key?(letter)
      seen = {letter=> true}
      if count > max
        max = count
        longest = curr_string
      end
      curr_string = letter
      count = 0
    else
      seen[letter] = true
      count +=1
      curr_string += letter
    end
  end
  longest
end

p norepeat("jello")
p norepeat("geeksforgeeks")
p norepeat("bbbbbb")