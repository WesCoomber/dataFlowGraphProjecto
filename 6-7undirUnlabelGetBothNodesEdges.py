import re, sys
import functools
import graphviz as gv
from graphviz import Source

bad_words = [ 'jns', 'js', 'jnz', 'jz', 'jno', 'jo', 'jbe', 'jb', 'jle', 'jl', 'jae', 'ja', 'jne loc', 'je', 'jmp', 'jge', 'jg', 'SLICE_EXTRA', 'SLICE_ADDRESSING', '[BUG]', 'SLICE_VERIFICATION', 'syscall', '#PARAMS_LOG']

instrEdges = []
instrNodes = []

fileName = 'smallCleanedSlice.txt'
outFileName = 'b200undiroutputGraph.txt'
renderFileName = 'test-output/b200undirULsmalldataFlowSliceWes.gv'

with open(fileName) as oldfile:
    for line in oldfile:
        tempLine = line.split()
        print(tempLine)
        if (len(tempLine)) >= 2 and tempLine[0] != '[SLICE_ADDRESSING]':
            instrNodes.append(tempLine[1] + '-' + tempLine[2])

i=0
for x in instrNodes:
    instrNodes[i] = x.replace("#", "")
    i += 1


print('Done! Instruction Nodes List Size is : ') 
print(len(instrNodes))

memAddressList = []

nodeCount = -1

pattern = '\s+(\S+)\s'
with open(fileName) as oldfile:
    for line in oldfile:
        prepline = line.replace("#\S*", " r1 ")
        prepline = prepline.replace("[SLICE_INFO]", " r2 ")
        prepline = prepline.replace("[SLICE_INFO]", " r2 ")
        prepline = prepline.replace("[SLICE]", " r3 ")

        prepline = prepline.replace("[SLICE_ADDRESSING]", " r4 ")
        prepline = prepline.replace("[SLICE_ADDRESSING]", " r4 ")
        prepline = prepline.replace("$addr(", " r5 ")
        prepline = prepline.replace(")", " r6 ")
        prepline = prepline.replace("\t", " \t ")
        prepline = prepline.rstrip("\t")
        prepline = re.sub(r'(\s)#\w+', r'\1', prepline)
        prepline = re.sub(r'.*SLICE', '', prepline)
        prepline = re.sub(r'(\s)SLICE\s+', r'\1', prepline)
        prepline = re.sub(r'(\s)immediate_address\s+', r'\1', prepline)
        prepline = re.sub(r'(\s)$addr\s+', r'\1', prepline)
        prepline = re.sub(r'(\s)dword ptr\s+', r'\1', prepline)
        splitList = re.split("r1 | r2 | \t | r3 | r4 | r5 | r6", prepline)

        print(splitList)

        if (len(splitList) >=3) and '0x' not in splitList[2]:
            tempEdge = splitList[1]
            tempEdge = tempEdge.lstrip()
            instrEdges.append(tempEdge)
            nodeCount = nodeCount+1
            #print tempEdges
            #print len(splitList)   
        elif (len(splitList) <=2) and '0x' not in splitList[1]: 
            tempEdge = splitList[1]
            tempEdge = tempEdge.lstrip() 
            instrEdges.append(tempEdge)
            #print ('hello: '+tempEdge)
            nodeCount = nodeCount+1
        if (len(splitList) >=3) and '0x' in splitList[2]:
            memAddr = splitList[2]
            memAddr = memAddr.lstrip()
            #replaces the brackets dword ptr [edi] with the actual mem address from line [SLICE_ADDRESSING]
            cleanedEdge = re.sub(r"[\(\[].*?[\)\]]", memAddr, instrEdges[nodeCount])
            instrEdges[nodeCount] = cleanedEdge
            memAddressList.append(memAddr)

print('List of Memory Addresses used in Slice : ')
print(memAddressList)

print('Done! Instruction Edges List size is : ')
print(len(instrEdges))
#print(instrEdges)


nodeEdgesDict = {k: v for k, v in zip(instrNodes, instrEdges)}
#example dictionary entry is dict1['0-cmp': 'eax, 0xfffff001']
print('Done! Dict (LineNumber-Instruction: Edges) is : ')
print("first node(instr): and its edges(operands): " + 'b7ff5c05-cmp: '+str(nodeEdgesDict['b7ff5c05-cmp']))

flagEnterKeys = 1

