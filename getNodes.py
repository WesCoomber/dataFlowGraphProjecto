bad_words = [ 'jns', 'js', 'jnz', 'jz', 'jno', 'jo', 'jbe', 'jb', 'jle', 'jl', 'jae', 'ja', 'jne loc', 'je', 'jmp', 'jge', 'jg', 'SLICE_EXTRA', 'SLICE_ADDRESSING', '[BUG]', 'SLICE_VERIFICATION', 'syscall', '#PARAMS_LOG']

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
print(instrNodes)
print(len(instrNodes))

