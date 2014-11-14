function wordLadder(start,end, dict){
	// keep track of the edit distance of each new word
	// for each new edited word, push it on to the word queue and store its edit distance
	// pop words off of the queue, check if they are the end word. if not...edit them!

	var dist = {};
	var q = new Queue();
	var alphabet = "abcdefghijklmnopqrstuvwxyz".split('');
	q.push(start);
	dist[start] = 0;

	while(!q.empty){
		word = q.peek();
		q.pop();
		if (word === end){
			return dist[word];
		}

		for (var i = 0; i<word.length; i++){
			for(var letter = 0; letter<alphabet.length; letter++ ){
				newWord = word.split('');
				newWord[i] = alphabet[letter];
				newWord = newWord.join('');
				// if we haven't seen the word before and if the word exists in the dictionary
				if(!(newWord in dist) && (newWord in dict)){
					q.push(newWord);
					dist[newWord] = dist[word]+1;
				}
			}
		}
	}

	return -1
}