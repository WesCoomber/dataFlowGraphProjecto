bad_words = [ 'jnb','jnbe','jnle','jp', 'jns', 'js', 'jnz', 'jz', 'jno', 'jo', 'jbe', 'jb', 'jle', 'jl', 'jae', 'ja', 'jne loc', 'je', 'jmp', 'jge', 'jg', 'SLICE_EXTRA', '[BUG]', '[ERROR]','SLICE_VERIFICATION', 'syscall', '#PARAMS_LOG']

with open('sliceNew6-8.txt') as oldfile, open('cleanedSliceNew6-8.txt', 'w') as newfile:
    for line in oldfile:
        if ((not any(bad_word in line for bad_word in bad_words)) and ( not line.startswith('get_mem_value'))):
            newfile.write(line)

print('Done! Parsed slice in: ') + newfile.name

