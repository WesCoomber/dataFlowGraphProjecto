push ebp
call recheck_start
pop ebp
call access_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call stat64_recheck    
call open_recheck    
call read_recheck    
call fstat64_recheck    
mov edi, dword ptr [0xbfffef68]	       
mov ecx, dword ptr [0xbfffef6c]	       
mov edx, 0  
xor edx, ecx	       
mov eax, 0  
xor eax, edi	       
or edx, eax	       
mov edx, 0  
xor edx, ecx	       
mov eax, 0  
xor eax, edi	       
or edx, eax	       
mov edx, 0  
xor edx, ecx	       
mov eax, 0  
xor eax, edi	       
or edx, eax	       
mov  dword ptr [0xbfffee74], edi	       
mov edi	,  dword ptr [0xbfffee74]       
call close_recheck    
mov eax, dword ptr [0xbfffef68]	       
mov edx, dword ptr [0xbfffef6c]	       
mov dword ptr [0xb7fdde98], eax	       
mov dword ptr [0xb7fdde9c], edx	       
mov eax, 20    
int 0x80    
mov ecx, eax	       
mov dword ptr [0xb7e41728], ecx	       
mov eax, ecx	       
mov dword ptr [0xbffff4c8], eax	       
cmp dword ptr [0xbffff4c8], 0x0	       
mov eax, dword ptr [0xbffff4c8]	       
mov dword ptr [0xbffff4b4], eax	       
mov  dword ptr [0xbffff4a0], eax	       
mov  dword ptr [0xbffff49c], ecx	       
mov ecx, dword ptr [0xbffff49c]	       
mov eax, dword ptr [0xbffff4a0]	       
call fstat64_recheck    
mov eax, dword ptr [0xbffff4b4]	       
mov ecx, eax	       
mov edx, eax	       
shr ecx, 0x1f	       
neg edx	       
test ecx, ecx	       
mov dword ptr [0xbfffefd4], ecx	       
mov dword ptr [0xbfffefe4], eax	       
xor eax, eax	       
mov eax, dword ptr [0xbfffefe4]	       
mov dword ptr [0xbfffef70], eax	       
mov ecx, dword ptr [0xbfffef70]	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46f], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46e], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46d], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46c], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46b], al	       
cmp dword ptr [0xbfffefe4], 0x0	       
xor edx, edx	       
cmp dword ptr [0xbfffefe4], 0x0	       
mov eax, 0  
or eax, dword ptr [0xbfffefd4]	       
mov  dword ptr [0xbfffefd8]	    , 0   
or eax, dword ptr [0xbfffefd8]	       
cmp eax, 0x1	       
cmp dword ptr [0xbfffefd4], 0x0	       
cmp dword ptr [0xbfffefe4], 0x0	       
cmp byte ptr [0xbffff46f], 0xa	       
cmp byte ptr [0xbffff46e], 0xa	       
cmp byte ptr [0xbffff46d], 0xa	       
cmp byte ptr [0xbffff46c], 0xa	       
cmp byte ptr [0xbffff46b], 0xa	       
movzx ecx, byte ptr [0xbffff46b]	       
mov byte ptr [0xb7e40012], cl	       
movzx ecx, byte ptr [0xbffff46c]	       
mov byte ptr [0xb7e40013], cl	       
movzx ecx, byte ptr [0xbffff46d]	       
mov byte ptr [0xb7e40014], cl	       
movzx ecx, byte ptr [0xbffff46e]	       
mov byte ptr [0xb7e40015], cl	       
movzx ecx, byte ptr [0xbffff46f]	       
mov byte ptr [0xb7e40016], cl	       
mov eax, dword ptr [0xbffff4c8]	       
mov dword ptr [0xbffff4cc], eax	       
mov eax, dword ptr [0xbffff4cc]	       
mov dword ptr [0xbffff4b4], eax	       
mov eax, dword ptr [0xbffff4b4]	       
mov ecx, eax	       
mov edx, eax	       
shr ecx, 0x1f	       
neg edx	       
test ecx, ecx	       
mov dword ptr [0xbfffefd4], ecx	       
mov dword ptr [0xbfffefe4], eax	       
xor eax, eax	       
mov eax, dword ptr [0xbfffefe4]	       
mov dword ptr [0xbfffef70], eax	       
mov ecx, dword ptr [0xbfffef70]	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46f], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46e], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46d], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46c], al	       
mov eax, ecx	       
mov ebp, 3435973837  
mul ebp	       
shr edx, 0x3	       
lea eax, [edx+edx*4]	       
add eax, eax	       
sub ecx, eax	       
test edx, edx	       
mov edi, 0xb7f8be40  
movzx eax, byte ptr [edi+ecx*1]	       
mov ecx, edx	       
mov byte ptr [0xbffff46b], al	       
cmp dword ptr [0xbfffefe4], 0x0	       
xor edx, edx	       
cmp dword ptr [0xbfffefe4], 0x0	       
mov eax, 0  
or eax, dword ptr [0xbfffefd4]	       
mov  dword ptr [0xbfffefd8]	    , 0   
or eax, dword ptr [0xbfffefd8]	       
cmp eax, 0x1	       
cmp dword ptr [0xbfffefd4], 0x0	       
cmp dword ptr [0xbfffefe4], 0x0	       
cmp byte ptr [0xbffff46f], 0xa	       
cmp byte ptr [0xbffff46e], 0xa	       
cmp byte ptr [0xbffff46d], 0xa	       
cmp byte ptr [0xbffff46c], 0xa	       
cmp byte ptr [0xbffff46b], 0xa	       
movzx ecx, byte ptr [0xbffff46b]	       
mov byte ptr [0xb7e4000c], cl	       
movzx ecx, byte ptr [0xbffff46c]	       
mov byte ptr [0xb7e4000d], cl	       
movzx ecx, byte ptr [0xbffff46d]	       
mov byte ptr [0xb7e4000e], cl	       
movzx ecx, byte ptr [0xbffff46e]	       
mov byte ptr [0xb7e4000f], cl	       
movzx ecx, byte ptr [0xbffff46f]	       
mov byte ptr [0xb7e40010], cl	       
