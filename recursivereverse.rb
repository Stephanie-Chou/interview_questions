def reverse(word)
  return word if word == ""
  reversed = reverse(word[1..-1])+ word[0]
end
