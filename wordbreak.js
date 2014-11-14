function Wordbreak(str, dict){
	
	if( str in dict){
		return true;
	}
	
	for(var i = 0; i< str.length; i++){
		var prefix = str.substr(0, i+1);
		console.log(prefix);
		if (!(prefix in dict)){
			// if the prefix doesn't exist, then we need to keep adding letters until we find a prefix.
			continue;
		}
		var remaining = str.substr(i+1);
		if (Wordbreak(remaining, dict)){
			return true;
		}
	}

	return false;

}

var dict = {'a':1, 'aa': 1,'aaa':1, 'aaaaaa':1}
str ="aaaaaaaaaabaaaa"


// var dict = {'i':1, 'like': 1,'cookies':1, 'cook':1}

// str = 'ilikecookies'

console.log(Wordbreak(str,dict));