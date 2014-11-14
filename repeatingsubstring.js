// longest non repeating substring

// keep track of what we have seen so far.
// if we have seen something before, check if the last substring was the max length
// then backtrack and update the start of the substring to be the index just after we saw a repeating character.
// make sure to update the characters you haven't seen.
function longestNoRepeat(str){
	if (str.length < 2){
		return str;
	}
	var len = str.length;
	var max = 0;
	var start = 0; // start of current substring

	var seen = {};

	for (var curr = 0; curr < len; curr++){
		// if we have seen it:
		if (seen[str[curr]] === true){
			// update max
			console.log(str.substr(start, curr));
			if (curr-start > max){
				max = curr-start;
			}
			// reset start point
			while (str[start] !== str [curr]){
				seen[str[start]] = false;
				start ++;
			}
			start ++
		}else{
			seen[str[curr]] = true;
		}
	}

	// check if the current substring is the longest
	console.log(str.substr(start, curr));
	var curr_length  = curr-start;
	return curr_length > max ? curr_length : max
}

console.log(longestNoRepeat("repeating"));
