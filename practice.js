// given array of numbers
// find 3 elements that add to 0
function threeSum(arr){
	var sorted = bubblesort(arr);
	var triplets = {};

	for(var curr = 0; curr < arr.length; curr++){
		next = curr+1;
		last = arr.length - 1;
		while (next< last){
			var sum = sorted[curr]+sorted[next]+sorted[last];
			if(sum === 0){

				if (!([sorted[curr],sorted[next],sorted[last]] in triplets)){
					console.log(sorted[curr]+","+sorted[next]+","+sorted[last]);
					triplets[[sorted[curr],sorted[next],sorted[last]]] = 1;
				}
				next++;
				last--;
			}else if(sum>0){
				last --;
			}else{
				next++
			}
		}
	}
	return triplets
}

function bubblesort(arr){
	if(arr.length < 2){
		return arr;
	}else{
		var swapped = true;
		var temp;
		while (swapped == true){
			swapped = false;
			for(var i = 0; i< arr.length; i++){
				if (arr[i]> arr[i+1]){
					temp = arr[i];
					arr[i] = arr[i+1];
					arr[i+1] = temp;
					swapped = true
				}
			}
			console.log(arr)
		}
	}
	return arr
}

arr = [-1,0,1,2,-1,-4]
bubblesort(arr)

//squareroot
function compare(actual, approx){
	// they are super close, so we can just say SURE!
	if(Math.abs((actual-approx)/actual) < 0.00001){
		return 0;
	}
	else{
		return -1;
	}
}
function squareroot(x){
	var lower = 1;
	var upper = x/2;
	var mid = (lower + upper)/2;
	var squared = mid*mid;

	while (squared !== x){
		if (compare(x, squared) == 0){
			break;
		}else if (squared > x){
			upper = mid;
		}else{
			lower = mid;
		}
		mid = (upper+lower) /2;
		squared = mid*mid;
	}
	return mid;
}



// longest palindromic substring




// merge two sorted arrays: given two arrays, merge them into a single sorted array
// O(n+m)
function merge(a,b){
	var sorted = [];
	var i = 0;
	var j = 0;
	var aPointer = a[i];
	var bPointer = b[j];

	while (sorted.length !== (a.length+b.length)){
		if (aPointer<bPointer || j===b.length){
			sorted.push(aPointer);
			i++;
			aPointer=a[i];
		}
		else{
			sorted.push(bPointer);
			j++;
			bPointer = b[j];
		}
	}
	return sorted;
}

// two sum: given an array of numbers and a target return the indices that would add up to the target. assume only 1 possible solution
twoSum([1,3,4,7], 7);
function twoSum(arr, target){
	var pairs = {};
	for (var i = 0; i< arr.length; i++){
		key = target = (arr[i]);
		if(pairs[key] !== arr[i]){
			pairs[key] = arr[i];
		}
		else{
			return [pairs[key], arr[i]];
		}
	}
}


// reverse a doubly linked list
function DoubleList(head, tail){
	this.head = head;
	this.tail = tail;
}

DoubleList.prototype.reverse = function() {
		var curr = this.head;
		var dummy = null;
	while (curr != null){
		curr.prev = curr.next;
		curr.next = dummy;
		dummy = curr;
		curr = dummy.prev;
	}
	this.tail = this.head;
	this.head = dummy;
};

DoubleList.prototype.print = function() {
	curr = this.head;

	while (curr!= null){
		console.log(curr.value);
		curr = curr.next;
	}
};

function Node(value){
	this.next = null;
	this.prev = null;
	this.value = value;
}

node1 = new Node(10);
node2 = new Node(9);
node3 = new Node(1);
node1.next = node2;
node2.next = node3;
node2.prev = node1;
node3.prev = node2;
list = new DoubleList(node1, node3);


// Given two iterators make a single iterator to iterate over those two

// ex: given iterators [1,2] and [3,4], create an interator class that can iterate over the two iterators such that when you call next() you will get 1,2,3,4. iterators all have a next()

function BigIterator(iter1, iter2){
	this.iterators = [iter1, iter2];
	this.curr = 0;
}

BigIterator.prototype.next= function() {
	var dummy = iterators[curr].next();
	if ( dummy !==null){
		return dummy;
	}
	else{
		this.curr ++;
		if (curr<this.iterators.length){
			return iterators[curr].next();
		}
		else{
			return null;
		}
	}
}

// generate all possible case cominations given a lower case string

function generateCaseCombinations(sorted, left){
	if(left === ""){
		console.log(sorted);
	}
	else{
		for (var i = 0, upper, lower, remaining; i < left.length; i++){
			upper = sorted+left[i].toUpperCase();
			lower = sorted+left[i].toLowerCase();
			remaining = left.substr(0,i)+left.substr(i+1);
			generateCaseCombinations(upper, remaining);
			generateCaseCombinations(lower, remaining);
		}
	}
}

// anagrams: given an array of strings, find the groupings of anagrams

function findAnagrams(arr){
	var words = {};
	for(var i = 0; i<arr.length; i++){
		// assuming sort is a helper function
		if (! arr[i].sort(function(a,b){return a-b}) in words){
			words[arr[i].sort(function(a,b){return a-b})] = arr[i];
		}
		else{
			words[arr[i].sort()].push(arr[i])
		}
	}

	var anagrams = [];
	Object.keys(words).forEach(function(key){
		if(words[key].length > 1){
			anagrams.push(words[key]);
		}
	});
}

function recPermute(soFar,rest){
	if(rest === ""){
		console.log(soFar);
	}
	else{
		for(var i = 0; i < rest.length; i ++){
			var next = soFar+rest[i];
			var remaining = rest.substr(0,i)+ rest.substr(i+1);
			RecPermute(next, remaining);
		}
	}
}

function allPermutations(s){
	RecPermute("",s);
}

var arr = [1,2,2,3,5,5,6];

function RemoveDups(arr){
	var curr_val = arr[0] ;
	var unique = [curr_val];
	for (var i = 1; i<arr.length; i++){
		if (arr[i] !== curr_val){
			curr_val = arr[i];
			unique.push(curr_val);
		}
	}
	return unique;
}

function ReverseWords(sentence){
	arr = sentence.split(' ');
	return ReverseArray(arr);
}

function ReverseArray(arr){
	dummy = [];
	for (var i = arr.length-1; i >=0; i--){
		dummy.push(arr[i]);
	}
	return dummy;
}


function insertionSort(input) {
   for (var i = 0, j, tmp; i < input.length; ++i) {
      tmp = input[i];
      for (j = i - 1; j >= 0 && input[j] > tmp; --j){
         input[j + 1] = input[j];
       }
      input[j + 1] = tmp;
      console.log(arr)
   }
}

arr = [-1,0,1,2,-1,-4];
insertionSort(arr);


function palindrome(n){
	var copy = n;
	var reversed = 0;
	while (n!==0){
		reversed = reersed*10 + n%10;
		n /= 10;
	}
	return (copy === reversed);
}