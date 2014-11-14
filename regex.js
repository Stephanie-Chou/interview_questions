// regex for * and .
function isMatch(s, p){

	if(p ===''){
		return true;
	}

	// contains *
	// search the through whole string for potential matches via recursion

	// if there are none, thats ok! because * means any or none. so do a recursive call to look for the rest of the pattern in the string
	if (p[1] == '*'){
		for (var i = 0; i < s.length && (p[0]==='.' || p[0]===s[0]); i++){
			if (isMatch(s.substr(i+1), p.substr(2))){
				return true;
			}
		}
		return isMatch(s, p.substr(2));

	}

	// if string is not empty and if character match... then we need to match up the rest of the string! so make a recursive call

	if (s!=='' && (p[0]==='.' || p[0]===s[0])){
		return isMatch(s.substr(1), p.substr(1));
	}else{
		return false;
	}
}

function regex(s,p){
	for (var j = 0; j<s.length; j++){
		if (isMatch(s.substr(j),p)){
			return true;
		}
	}
	return false;
}


var s = "aabc";
var p = "a*.c";

console.log(regex(s,p));

var s = "aabc";
var p = "a*.d";

console.log(regex(s,p));



var s = "aabc";
var p = "a*.d*";

console.log(regex(s,p));
