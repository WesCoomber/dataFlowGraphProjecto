import re, sys
import functools
import graphviz as gv

bad_words = [ 'jns', 'js', 'jnz', 'jz', 'jno', 'jo', 'jbe', 'jb', 'jle', 'jl', 'jae', 'ja', 'jne loc', 'je', 'jmp', 'jge', 'jg', 'SLICE_EXTRA', 'SLICE_ADDRESSING', '[BUG]', 'SLICE_VERIFICATION', 'syscall', '#PARAMS_LOG']

instrEdges = []
instrNodes = []

with open('cleanedSlice5-24.txt') as oldfile:
    for line in oldfile:
    	tempLine = line.split()
    	instrNodes.append(tempLine[2])

i=0
for x in instrNodes:
	instrNodes[i] = x.replace("#", "")
	i += 1
instrNodesString = ''.join(instrNodes)
print('Done! Instruction Nodes List Size is : ') #+ instrNodesString
#print(instrNodes)
print(len(instrNodes))
#print(instrNodes[len(instrNodes)-1])

pattern = '\s+(\S+)\s'
with open('cleanedSlice5-24.txt') as oldfile:
	for line in oldfile:
		prepline = line.replace("#\S*", " r1 ")
		prepline = prepline.replace("[SLICE_INFO]", " r2 ")
		prepline = prepline.replace("[SLICE_INFO]", " r2 ")
		prepline = prepline.replace("[SLICE]", " r3 ")
		prepline = prepline.replace("\t", " \t ")
		prepline = prepline.rstrip("\t")
		prepline = re.sub(r'(\s)#\w+', r'\1', prepline)
		prepline = re.sub(r'.*SLICE', '', prepline)
		prepline = re.sub(r'(\s)SLICE\s+', r'\1', prepline)
		splitList = re.split("r1 | r2 | \t | r3 ", prepline)

		if (len(splitList) >=2):
			tempEdge = splitList[1]
			tempEdge = tempEdge.lstrip()
			#print tempEdges
			#print len(splitList)	
		else : 
			tempEdge = splitList[0]	
			#print ('hello: '+tempEdge)
			
		instrEdges.append(tempEdge)

#str1 = ''.join(tempLine)

#for line in str1:

dict1 ={}
j = 0

#give unique id number for each instruction based on its line number (starting at 0)
for x in instrNodes:
	instrNodes[j] = str(j)+ '-' +instrNodes[j]
	j+=1

instrNodesString = ''.join(instrEdges)
print('Done! Instruction Edges List size is : ') #+ instrNodesString
#print(instrEdges)
#print(instrNodes)
print(len(instrEdges))


new_dict = {k: v for k, v in zip(instrNodes, instrEdges)}
#print(dict1)
#example dictionary entry is dict1['0-cmp': 'eax, 0xfffff001']
print('Done! Dict (LineNumber-Instruction: Edges) is : ')
#print((new_dict).keys())
#print((new_dict))
print("first node(instr): and its edges(operands): " + '0-cmp: '+str(new_dict['0-cmp']))

#PRINT OUT THE TWO LISTS INTO TWO SEPERATE FILES
#y = ",".join(map(str, instrNodes))
#z = ",,".join(map(str, instrEdges))

#outputFile= open('nodesOut.txt', 'w')
#outputFile.write(y)
#outputFile2 = open('edgesOut.txt', 'w')
#outputFile2.write(z)
flagEnterKeys = 1

while (flagEnterKeys == 1):
	input_var = raw_input('Enter a key (0-cmp for the 1st instruction cmp in the slice): TYPE EXIT TO End.\n')
	
	if (input_var in new_dict):
		print("Operands for " + input_var + " are: " + str(new_dict[input_var]) + ".\n")
	else :
		print("ERROR! Please enter in a valid key for the instrNodes, instrEdges dictionary.")	
	if ((input_var == "exit") or (input_var == ",exit,")):
		flagEnterKeys = 0;
	
	
##New Graphviz-dot code here 
graph = functools.partial(gv.Graph, format='svg')
digraph = functools.partial(gv.Digraph, format='svg')

testNodes = ['A', 'B', 'C', 'D', 'E', 'F']
testEdges = ['AB', 'CD']

datG = digraph()
#nodes = instrNodes
#edges = instrEdges
nodes = testNodes
edges = testEdges

def add_nodes(graph):
    for n in nodes:
        #if isinstance(n, tuple):
        #    graph.node(n[0], **n[1])
        #else:
        graph.node(n)
    return graph

def add_edges(graph):
    for e in edges:
        #if isinstance(e[0], tuple):
        #    graph.edge(*e[0], **e[1])
        #else:
        graph.edge(*e)
    return graph



drawnG = add_nodes(testNodes)
drawnG2 = add_edges(testEdges)

drawnG2.render('img/g4')

#some example graph code 
'''
class Graph(object):

    def __init__(self, graph_dict=None):
        """ initializes a graph object 
            If no dictionary or None is given, 
            an empty dictionary will be used
        """
        if graph_dict == None:
            graph_dict = {}
        self.__graph_dict = graph_dict

    def vertices(self):
        """ returns the vertices of a graph """
        return list(self.__graph_dict.keys())

    def edges(self):
        """ returns the edges of a graph """
        return self.__generate_edges()

    def add_vertex(self, vertex):
        """ If the vertex "vertex" is not in 
            self.__graph_dict, a key "vertex" with an empty
            list as a value is added to the dictionary. 
            Otherwise nothing has to be done. 
        """
        if vertex not in self.__graph_dict:
            self.__graph_dict[vertex] = []

    def add_edge(self, edge):
        """ assumes that edge is of type set, tuple or list; 
            between two vertices can be multiple edges! 
        """
        edge = set(edge)
        (vertex1, vertex2) = tuple(edge)
        if vertex1 in self.__graph_dict:
            self.__graph_dict[vertex1].append(vertex2)
        else:
            self.__graph_dict[vertex1] = [vertex2]

    def __generate_edges(self):
        """ A static method generating the edges of the 
            graph "graph". Edges are represented as sets 
            with one (a loop back to the vertex) or two 
            vertices 
        """
        edges = []
        for vertex in self.__graph_dict:
            for neighbour in self.__graph_dict[vertex]:
                if {neighbour, vertex} not in edges:
                    edges.append({vertex, neighbour})
        return edges

    def __str__(self):
        res = "vertices: "
        for k in self.__graph_dict:
            res += str(k) + " "
        res += "\nedges: "
        for edge in self.__generate_edges():
            res += str(edge) + " "
        return res


if __name__ == "__main__":

    f = { "a" : ["d"],
          "b" : ["c"],
          "c" : ["b", "c", "d", "e"],
          "d" : ["a", "c"],
          "e" : ["c"],
          "f" : []
        }


    print(new_dict)
    print(new_dict['0-cmp'])
    graph = Graph(new_dict)

    print("Vertices of graph:")
    print(graph.vertices())

    print("Edges of graph:")
    print(graph.edges())

    print("Add vertex:")
    graph.add_vertex("z")

    print("Vertices of graph:")
    print(graph.vertices())
 
    print("Add an edge:")
    graph.add_edge({"a","z"})
    
    print("Vertices of graph:")
    print(graph.vertices())

    print("Edges of graph:")
    print(graph.edges())

    print('Adding an edge {"x","y"} with new vertices:')
    graph.add_edge({"x","y"})
    print("Vertices of graph:")
    print(graph.vertices())
    print("Edges of graph:")
    print(graph.edges())	
'''
