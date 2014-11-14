function print(){
  for(var i = 0 ; i < 10 ; i ++){
    var x = function(j){
      return console.log(j);
    }(i);
  }
}

// print();

function printAgain(){
  for(var i = 0; i < 10 ; i ++){
    var x = function(){
      console.log(i);
    };
    return x();
  }
}

console.log(printAgain())