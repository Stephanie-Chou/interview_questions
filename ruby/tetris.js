console.log("hello");
document.onkeyup = function(e){
  keys = {
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down',
    32: 'space'

  }
  console.log(keys[e.keyCode])
}


tetris = function(){



}


function Tetrimino(type){
  this.type = type;
}

function Square(){}

Square.prototype = new Tetrimino('square');