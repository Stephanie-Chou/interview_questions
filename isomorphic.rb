def isomorphic?(a,b)
  return false if a.length != b.length
  encode(a) == encode(b)

end

def encode(str)
  i = 0
  codes = {}
  encoded =''
  str.split('').each do |letter|
    if !codes.has_key?(letter)
      codes[letter] = i
      i += 1
    end
    encoded << codes[letter]
  end
  encoded
end
p isomorphic?('foo', 'app') # => true
p isomorphic?('foo', 'ant') # => false
p isomorphic?('turtle', 'tletur') # => false