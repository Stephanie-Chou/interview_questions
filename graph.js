// uses a stack
// takes input graph and vertex
// we are looking for vertex V in graph G
function DFS(G,v){
	var stack = [];
	stack.push(v);
	v.visted = true;
	while (!stack.empty()){
		// find first unvisited neighbor.

		// if all neighbors have been visited, pop from the stack!
		var node = stack.top();
		var visited = false;
		var neighbors = neighbors(G,node);
		for (var i = 0; i< neighbors.length; i++){
			if (neighbors[i].visited === false){
				visited = true;
				stack.push(neighbors[i]);
				break;
			}
		}
		if (visited === false )
	}
}

// uses a queue
// takes input graph and vertex
function BFS(G,v){
	var q = [];
	v.visited = true;
	q.push(v);

	while(!q.empty()){
		var node = q.shift();
			var neighbors = neighbors(G,node);
			for(var i = 0; i <neighbors.length; i++){
				if(neighbors[i].visted === false){
					neighbors[i].visited = true;
					q.push(neighbors[i]);
				}
			}
	}

}