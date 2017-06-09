import re, sys
#bad_words = [ 'jnb','jnbe','jnle','jp', 'jns', 'js', 'jnz', 'jz', 'jno', 'jo', 'jbe', 'jb', 'jle', 'jl', 'jae', 'ja', 'jne loc', 'je', 'jmp', 'jge', 'jg', 'SLICE_EXTRA', '[BUG]', '[ERROR]','SLICE_VERIFICATION', 'syscall', '#PARAMS_LOG']

#removes jumps (Control flow instructions) for right now
bad_words = ['.section', '.globl', '_start:', 'jnb','jnbe','jnle','jp', 'jns', 'js', 'jnz', 'jz', 'jno', 'jo', 'jbe', 'jb', 'jle', 'jl', 'jae', 'ja', 'jne loc', 'je', 'jmp', 'jge', 'jg',]
sliceEnd = False

with open('exslice.asm') as oldfile, open('cleanedExSlice.asm', 'w') as newfile:

    for line in oldfile:
	    if ((not any(bad_word in line for bad_word in bad_words)) and ( not line.startswith('get_mem_value'))):
	    	if (not line.startswith('/* slice finishes')):
	    		prepline = re.sub("/\*(.|\n)*?\*/", '', line)
	    	else: 
	    		sliceEnd = True
	    		break
	    	if not prepline.isspace():
	        	newfile.write(prepline)


print('Done! Parsed slice in: ') + newfile.name

