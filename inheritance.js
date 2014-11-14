function Plant(){
	this.origin = 'earth';
	this.organic = true;
}

Plant.prototype.whoami = function() {
	return("I am a "+ this.color +" "+ this.name +" and I come from "+this.origin)
};

function Fruit(color, name){
	this.color = color;
	this.name = name;
}



// set fruit prototype to inherit all of Plant's stuff
Fruit.prototype = new Plant();

var banana = new Fruit("yellow", 'banana');

console.log(banana.name);
console.log(banana.whoami());