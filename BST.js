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


function Node(value){
	this.left = null;
	this.right = null;
	this.value = value;
}


function Tree(value){
	this.root = new Node(value);
}


Tree.prototype.insert = function(value) {
	this.add(this.root, value);
};

Tree.prototype.add = function(node, value){

	if (node.value< value){
		if (node.right === null){
			node.right = new Node(value);
		}else{
			this.add(node.right, value);
		}
	}else{
		if (node.left === null){
			node.left = new Node(value);
		}else{
			this.add(node.left, value);
		}
	}
}


Tree.prototype.find = function(node, value) {
	
	var found = false;

	while (node && !found){
		if (node.value === value){
			found = true;
		}
		if (node.value >value){
			node = node.left;
		}else{
			node = node.right;
		}
	}
	return found;
}

function BFS(root){
	var q = new Queue();
	var nodes = [];
	q.push(root);
	nodes.push(root.value);
	while (!q.empty()){
		var node = q.pop();
		
		console.log(node.value);

		if (node.left !== null){
			q.push(node.left);
			nodes.push(node.left.value);
		}
		if (node.right !== null){
			q.push(node.right);
			nodes.push(node.right.value);
		}	
	}
	return nodes;
}

var tree = new Tree(5);
tree.insert(3);
tree.insert(4);
tree.insert(2);
tree.insert(7);

// 		5
// 	3		7
// 2	4	

// console.log(tree);

console.log(BFS(tree.root));


function verticalOrder(node){
	if (!node){

		return
	}

	if (node.left !== null){
		verticalOrder(node.left);
	}
	if (node.right!== null){
		verticalOrder(node.right);
	}

}

function preOrder(node){
	if (!node){
		// console.log(node.value);
		return
	}
	console.log(node.value);
	if (node.left !== null){
		preOrder(node.left);
	}
	if (node.right!== null){
		preOrder(node.right);
	}

}

function postOrder(node){
	if (!node){
		return
	}

	if (node.left !== null){
		postOrder(node.left);
	}
	if (node.right!== null){
		postOrder(node.right);
	}
	console.log(node.value);

}


function inOrder(node){
	if (!node){
		return
	}
	
	if (node.left !== null){
		inOrder(node.left);
	}

	console.log(node.value);

	if (node.right!== null){
		inOrder(node.right);
	}

}



// console.log(tree);

console.log("inOrder")
inOrder(tree.root);

console.log("preOrder")
preOrder(tree.root);

console.log("postOrder")
postOrder(tree.root);

// console.log("verticalOrder")
// verticalOrder(tree.root);

console.log("**********************")

// console.log(tree.find(tree.root, 2));

// console.log(tree.find(tree.root, 0));

// if val1 and val2 are in the left and right children of current node, then the current node is the LCA

function LCA(node, val1, val2){
	var right = exists(node.right, val1, val2); 
	var left = exists(node.left, val1, val2);
	if (right && left){
		return node.value;
	}else if (right && !left){
		LCA(node.right, val1, val2);
	}else if(!right && left){
		LCA(node.left,val1, val2);
	}else{
		return null;
	}
}

function exists(node, val1, val2){

	if (!node){
		return false;	
	}
	else if (node.value === val1 || node.value ===val2 ){
		return true;
	}
	else{
		if (exists(node.right, val1, val2) || exists(node.left, val1, val2)){
			return true;
		}
	}

	return false;
}

// console.log(LCA(tree.root, 2,4))


function maxDepth(root){
	if(!root){
		return -1;
	}
	var rightDepth = maxDepth(root.right);
	var leftDepth = maxDepth(root.left);

	return rightDepth > leftDepth ? rightDepth+1 : leftDepth+1
}

console.log(maxDepth(tree.root));

function BSTtoDLL(node){
	if (!node){
		return node
	}

	var l_head = BSTtoDLL(node.left);
	var r_head = BSTtoDLL(node.right);

	if (l_head){
		var rightmost = l_head;
		while (rightmost.right != null){
			rightmost = rightmost.right;
		}
		node.left = rightmost;
		rightmost.right = node;
	}else{
		l_head = node;
	}

	if(r_head){
		node.right = r_head;
		r_head.left = node;
	}else{
		node.right = null;
	}

	return l_head;
}



var list = BSTtoDLL(tree.root);
print(list);

function print(list){
	while (list != null){
		console.log(list.value);
		list = list.right;
	}
}

function maxSum(node){
	if(!node){
		return 0;
	}

	var leftSum = maxSum(node.left) + node.value;
	var rightSum = maxSum(node.right) + node.value;

	return leftSum > rightSum ? leftSum : rightSum
}