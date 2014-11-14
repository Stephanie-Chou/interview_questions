function Queue(){
	this.inStack = [];
	this.outStack = [];
}

Queue.prototype.push = function(value) {
	this.inStack.push(value);
};

Queue.prototype.pop = function(){
	while (this.inStack.length !== 0){
		var val = this.inStack.pop();
		this.outStack.push(val);
	}

	return this.outStack.pop();
}

Queue.prototype.empty = function() {
	if (this.inStack.length === 0 && this.outStack.length === 0){
		return true;
	}else{
		return false;
	}
};

// q = new Queue();

// q.push(1);
// q.push(2);
// q.push(3);
// console.log(q.pop());
// console.log(q.pop());
// console.log(q.pop());
