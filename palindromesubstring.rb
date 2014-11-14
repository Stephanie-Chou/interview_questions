=begin

	2 pointers: hold place at start and end of possible palindrome
	2 pointers: start ++, end -- if


best possible runtime = O(n)

	"i am a racecar driver"

base cases

given string of length < 2, false
 given "aa" true


given 'aba' true
given a string of length 3 where any of the letters are the same , then true

given


aabb
abab
baba
bbaa
abba
baab


any palindrome must have 2 or 3 characters. we can look for two and three character substrings so we should start at index 1 and check for 2 or three


=end


def hasPalindrome?(str)
  return false if str.length < 2
  i = 1
  while i < str.length

    return true if str[i-1]== str[i+1] || str[i-1]==str[i]
    i+=1
  end
  return false
end


# p "aabb #{ hasPalindrome?('aabb')}"
# p "ab #{hasPalindrome?("ab")}"
# p "aa #{hasPalindrome?("aa")}"
# p "baab #{hasPalindrome?("baab")}"
# p "bab #{hasPalindrome?("bab")}"



def findPalindromeCenter(str)
  return -1 if str.length < 2
  i = 1
  while i < str.length

    return i if str[i-1]== str[i+1] || str[i-1]==str[i]
    i+=1
  end
  return -1
end

# Find the center of a possible palidrome. Work from the center out from there to find the full palidrome. Then restart the search for the center of the next possible at one letter over from the center.


def findWholePalindrome(str, center)
  if str[center] == str[center-1]
    i = center
    j = center-1
  else
    i = center+1
    j = center-1
  end
  until j < 0 || i > str.length || str[j] != str[i]
    j-=1
    i+=1
  end
  return str[j+1..i-1]
end

def longestPalindrome(str)
  longPalindrome = ''
  center = 0
  new_center = 0
  while center < str.length && new_center != -1
    new_center = findPalindromeCenter(str[center..-1])
    center += new_center
    if new_center > -1
      palindrome = findWholePalindrome(str, center)
      longPalindrome = palindrome if longPalindrome.length < palindrome.length
    end
  end
  return longPalindrome
end

p longestPalindrome("aacabbacde")

p longestPalindrome("i am a racecar driver")

p longestPalindrome ("amanaplanacanalpanama")

p longestPalindrome("i am a racecar driver racecar re")