while (flagEnterKeys == 1):
    input_var = raw_input('Enter a key (b7ff5c05-cmp for the 1st instruction cmp in the slice): TYPE EXIT TO End.\n')
    
    if (input_var in nodeEdgesDict):
        print("Operands for " + input_var + " are: " + str(nodeEdgesDict[input_var]) + ".\n")
        break
    if ((input_var == "exit") or (input_var == ",exit,")):
        flagEnterKeys = 0;
        break
    else :
        print("ERROR! Please enter in a valid key for the instrNodes, instrEdges dictionary.")  

    
    
##New Graphviz-dot code here 
graph = functools.partial(gv.Graph, format='svg')
digraph = functools.partial(gv.Digraph, format='svg')

datG = graph()
nodes = instrNodes
edges = instrEdges

#This block of code is hacky way to get rid of duplicates in memAddressList
#print(memAddressList)
memAddressDict = {k: v for k, v in zip(memAddressList, memAddressList)}
#memAddressList = list(memAddressDict.keys())
#print(memAddressList)



def add_nodes(graph):
    for n in nodes:
        graph.node(n, label = str(n) + '(' + str(nodeEdgesDict[n]) + ')')
    return graph

def add_edges(graph):
    for e in edges:
        graph.edge(*e)
    return graph


cmpFlags = []
newestOF = ''
newestSF = ''
newestZF = ''
newestAF = ''
newestCF = ''
newestPF = ''

# default values 'R' means edge from root node in the 32-bit 4word registers
#Accumulator    Counter     Data    Base    Stack Pointer   Stack Base Pointer  Source  Destination
EAX = ['R','R','R','R']
ECX = ['R','R','R','R']
EDI = ['R','R','R','R']
EDX = ['R','R','R','R']
EBX = ['R','R','R','R']
ESP = ['R','R','R','R']
EBP = ['R','R','R','R']
ESI = ['R','R','R','R']
EDI = ['R','R','R','R']



