#Javascript

## Closure
- A closure is an inner function that has access to the outer (enclosing) function’s variables
- The closure has three scope chains: it has access to its own scope (variables defined between its curly brackets), it has access to the outer function’s variables, and it has access to the global variables.

### cool things to know

1. closures have access to the outer function's variables- even after the outer function has been returned
2. closures store references to outer variables

## OOP
### Inheritance
Code Reuse

### Encapsulation
Object Creation: Localizing functionality to an object

## Prototype
1. for inheritance!
2. you add methods and properties on a function’s prototype property to make those methods and properties available to instances of that function.
3. prototype attribute aka prototype object.
### usage
1. prototype based inheritance: objects can inherit properties and methods from other objects
	- you can set an object to be a prototype of 
2. accessing attributes
	- the prototype chain: if you try to access attributes of an object, it will look at the current object's properties. If it can't find it, then it will look up the chain. Undefined is returned if nothing is found.


