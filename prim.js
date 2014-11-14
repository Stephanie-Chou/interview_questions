/* 
1. pick a random node
2. find the minimum edge weight whos source is that node
3. mark that node as visited
4. store that edge
5 find the sink of that edge
6. repeat

*/



function prim(G,v){
	// assuming G is in a hash form where keys are the node and the values are an array of adjacent nodes.
	var INFINITY = 100;
	var dist = []; // priority queue
	var edge = [];
	var u = Object.keys(G); 
	// intialize all distances to infinity
	for (var i = 0; i <u.length; i++){
		dist[u[i]] = INFINITY;
	}

	// initial distance from v is 0
	dist[v] = 0;
	// parent of v is null
	edge[v] = null;
	

	while (dist.length !== 0){
		dist = dist.sort(function(a, b){return a-b});;
		var keys = Object.keys(dist);
		var u = keys[0]; // vertex with the shortest distance.
		var adjacentEdges = G[u];
		for (var v = 0; v<adjacentEdges.length; v++){
			var weight = adjacentEdges[v]
			if(weight > 0 && v in keys && weight < dist[v]){
				edge[v] = u;
				dist[v] = weight; 
			}
		}
		dist.shift();
	}

	return edge;
}

var G = {
	0: [0,2,1,0,0,0],
	1: [2,0,0,3,1,4],
	2: [1,0,0,3,4,0],
	3: [0,3,2,0,0,0],
	4: [0,1,4,0,0,0],
	5: [0,4,0,0,0,0]
}

var ans = prim(G, 5);
console.log(ans);