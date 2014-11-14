// pass by reference
// you change the underlying original object in memory. This is not a copy

// helper function
function swapByReference(A,B){
	var temp = A.A;
	A.A = B.B;
	B.B = temp;

}


// pass by value
// you pass a copy of the value and any changes you make are in a different place in memory
// javascript and ruby naturally pass by value
// in C++ and C, you pass pointers to that object's place in memory.


// helper function
function swapByValue(A,B){
	var temp = A;
	A = B;
	B = temp;
}

function wrapper(A,B){
	console.log('Original A: '+A+' B: '+B);	
	swapByValue(A,B);
	// A and B will not change
	console.log('By Value A: '+A+' B: '+B);
	var A = {'A':A}
	var B = {'B': B}
	swapByReference(A,B);
	// A and B should change
	console.log('By Reference A: '+A.A+' B: '+B.B);
}

wrapper(1,2);