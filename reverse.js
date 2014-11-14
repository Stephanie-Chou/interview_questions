function FirstReverse(str) { 

  // code goes here
  str = str.split('');
  var i = 0;
  var j = str.length -1;
  var temp;
  while (i <= j){
    
    temp = str[i];

    console.log("before: "+temp+":"+str[i]+":"+str[j]);
    str[i] = str[j];
    str[j] = temp;
    console.log("after: "+temp+":"+str[i]+":"+str[j]);
    i++;
    j--;
  }
  str = str.join('');
  return str; 
         
}

console.log(FirstReverse("hellojello"));

function SecondReverse(str){
  return str.split('').reverse().join('');
}

console.log(SecondReverse("hellojello"));