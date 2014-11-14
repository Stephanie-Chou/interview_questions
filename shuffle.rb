# for a deck of n cards, shuffle the first n-1 cards. Then swap the last card with any random card of the first n-1
def shuffle(cards)
  return cards if cards.length < 2
  cards = shuffle(cards[0...-1]) << cards.last

  swap = rand(cards.length)
  temp = cards.last
  cards[-1] = cards[swap]
  cards[swap] = temp

  return cards
end

cards = (1..52).to_a

p shuffle(cards)


