// given a dictionary where a =>1, b=> 2 ... z=> 26
// and given a string such as '112', determine how many ways that string could be encoded as alphabets

// 0  in
// F F  	F 
// F T   T
// T F   F
// T T   T

function encode(checked, s, dict, count){

	if (s.length < 2){
		return 1;
	}

	if((s.substr(0, 2) in dict) && (s.length > 2)){
		if (s.substr(2) in checked){
			count += checked[s.substr(2)];
		}else{
			count += encode(checked, s.substr(2), dict, count);
			checked[s.substr(2)] = count;
		}
	}
	if(s[1]!=='0'){
		if (s.substr(1) in checked){
			count += checked[s.substr(1)];
		}else{
			count += encode(checked, s.substr(1), dict, count);
			checked[s.substr(1)] = count;
		}
	}
	return count;
}


dict = {
	'1': 'a',
	'2': 'b',
	'3': 'c',
	'4': 'd',
	'5': 'e',
	'6': 'f',
	'7': 'g',
	'8': 'h',
	'9': 'i',
	'10': 'j',
	'11': 'k',
	'12': 'l',
	'13': 'm',
	'14': 'n',
	'15': 'o',
	'16': 'p',
	'17': 'q',
	'18': 'r',
	'19': 's',
	'20': 't',
	'21': 'u',
	'22': 'v',
	'23': 'w',
	'24': 'x',
	'25': 'y',
	'26': 'z'
}

console.log('112');
console.log(encode({},'112',dict,0));
console.log('102');
console.log(encode({},'102',dict,0));
console.log('34290');
console.log(encode({},'34290',dict,0));