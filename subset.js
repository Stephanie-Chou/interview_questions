// check if A is a subset of B
function isSubset(A,B){

	if (A == []){
		return true
	}

	if(A.length>B.length ){
		return false
	}

	var nums = {};
	for (var m = 0; m<B.length; m++){
		if (B[m] in nums){
			nums[B[m]]++;
		}else{
			nums[B[m]] = 1;
		}
	}
	for (var n = 0 ; n < A.length; n++){
		if(A[n] in nums){
			nums[A[n]]--;
		}else{
			return false;
		}
	}
	return true
}

var A = [1,2,3,4]
var B = [0,4,7,2,5,2,8,1]
console.log(isSubset(A,B));

var A = [1,2,3,4]
var B = [0,4,7,2,5,2,8,1,3]
console.log(isSubset(A,B));


var B = [1,2,3,4]
var A = [0,4,7,2,5,2,8,1]
console.log(isSubset(A,B))

var A = [0,4,7,2,5,2,8,1]
var B = []
console.log(isSubset(A,B))


var A = []
var B = [1,2,3,4]
console.log(isSubset(A,B))



// find all subsets of an array
function allSubsets(arr){
	var sets = [[]];
	for (var i = 0; i < arr.length; i ++){
		var len = sets.length;
		for (var j = 0; j < len; j ++){
			sets.push(sets[j].concat(arr[i]));
		}
	}
	console.log(sets);
	return sets
}

var arr = [1,2,3,3]

allSubsets(arr)