#modify Eax register and its 16 and 8 bit versions
def modifyEAX(firstWord, secondWord, thirdWord, fourthWord):
    EAX[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifyAX(thirdWord, fourthWord):
    EAX[2:4] = [thirdWord, fourthWord]

def modifyAH(thirdWord):
    EAX[2:3] = [thirdWord]

def modifyAL(fourthWord):
    EAX[3:4] = [fourthWord]    




#modify ecx register and its 16 and 8 bit versions

def modifyECX(firstWord, secondWord, thirdWord, fourthWord):
    ECX[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifyCX(thirdWord, fourthWord):
    ECX[2:4] = [thirdWord, fourthWord]

def modifyCH(thirdWord):
    ECX[2:3] = [thirdWord]

def modifyCL(fourthWord):
    ECX[3:4] = [fourthWord]    

#modify edx register and its 16 and 8 bit versions

def modifyEDX(firstWord, secondWord, thirdWord, fourthWord):
    EDX[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifyDX(thirdWord, fourthWord):
    EDX[2:4] = [thirdWord, fourthWord]

def modifyDH(thirdWord):
    EDX[2:3] = [thirdWord]

def modifyDL(fourthWord):
    EDX[3:4] = [fourthWord]

#modify ebx register and its 16 and 8 bit versions
def modifyEBX(firstWord, secondWord, thirdWord, fourthWord):
    EBX[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifyBX(thirdWord, fourthWord):
    EBX[2:4] = [thirdWord, fourthWord]

def modifyBH(thirdWord):
    EBX[2:3] = [thirdWord]

def modifyBL(fourthWord):
    EBX[3:4] = [fourthWord]  

#modify esp register and its 16bit versions
def modifyESP(firstWord, secondWord, thirdWord, fourthWord):
    ESP[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifySP(thirdWord, fourthWord):
    ESP[2:4] = [thirdWord, fourthWord]

#modify ebp register and its 16bit versions
def modifyEBP(firstWord, secondWord, thirdWord, fourthWord):
    EBP[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifyBP(thirdWord, fourthWord):
    EBP[2:4] = [thirdWord, fourthWord]

#modify esi register and its 16bit versions
def modifyESI(firstWord, secondWord, thirdWord, fourthWord):
    ESI[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifySI(thirdWord, fourthWord):
    ESI[2:4] = [thirdWord, fourthWord]



#modify edi register and its 16bit versions
def modifyEDI(firstWord, secondWord, thirdWord, fourthWord):
    EDI[0:4] = [firstWord, secondWord, thirdWord, fourthWord]

def modifyDI(thirdWord, fourthWord):
    EDI[2:4] = [thirdWord, fourthWord]

#orange instructions "dest reg or mem location modified as output edge" and one 1 source

orangeInst = [
'cmovz',
'pop',
'inc',
'neg',
'rep',
'setbe',
'mov',
'cmpxchg',
'setz'
]




#gold instructions "dest reg or mem location modified as output edge" and two 2 sources

goldInst = [
'and',
'imul',
'sar',
'xor',
'sub',
'add',
'adc',
'shr',
'shl',
'or',
]

#green instructions "dest reg or mem location modified as output edge" and three 3 sources

greenInst = [
'sbb',
]


#pink instructions "NO dest reg or mem location modified as output edge" and two 2 source

pinkInst = [
'test',
'bt',
'cmp'
]

statusFlags = [] 
datG.node('R', 'Root')
#datG.node('Out', 'Output')

print('EDGES: ' + str(instrEdges))

pattern = re.compile("^\s+|\s*,\s*|\s+$")
for idx, c in enumerate(instrEdges):
    splitStr = [a for a in pattern.split(c) if a]

    print('splitStr ' + str(idx) + ' ' + str(splitStr))

    for idz, b in enumerate(splitStr):
        tempNodeStr = instrNodes[(idx)]

        #print('splitStrZ ' + str(idz) + ' ' + str(splitStr))
        #input edges for orangeInstructions, such as 'mov' they only have one 1 source(second arg)         
        if idz == 1:
                if any(x in tempNodeStr for x in orangeInst):
                    #print('debug ' + tempNodeStr)
                     #Eax edges 
                    if splitStr[idz] == "eax":
                        for ido, k in enumerate(EAX):
                            datG.edge(k, tempNodeStr, label=''+'(eax)'+str(ido))
                    elif splitStr[idz] == "ax":
                        for ido, k in enumerate(EAX[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(ax)'+str(ido))
                    elif splitStr[idz] == "ah":
                        for ido, k in enumerate(EAX[2:3]):
                            datG.edge(k, tempNodeStr, label=''+'(ah)'+str(ido))
                    elif splitStr[idz] == "al":
                        for ido, k in enumerate(EAX[3:4]):
                            datG.edge(k, tempNodeStr, label=''+'(al)'+str(ido))
                    #Ecx edges 
                    elif splitStr[idz] == "ecx":
                        for ido, k in enumerate(ECX):
                            datG.edge(k, tempNodeStr, label=''+'(ecx)'+str(ido))
                    elif splitStr[idz] == "cx":
                        for ido, k in enumerate(ECX[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(cx)'+str(ido))
                    elif splitStr[idz] == "ch":
                        for ido, k in enumerate(ECX[2:3]):
                            datG.edge(k, tempNodeStr, label=''+'(ch)'+str(ido))
                    elif splitStr[idz] == "cl":
                        for ido, k in enumerate(ECX[3:4]):
                            datG.edge(k, tempNodeStr, label=''+'(cl)'+str(ido))
                    #
                    #Edx edges 
                    elif splitStr[idz] == "edx":
                        for ido, k in enumerate(EDX):
                            datG.edge(k, tempNodeStr, label=''+'(edx)'+str(ido))
                    elif splitStr[idz] == "dx":
                        for ido, k in enumerate(EDX[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(dx)'+str(ido))
                    elif splitStr[idz] == "dh":
                        for ido, k in enumerate(EDX[2:3]):
                            datG.edge(k, tempNodeStr, label=''+'(dh)'+str(ido))
                    elif splitStr[idz] == "dl":
                        for ido, k in enumerate(EDX[3:4]):
                            datG.edge(k, tempNodeStr, label=''+'(dl)'+str(ido))
                    #
                    #Ebx edges 
                    elif splitStr[idz] == "ebx":
                        for ido, k in enumerate(EBX):
                            datG.edge(k, tempNodeStr, label=''+'(ebx)'+str(ido))
                    elif splitStr[idz] == "bx":
                        for ido, k in enumerate(EBX[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(bx)'+str(ido))
                    elif splitStr[idz] == "bh":
                        for ido, k in enumerate(EBX[2:3]):
                            datG.edge(k, tempNodeStr, label=''+'(bh)'+str(ido))
                    elif splitStr[idz] == "bl":
                        for ido, k in enumerate(EBX[3:4]):
                            datG.edge(k, tempNodeStr, label=''+'(bl)'+str(ido))
                    #esp edges
                    elif splitStr[idz] == "esp":
                        for ido, k in enumerate(ESP):
                            datG.edge(k, tempNodeStr, label=''+'(esp)'+str(ido))
                    elif splitStr[idz] == "sp":
                        for ido, k in enumerate(ESP[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(sp)'+str(ido))
                    #
                    #ebp edges
                    elif splitStr[idz] == "ebp":
                        for ido, k in enumerate(EBP):
                            datG.edge(k, tempNodeStr, label=''+'(ebp)'+str(ido))
                    elif splitStr[idz] == "bp":
                        for ido, k in enumerate(EBP[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(bp)'+str(ido))
                    #
                    #esi edges
                    elif splitStr[idz] == "esi":
                        for ido, k in enumerate(ESI):
                            datG.edge(k, tempNodeStr, label=''+'(esi)'+str(ido))
                    elif splitStr[idz] == "si":
                        for ido, k in enumerate(ESI[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(si)'+str(ido))
                    #
                    #
                    elif splitStr[idz] == "edi":
                        for ido, k in enumerate(EDI):
                            datG.edge(k, tempNodeStr, label=''+'(edi)'+str(ido))
                    elif splitStr[idz] == "di":
                        for ido, k in enumerate(EDI[2:4]):
                            datG.edge(k, tempNodeStr, label=''+'(di)'+str(ido))
                    #
                    else:
                        if splitStr[idz] in (memAddressDict.keys()):
                            datG.edge(memAddressDict[splitStr[idz]], tempNodeStr, label=memAddressDict[splitStr[idz]]+'(mem)'+str(1))
                        else:
                            datG.edge('R', tempNodeStr, label=''+'(imm)'+str(1))   
             
                      


        #input edges , cmp has for each argument passed in (a AND b) as 2 sources
        if ((any(x in tempNodeStr for x in pinkInst)) or (any(x in tempNodeStr for x in goldInst))):
            #Eax edges 
            if splitStr[idz] == "eax":
                for ido, k in enumerate(EAX):
                    datG.edge(k, tempNodeStr, label=''+'(eax)'+str(ido))
            elif splitStr[idz] == "ax":
                for ido, k in enumerate(EAX[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(ax)'+str(ido))
            elif splitStr[idz] == "ah":
                for ido, k in enumerate(EAX[2:3]):
                    datG.edge(k, tempNodeStr, label=''+'(ah)'+str(ido))
            elif splitStr[idz] == "al":
                for ido, k in enumerate(EAX[3:4]):
                    datG.edge(k, tempNodeStr, label=''+'(al)'+str(ido))
            #Ecx edges 
            elif splitStr[idz] == "ecx":
                for ido, k in enumerate(ECX):
                    datG.edge(k, tempNodeStr, label=''+'(ecx)'+str(ido))
            elif splitStr[idz] == "cx":
                for ido, k in enumerate(ECX[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(cx)'+str(ido))
            elif splitStr[idz] == "ch":
                for ido, k in enumerate(ECX[2:3]):
                    datG.edge(k, tempNodeStr, label=''+'(ch)'+str(ido))
            elif splitStr[idz] == "cl":
                for ido, k in enumerate(ECX[3:4]):
                    datG.edge(k, tempNodeStr, label=''+'(cl)'+str(ido))
            #
            #Edx edges 
            elif splitStr[idz] == "edx":
                for ido, k in enumerate(EDX):
                    datG.edge(k, tempNodeStr, label=''+'(edx)'+str(ido))
            elif splitStr[idz] == "dx":
                for ido, k in enumerate(EDX[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(dx)'+str(ido))
            elif splitStr[idz] == "dh":
                for ido, k in enumerate(EDX[2:3]):
                    datG.edge(k, tempNodeStr, label=''+'(dh)'+str(ido))
            elif splitStr[idz] == "dl":
                for ido, k in enumerate(EDX[3:4]):
                    datG.edge(k, tempNodeStr, label=''+'(dl)'+str(ido))
            #
            #Ebx edges 
            elif splitStr[idz] == "ebx":
                for ido, k in enumerate(EBX):
                    datG.edge(k, tempNodeStr, label=''+'(ebx)'+str(ido))
            elif splitStr[idz] == "bx":
                for ido, k in enumerate(EBX[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(bx)'+str(ido))
            elif splitStr[idz] == "bh":
                for ido, k in enumerate(EBX[2:3]):
                    datG.edge(k, tempNodeStr, label=''+'(bh)'+str(ido))
            elif splitStr[idz] == "bl":
                for ido, k in enumerate(EBX[3:4]):
                    datG.edge(k, tempNodeStr, label=''+'(bl)'+str(ido))
            #esp edges
            elif splitStr[idz] == "esp":
                for ido, k in enumerate(ESP):
                    datG.edge(k, tempNodeStr, label=''+'(esp)'+str(ido))
            elif splitStr[idz] == "sp":
                for ido, k in enumerate(ESP[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(sp)'+str(ido))
            #
            #ebp edges
            elif splitStr[idz] == "ebp":
                for ido, k in enumerate(EBP):
                    datG.edge(k, tempNodeStr, label=''+'(ebp)'+str(ido))
            elif splitStr[idz] == "bp":
                for ido, k in enumerate(EBP[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(bp)'+str(ido))
            #
            #esi edges
            elif splitStr[idz] == "esi":
                for ido, k in enumerate(ESI):
                    datG.edge(k, tempNodeStr, label=''+'(esi)'+str(ido))
            elif splitStr[idz] == "si":
                for ido, k in enumerate(ESI[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(si)'+str(ido))
            #
            #
            elif splitStr[idz] == "edi":
                for ido, k in enumerate(EDI):
                    datG.edge(k, tempNodeStr, label=''+'(edi)'+str(ido))
            elif splitStr[idz] == "di":
                for ido, k in enumerate(EDI[2:4]):
                    datG.edge(k, tempNodeStr, label=''+'(di)'+str(ido))
            #
            else:
                if splitStr[idz] in (memAddressDict.keys()):
                    datG.edge(memAddressDict[splitStr[idz]], tempNodeStr, label=memAddressDict[splitStr[idz]]+'(mem)'+str(2))
                else:
                    datG.edge('R', tempNodeStr, label=''+'(imm)'+str(2))    

        # orange/gold/green Modify 1 one source
        if idz == 0:
                if ((any(x in tempNodeStr for x in orangeInst)) or (any(x in tempNodeStr for x in goldInst)) or (any(x in tempNodeStr for x in greenInst))):
                    # if dest reg is eax
                    if splitStr[idz] == "eax":
                        modifyEAX(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "ax":
                        modifyAX(nodes[idx],nodes[idx])
                    elif splitStr[idz] == "ah":
                        modifyAH(nodes[idx])
                    elif splitStr[idz] == "al":
                        modifyAL(nodes[idx])
                    #    
                    # elif dest reg is ecx
                    elif splitStr[idz] == "ecx":
                        modifyECX(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "cx":
                        modifyCX(nodes[idx],nodes[idx])
                    elif splitStr[idz] == "ch":
                        modifyCH(nodes[idx])
                    elif splitStr[idz] == "cl":
                        modifyCL(nodes[idx])
                    #    
                    # elif dest reg is edx
                    elif splitStr[idz] == "edx":
                        modifyEDX(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "dx":
                        modifyDX(nodes[idx],nodes[idx])
                    elif splitStr[idz] == "dh":
                        modifyDH(nodes[idx])
                    elif splitStr[idz] == "dl":
                        modifyDL(nodes[idx])
                    #    
                    # elif dest reg is ebx
                    elif splitStr[idz] == "ebx":
                        modifyEBX(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "bx":
                        modifyBX(nodes[idx],nodes[idx])
                    elif splitStr[idz] == "bh":
                        modifyBH(nodes[idx])
                    elif splitStr[idz] == "bl":
                        modifyBL(nodes[idx])
                    #
                    # elif dest reg is esp
                    elif splitStr[idz] == "esp":
                        modifyESP(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "sp":
                        modifySP(nodes[idx],nodes[idx])
                    # elif dest reg is ebp
                    elif splitStr[idz] == "ebp":
                        modifyEBP(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "ebp":
                        modifyBP(nodes[idx],nodes[idx])     
                    # elif dest reg is esi
                    elif splitStr[idz] == "esi":
                        modifyESI(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "esi":
                        modifySI(nodes[idx],nodes[idx])      
                    # elif dest reg is edi
                    elif splitStr[idz] == "edi":
                        modifyEDI(nodes[idx],nodes[idx],nodes[idx],nodes[idx])
                    elif splitStr[idz] == "di":
                        modifyDI(nodes[idx],nodes[idx])
                    else:
                        if splitStr[idz] in (memAddressDict.keys()):
                            memAddressDict[splitStr[idz]] = nodes[idx]

       
        if idz == 1:     
        #iterate through the flags outputted (affected) by the instruction and do both:
        #add an edge from the instruction to generic 'OutputNode'
        #update the flags with newest most recent values
            for idy, c in enumerate(statusFlags):
                #this was the output edge place holder
                #datG.edge(tempNodeStr, 'Out', label=tempNodeStr + ',' + str(c))

                if c == "OF":
                    newestOF = tempNodeStr
                if c == "SF":
                    newestSF = tempNodeStr
                if c == "ZF":
                    newestZF = tempNodeStr
                if c == "AF":
                    newestAF = tempNodeStr
                if c == "CF":
                    newestCF = tempNodeStr
                if c == "PF":
                    newestPF = tempNodeStr
                
            statusFlags = [] 
            FlagRegList = [newestOF, newestSF, newestZF, newestAF, newestCF, newestPF]

        #if affects flags register then if [instr] and set status flags to a list of affected flags
        if idz == 0:
            #if instruction affects flags then put if statement for it under here
            if "and" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            if "imul" in tempNodeStr:
                statusFlags = ['CF', 'OF']
            if "neg" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            #bug shifts should set the OF flag too if it is specifically a 1 bit shift
            if "sar" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            if "shr" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            if "shl" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            if "mul" in tempNodeStr:
                statusFlags = ['CF', 'OF']
            if "and" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            if "xor" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            if "add" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            if "adc" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            if "cmpxchg" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            if "sbb" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            if "cmp" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            if "inc" in tempNodeStr:
                statusFlags = ['OF', 'SF', 'ZF', 'AF', 'PF']
            if "dec" in tempNodeStr:
                statusFlags = ['OF', 'SF', 'ZF', 'AF', 'PF']
            if "sub" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'AF', 'PF']
            if "or" in tempNodeStr:
                statusFlags = ['CF', 'OF', 'SF', 'ZF', 'PF']
            # if instr takes flag as input then put if statement for it under here
            #FlagRegList = [0newestOF, 1newestSF, 2newestZF, 3newestAF, 4newestCF, 5newestPF]
            if "sbb" in tempNodeStr:
                datG.edge(FlagRegList[4], tempNodeStr, label='(' + 'CF' +')')
                #datG.edge(FlagRegList[4], tempNodeStr, label=FlagRegList[4] + '(' + str(nodeEdgesDict[FlagRegList[4]])+ ', CF' +')')
            if "setz" in tempNodeStr:
                datG.edge(FlagRegList[2], tempNodeStr, label='(' + 'ZF' +')')
                #datG.edge(FlagRegList[2], tempNodeStr, label=FlagRegList[2] + '(' + str(nodeEdgesDict[FlagRegList[2]])+ ', ZF' +')')
            if "setbe" in tempNodeStr:
                datG.edge(FlagRegList[2], tempNodeStr, label='(' + 'ZF' +')')
                #datG.edge(FlagRegList[2], tempNodeStr, label=FlagRegList[2] + '(' + str(nodeEdgesDict[FlagRegList[2]])+ ', ZF' +')')
                datG.edge(FlagRegList[4], tempNodeStr, label='(' + 'CF' +')')
                #datG.edge(FlagRegList[4], tempNodeStr, label=FlagRegList[4] + '(' + str(nodeEdgesDict[FlagRegList[4]])+ ', CF' +')')
            if "cmovz" in tempNodeStr:
                datG.edge(FlagRegList[4], tempNodeStr, label='(' + 'ZF' +')')
                #datG.edge(FlagRegList[2], tempNodeStr, label=FlagRegList[2] + '(' + str(nodeEdgesDict[FlagRegList[2]])+ ', ZF' +')')


add_nodes(datG)
#add_edges(datG)

print(datG.source)

with open(outFileName, 'w') as outFile:
    for line in datG.source:
        outFile.write(line)

src = Source(datG)
src.render(renderFileName, view=True)

print('done! check '+ outFileName)