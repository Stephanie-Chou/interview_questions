
def wordLadder(start, finish, dict)
	dist = {}
	queue = []
	
	queue.push(start)
	dist[start] = 0
	while !queue.empty?
		word = queue.shift
		break if word == finish
		for i in (0 .. start.length-1).to_a do
			for char in ('a'..'z').to_a do
				newword = word.dup
				newword[i] = char
				if !dist.has_key?(newword) && dict.has_key?(newword)
					dist[newword] = dist[word]+1
					queue.push(newword)
				end
			end
		end
	end

	return dict.has_key?(word) ? dist[word] : start
end

dict = {'sort'=>1,'fart'=>1,'farm'=>1,'form'=>1,'fort'=>1}
p wordLadder('fort', 'farm', dict)

dict = {'cart'=>1,'mart'=>1,'mark'=>1,'dark'=>1,'dork'=>1, 'work' =>1, 'bart'=>1, 'darn'=>1}
p wordLadder('cart', 'work', dict)