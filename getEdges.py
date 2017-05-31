import re
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
print('Done! Instruction Nodes List is : ') #+ instrNodesString
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


for x in instrNodes:
	instrNodes[j] = str(j)+ ' ' +instrNodes[j]

	dict1[instrNodes[j]] = instrEdges[j]
	j+=1

instrNodesString = ''.join(instrEdges)
print('Done! Instruction Edges List is : ') #+ instrNodesString
#print(instrEdges)
#print(instrNodes)
print(len(instrEdges))

nodeEdgesDict = dict(zip(instrNodes, instrEdges))

new_dict = {k: v for k, v in zip(instrNodes, instrEdges)}
print(dict1)
print(len(dict1))

