function showName (firstName, lastName) { 
	var nameIntro = "Your name is ";
// this inner function has access to the outer function's variables, including the parameter​
	// this inner function is the closure
	function makeFullName () { 
		return nameIntro + firstName + " " + lastName; 
	}
	return makeFullName (); 
} 
var name = showName ("Michael", "Jackson"); // Your name is Michael Jackson 


function giveName(firstName){
	var nameIntro = "Hello World! My name is ";
	console.log("firstName: "+ firstName);
	function lastName(lastName){
		return nameIntro+firstName+' '+lastName;
	}
	console.log("here after the closure:");
	return lastName;
}

// name is now a function and you can pass it arguments!
console.log("first assign name")
var name = giveName("Winnie");

console.log("now we call name");
console.log(name("the Pooh"));



function changeID(){
	var ID = 10;

	return{
		getID: function(){
			return ID;
		},
		setID: function(newID){
			ID = newID;
		}

	}
}
var id = changeID()
var oldID = id.getID();
console.log(oldID);
id.setID(99);
var newID = id.getID();
console.log(newID);