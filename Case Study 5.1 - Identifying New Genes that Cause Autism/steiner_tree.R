######## Input is an igraph object called "graph" and a vector called "terminals" 
# containing the indices of the seed nodes. Note that the vertex labels of the graph 
# are assumed to be labeled from 1 up to m and the igraph object needs to be 
# a connected graph.
########################################################################################

steiner_tree <- function(terminals, graph){
	A = shortest.paths(graph, terminals, terminals)
	diag(A) = Inf
	inds <- arrayInd(which.min(A), dim(A))
	nodes = get.shortest.paths(graph, terminals[inds[1,1]], terminals[inds[1,2]])$vpath[[1]]
	free_terminals = terminals[!terminals %in% nodes]

	for (i in 1:length(free_terminals)){
		A = shortest.paths(graph, nodes, free_terminals)
		inds <- arrayInd(which.min(A), dim(A))
		new_nodes = get.shortest.paths(graph, nodes[inds[1,1]], free_terminals[inds[1,2]])$vpath[[1]]
		free_terminals = free_terminals[!free_terminals %in% new_nodes]
		nodes = unique(c(nodes, new_nodes))
	}
	steinertree = induced.subgraph(graph, nodes)
	V(steinertree)$name = sort(nodes)
	return(steinertree)
}