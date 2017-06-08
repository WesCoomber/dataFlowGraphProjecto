.section	.text
.globl _start
_start:
push ebp
call recheck_start
pop ebp
/*TODO: make sure we follow the calling conventions (preseve eax, edx, ecx when we call recheck-support func)*/
/*first checkpoint necessary addresses and registers*/
/*slice begins*/
call access_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call stat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call open_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
call read_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO] 0xbfffefe0 512*/
call fstat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO] 0xbfffef10 */
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef68)  //come with b7fe4864 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221221256 //comes with b7fe4864*/
mov edi, dword ptr [0xbfffef68]	       /* [ORIGINAL_SLICE] b7fe4864  [SLICE_INFO] #src_memreg[bfffef68:1:4,5:0:4] #mem_value 11035190, reg_value 3221221256*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef6c)  //come with b7fe4867 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221221256 //comes with b7fe4867*/
mov ecx, dword ptr [0xbfffef6c]	       /* [ORIGINAL_SLICE] b7fe4867  [SLICE_INFO] #src_memreg[bfffef6c:1:4,5:0:4] #mem_value 0, reg_value 3221221256*/
mov edx, 0  /* [SLICE_EXTRA]//comes with b7fe489c*/
xor edx, ecx	       /* [ORIGINAL_SLICE] b7fe489c  [SLICE_INFO] #src_regreg[8:0:4,9:1:4] #dst_reg_value 0, src_reg_value 0*/
mov eax, 0  /* [SLICE_EXTRA]//comes with b7fe489e*/
xor eax, edi	       /* [ORIGINAL_SLICE] b7fe489e  [SLICE_INFO] #src_regreg[10:0:4,3:1:4] #dst_reg_value 0, src_reg_value 11035190*/
or edx, eax	       /* [ORIGINAL_SLICE] b7fe48a0  [SLICE_INFO] #src_regreg[8:1:4,10:1:4] #dst_reg_value 0, src_reg_value 11035190*/
mov edx, 0  /* [SLICE_EXTRA]//comes with b7fe489c*/
xor edx, ecx	       /* [ORIGINAL_SLICE] b7fe489c  [SLICE_INFO] #src_regreg[8:0:4,9:1:4] #dst_reg_value 0, src_reg_value 0*/
mov eax, 0  /* [SLICE_EXTRA]//comes with b7fe489e*/
xor eax, edi	       /* [ORIGINAL_SLICE] b7fe489e  [SLICE_INFO] #src_regreg[10:0:4,3:1:4] #dst_reg_value 0, src_reg_value 11035190*/
or edx, eax	       /* [ORIGINAL_SLICE] b7fe48a0  [SLICE_INFO] #src_regreg[8:1:4,10:1:4] #dst_reg_value 0, src_reg_value 11035190*/
mov edx, 0  /* [SLICE_EXTRA]//comes with b7fe489c*/
xor edx, ecx	       /* [ORIGINAL_SLICE] b7fe489c  [SLICE_INFO] #src_regreg[8:0:4,9:1:4] #dst_reg_value 0, src_reg_value 0*/
mov eax, 0  /* [SLICE_EXTRA]//comes with b7fe489e*/
xor eax, edi	       /* [ORIGINAL_SLICE] b7fe489e  [SLICE_INFO] #src_regreg[10:0:4,3:1:4] #dst_reg_value 0, src_reg_value 11035190*/
or edx, eax	       /* [ORIGINAL_SLICE] b7fe48a0  [SLICE_INFO] #src_regreg[8:1:4,10:1:4] #dst_reg_value 0, src_reg_value 11035190*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffee74)  //come with b7fe95e1 (move upwards)*/
mov  dword ptr [0xbfffee74], edi	       /* [ORIGINAL_SLICE] b7fe95e1  [SLICE_INFO] push instruction (rewrite) #src_reg[3:1:4], dst_mem[bfffee74:0:4] #src_reg_value 11035190, dst_mem_value 3086965498*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffee74)  //come with b7fe9804 (move upwards)*/
mov edi	,  dword ptr [0xbfffee74]       /* [ORIGINAL_SLICE] b7fe9804  [SLICE_INFO] pop instruction(rewrite) #src_mem[bfffee74:1:4] #src_mem_value 11035190*/
call close_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef68)  //come with b7fe5104 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221221256 //comes with b7fe5104*/
mov eax, dword ptr [0xbfffef68]	       /* [ORIGINAL_SLICE] b7fe5104  [SLICE_INFO] #src_memreg[bfffef68:1:4,5:0:4] #mem_value 11035190, reg_value 3221221256*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef6c)  //come with b7fe510d (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221221256 //comes with b7fe510d*/
mov edx, dword ptr [0xbfffef6c]	       /* [ORIGINAL_SLICE] b7fe510d  [SLICE_INFO] #src_memreg[bfffef6c:1:4,5:0:4] #mem_value 0, reg_value 3221221256*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7fdde98)  //come with b7fe5112 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086867640 //comes with b7fe5112*/
mov dword ptr [0xb7fdde98], eax	       /* [ORIGINAL_SLICE] b7fe5112  [SLICE_INFO] #src_regreg[10:1:4,3:0:4] #dst_reg_value 11035190, src_reg_value 3086867640*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7fdde9c)  //come with b7fe5118 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086867640 //comes with b7fe5118*/
mov dword ptr [0xb7fdde9c], edx	       /* [ORIGINAL_SLICE] b7fe5118  [SLICE_INFO] #src_regreg[8:1:4,3:0:4] #dst_reg_value 0, src_reg_value 3086867640*/
mov eax, 20    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
int 0x80    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO]*/
mov ecx, eax	       /* [ORIGINAL_SLICE] b7eeff20  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 15216*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e41728)  //come with b7eeff24 (move upwards)*/
mov dword ptr [0xb7e41728], ecx	       /* [ORIGINAL_SLICE] b7eeff24  [SLICE_INFO] #src_reg[9:1:4], dst_mem[b7e41728:0:4] #src_reg_value 15216, dst_mem_value 0*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7eeff2b  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15216*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4c8)  //come with 80484ae (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484ae*/
mov dword ptr [0xbffff4c8], eax	       /* [ORIGINAL_SLICE] 80484ae  [SLICE_INFO] #src_regreg[10:1:4,6:0:4] #dst_reg_value 15216, src_reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4c8)  //come with 80484b2 (move upwards)*/
cmp dword ptr [0xbffff4c8], 0x0	       /* [ORIGINAL_SLICE] 80484b2  [SLICE_INFO] #src_mem[bffff4c8:1:4] #src_mem_value 15216*/
js jump_diverge       /* [ORIGINAL_SLICE] 80484b7  [SLICE_INFO] #src_flag[10:1:4] #branch_taken 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4c8)  //come with 80484c7 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484c7*/
mov eax, dword ptr [0xbffff4c8]	       /* [ORIGINAL_SLICE] 80484c7  [SLICE_INFO] #src_memreg[bffff4c8:1:4,6:0:4] #mem_value 15216, reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4b4)  //come with 80484cb (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484cb*/
mov dword ptr [0xbffff4b4], eax	       /* [ORIGINAL_SLICE] 80484cb  [SLICE_INFO] #src_regreg[10:1:4,6:0:4] #dst_reg_value 15216, src_reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4a0)  //come with b7ff2970 (move upwards)*/
mov  dword ptr [0xbffff4a0], eax	       /* [ORIGINAL_SLICE] b7ff2970  [SLICE_INFO] push instruction (rewrite) #src_reg[10:1:4], dst_mem[bffff4a0:0:4] #src_reg_value 15216, dst_mem_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff49c)  //come with b7ff2971 (move upwards)*/
mov  dword ptr [0xbffff49c], ecx	       /* [ORIGINAL_SLICE] b7ff2971  [SLICE_INFO] push instruction (rewrite) #src_reg[9:1:4], dst_mem[bffff49c:0:4] #src_reg_value 15216, dst_mem_value 3221222616*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff49c)  //come with b7ff2981 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222556 //comes with b7ff2981*/
mov ecx, dword ptr [0xbffff49c]	       /* [ORIGINAL_SLICE] b7ff2981  [SLICE_INFO] #src_memreg[bffff49c:1:4,6:0:4] #mem_value 15216, reg_value 3221222556*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4a0)  //come with b7ff2987 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222556 //comes with b7ff2987*/
mov eax, dword ptr [0xbffff4a0]	       /* [ORIGINAL_SLICE] b7ff2987  [SLICE_INFO] #src_memreg[bffff4a0:1:4,6:0:4] #mem_value 15216, reg_value 3221222556*/
call fstat64_recheck    /* [ORIGINAL_SLICE] 00000000  [SLICE_INFO] 0xbfffee70 */
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4b4)  //come with b7e861b6 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 3221222580 //comes with b7e861b6*/
mov eax, dword ptr [0xbffff4b4]	       /* [ORIGINAL_SLICE] b7e861b6  [SLICE_INFO] #src_memreg[bffff4b4:1:4,10:0:4] #mem_value 15216, reg_value 3221222580*/
mov ecx, eax	       /* [ORIGINAL_SLICE] b7e86164  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 15216*/
mov edx, eax	       /* [ORIGINAL_SLICE] b7e86166  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 15216*/
shr ecx, 0x1f	       /* [ORIGINAL_SLICE] b7e86168  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15216*/
neg edx	       /* [ORIGINAL_SLICE] b7e8616b  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 15216*/
test ecx, ecx	       /* [ORIGINAL_SLICE] b7e8616d  [SLICE_INFO] #src_regreg[9:1:4,9:1:4] #dst_reg_value 0, src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd4)  //come with b7e86172 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221222536 //comes with b7e86172*/
mov dword ptr [0xbfffefd4], ecx	       /* [ORIGINAL_SLICE] b7e86172  [SLICE_INFO] #src_regreg[9:1:4,5:0:4] #dst_reg_value 0, src_reg_value 3221222536*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e86178 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221222536 //comes with b7e86178*/
mov dword ptr [0xbfffefe4], eax	       /* [ORIGINAL_SLICE] b7e86178  [SLICE_INFO] #src_regreg[10:1:4,5:0:4] #dst_reg_value 15216, src_reg_value 3221222536*/
xor eax, eax	       /* [ORIGINAL_SLICE] b7e849cf  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 15216, src_reg_value 15216*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e849ed (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221222536 //comes with b7e849ed*/
mov eax, dword ptr [0xbfffefe4]	       /* [ORIGINAL_SLICE] b7e849ed  [SLICE_INFO] #src_memreg[bfffefe4:1:4,5:0:4] #mem_value 15216, reg_value 3221222536*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef70)  //come with b7e849f3 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221221232 //comes with b7e849f3*/
mov dword ptr [0xbfffef70], eax	       /* [ORIGINAL_SLICE] b7e849f3  [SLICE_INFO] #src_regreg[10:1:4,6:0:4] #dst_reg_value 15216, src_reg_value 3221221232*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef70)  //come with b7e81ad7 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221221212 //comes with b7e81ad7*/
mov ecx, dword ptr [0xbfffef70]	       /* [ORIGINAL_SLICE] b7e81ad7  [SLICE_INFO] #src_memreg[bfffef70:1:4,6:0:4] #mem_value 15216, reg_value 3221221212*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15216*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 15216, src_reg_value 4294952080, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 12172*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1521, src_reg_value 1521*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 7605, src_reg_value 7605*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 15216, src_reg_value 15210*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1521, src_reg_value 1521*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be46*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 6 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be46:0:1,9:1:4] #reg_value 3086532160, mem_value 54, reg_value 6*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 1521*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46f)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222511 //comes with b7e81b71*/
mov byte ptr [0xbffff46f], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 54, src_reg_value 3221222511*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 1521*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 1521, src_reg_value 1521, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 1216*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 152, src_reg_value 152*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 760, src_reg_value 760*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 1521, src_reg_value 1520*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 152, src_reg_value 152*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be41*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 1 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be41:0:1,9:1:4] #reg_value 3086532160, mem_value 49, reg_value 1*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 152*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46e)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222510 //comes with b7e81b71*/
mov byte ptr [0xbffff46e], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 49, src_reg_value 3221222510*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 152*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 152, src_reg_value 152, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 121*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 15, src_reg_value 15*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 75, src_reg_value 75*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 152, src_reg_value 150*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 15, src_reg_value 15*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be42*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 2 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be42:0:1,9:1:4] #reg_value 3086532160, mem_value 50, reg_value 2*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 15*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46d)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222509 //comes with b7e81b71*/
mov byte ptr [0xbffff46d], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 50, src_reg_value 3221222509*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 15, src_reg_value 15, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 12*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1, src_reg_value 1*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 5, src_reg_value 5*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 15, src_reg_value 10*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1, src_reg_value 1*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be45*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 5 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be45:0:1,9:1:4] #reg_value 3086532160, mem_value 53, reg_value 5*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46c)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222508 //comes with b7e81b71*/
mov byte ptr [0xbffff46c], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 53, src_reg_value 3221222508*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 1*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 1, src_reg_value 1, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 0*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 0, src_reg_value 0*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 0, src_reg_value 0*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 1, src_reg_value 0*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 0, src_reg_value 0*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be41*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 1 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be41:0:1,9:1:4] #reg_value 3086532160, mem_value 49, reg_value 1*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46b)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7e81b71*/
mov byte ptr [0xbffff46b], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 49, src_reg_value 3221222507*/
jnz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e83a9d (move upwards)*/
cmp dword ptr [0xbfffefe4], 0x0	       /* [ORIGINAL_SLICE] b7e83a9d  [SLICE_INFO] #src_mem[bfffefe4:1:4] #src_mem_value 15216*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e83aa4  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
xor edx, edx	       /* [ORIGINAL_SLICE] b7e83ad1  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 0, src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e83b0d (move upwards)*/
cmp dword ptr [0xbfffefe4], 0x0	       /* [ORIGINAL_SLICE] b7e83b0d  [SLICE_INFO] #src_mem[bfffefe4:1:4] #src_mem_value 15216*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e83b1a  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd4)  //come with b7e83b45 (move upwards)*/
mov eax, 0  /* [SLICE_EXTRA]//comes with b7e83b45*/
or eax, dword ptr [0xbfffefd4]	       /* [ORIGINAL_SLICE] b7e83b45  [SLICE_INFO] #src_memreg[bfffefd4:1:4,10:0:4] #mem_value 0, reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd8)  //come with b7e83b4b (move upwards)*/
mov  dword ptr [0xbfffefd8]	    , 0   /* [SLICE_EXTRA]//comes with b7e83b4b*/
or eax, dword ptr [0xbfffefd8]	       /* [ORIGINAL_SLICE] b7e83b4b  [SLICE_INFO] #src_memreg[bfffefd8:0:4,10:1:4] #mem_value 0, reg_value 0*/
cmp eax, 0x1	       /* [ORIGINAL_SLICE] b7e83b51  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd4)  //come with b7e83b68 (move upwards)*/
cmp dword ptr [0xbfffefd4], 0x0	       /* [ORIGINAL_SLICE] b7e83b68  [SLICE_INFO] #src_mem[bfffefd4:1:4] #src_mem_value 0*/
jnz jump_diverge       /* [ORIGINAL_SLICE] b7e83b6f  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e83ba1 (move upwards)*/
cmp dword ptr [0xbfffefe4], 0x0	       /* [ORIGINAL_SLICE] b7e83ba1  [SLICE_INFO] #src_mem[bfffefe4:1:4] #src_mem_value 15216*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e83ba8  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46f)  //come with b7eadbf8 (move upwards)*/
cmp byte ptr [0xbffff46f], 0xa	       /* [ORIGINAL_SLICE] b7eadbf8  [SLICE_INFO] #src_mem[bffff46f:1:1] #src_mem_value 54*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadbff  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46e)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46e], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46e:1:1] #src_mem_value 49*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46d)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46d], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46d:1:1] #src_mem_value 50*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46c)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46c], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46c:1:1] #src_mem_value 53*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46b)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46b], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46b:1:1] #src_mem_value 49*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46b)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46b,1), 49  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46b]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46b:1:1,10:0:4] #reg_value 3221222507, mem_value 49, reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e40012)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172754 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 0 //comes with b7eadb3c*/
mov byte ptr [0xb7e40012], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 49, src_reg_value 3085172754, count_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46c)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46c,1), 53  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46c]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46c:1:1,10:0:4] #reg_value 3221222507, mem_value 53, reg_value 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e40013)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172754 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 1 //comes with b7eadb3c*/
mov byte ptr [0xb7e40013], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 53, src_reg_value 3085172754, count_reg_value 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46d)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46d,1), 50  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46d]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46d:1:1,10:0:4] #reg_value 3221222507, mem_value 50, reg_value 2*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e40014)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172754 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 2 //comes with b7eadb3c*/
mov byte ptr [0xb7e40014], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 50, src_reg_value 3085172754, count_reg_value 2*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46e)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46e,1), 49  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46e]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46e:1:1,10:0:4] #reg_value 3221222507, mem_value 49, reg_value 3*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e40015)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172754 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 3 //comes with b7eadb3c*/
mov byte ptr [0xb7e40015], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 49, src_reg_value 3085172754, count_reg_value 3*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46f)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46f,1), 54  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46f]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46f:1:1,10:0:4] #reg_value 3221222507, mem_value 54, reg_value 4*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e40016)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172754 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 4 //comes with b7eadb3c*/
mov byte ptr [0xb7e40016], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 54, src_reg_value 3085172754, count_reg_value 4*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4c8)  //come with 80484db (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484db*/
mov eax, dword ptr [0xbffff4c8]	       /* [ORIGINAL_SLICE] 80484db  [SLICE_INFO] #src_memreg[bffff4c8:1:4,6:0:4] #mem_value 15216, reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4cc)  //come with 80484df (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484df*/
mov dword ptr [0xbffff4cc], eax	       /* [ORIGINAL_SLICE] 80484df  [SLICE_INFO] #src_regreg[10:1:4,6:0:4] #dst_reg_value 15216, src_reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4cc)  //come with 80484e3 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484e3*/
mov eax, dword ptr [0xbffff4cc]	       /* [ORIGINAL_SLICE] 80484e3  [SLICE_INFO] #src_memreg[bffff4cc:1:4,6:0:4] #mem_value 15216, reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4b4)  //come with 80484e7 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221222576 //comes with 80484e7*/
mov dword ptr [0xbffff4b4], eax	       /* [ORIGINAL_SLICE] 80484e7  [SLICE_INFO] #src_regreg[10:1:4,6:0:4] #dst_reg_value 15216, src_reg_value 3221222576*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff4b4)  //come with b7e861b6 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 3221222580 //comes with b7e861b6*/
mov eax, dword ptr [0xbffff4b4]	       /* [ORIGINAL_SLICE] b7e861b6  [SLICE_INFO] #src_memreg[bffff4b4:1:4,10:0:4] #mem_value 15216, reg_value 3221222580*/
mov ecx, eax	       /* [ORIGINAL_SLICE] b7e86164  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 15216*/
mov edx, eax	       /* [ORIGINAL_SLICE] b7e86166  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 15216*/
shr ecx, 0x1f	       /* [ORIGINAL_SLICE] b7e86168  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15216*/
neg edx	       /* [ORIGINAL_SLICE] b7e8616b  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 15216*/
test ecx, ecx	       /* [ORIGINAL_SLICE] b7e8616d  [SLICE_INFO] #src_regreg[9:1:4,9:1:4] #dst_reg_value 0, src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd4)  //come with b7e86172 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221222536 //comes with b7e86172*/
mov dword ptr [0xbfffefd4], ecx	       /* [ORIGINAL_SLICE] b7e86172  [SLICE_INFO] #src_regreg[9:1:4,5:0:4] #dst_reg_value 0, src_reg_value 3221222536*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e86178 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221222536 //comes with b7e86178*/
mov dword ptr [0xbfffefe4], eax	       /* [ORIGINAL_SLICE] b7e86178  [SLICE_INFO] #src_regreg[10:1:4,5:0:4] #dst_reg_value 15216, src_reg_value 3221222536*/
xor eax, eax	       /* [ORIGINAL_SLICE] b7e849cf  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 15216, src_reg_value 15216*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e849ed (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(5,4), 3221222536 //comes with b7e849ed*/
mov eax, dword ptr [0xbfffefe4]	       /* [ORIGINAL_SLICE] b7e849ed  [SLICE_INFO] #src_memreg[bfffefe4:1:4,5:0:4] #mem_value 15216, reg_value 3221222536*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef70)  //come with b7e849f3 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221221232 //comes with b7e849f3*/
mov dword ptr [0xbfffef70], eax	       /* [ORIGINAL_SLICE] b7e849f3  [SLICE_INFO] #src_regreg[10:1:4,6:0:4] #dst_reg_value 15216, src_reg_value 3221221232*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffef70)  //come with b7e81ad7 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(6,4), 3221221212 //comes with b7e81ad7*/
mov ecx, dword ptr [0xbfffef70]	       /* [ORIGINAL_SLICE] b7e81ad7  [SLICE_INFO] #src_memreg[bfffef70:1:4,6:0:4] #mem_value 15216, reg_value 3221221212*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15216*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 15216, src_reg_value 4294952080, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 12172*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1521, src_reg_value 1521*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 7605, src_reg_value 7605*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 15216, src_reg_value 15210*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1521, src_reg_value 1521*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be46*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 6 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be46:0:1,9:1:4] #reg_value 3086532160, mem_value 54, reg_value 6*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 1521*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46f)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222511 //comes with b7e81b71*/
mov byte ptr [0xbffff46f], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 54, src_reg_value 3221222511*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 1521*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 1521, src_reg_value 1521, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 1216*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 152, src_reg_value 152*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 760, src_reg_value 760*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 1521, src_reg_value 1520*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 152, src_reg_value 152*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be41*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 1 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be41:0:1,9:1:4] #reg_value 3086532160, mem_value 49, reg_value 1*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 152*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46e)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222510 //comes with b7e81b71*/
mov byte ptr [0xbffff46e], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 49, src_reg_value 3221222510*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 152*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 152, src_reg_value 152, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 121*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 15, src_reg_value 15*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 75, src_reg_value 75*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 152, src_reg_value 150*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 15, src_reg_value 15*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be42*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 2 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be42:0:1,9:1:4] #reg_value 3086532160, mem_value 50, reg_value 2*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 15*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46d)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222509 //comes with b7e81b71*/
mov byte ptr [0xbffff46d], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 50, src_reg_value 3221222509*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 15*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 15, src_reg_value 15, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 12*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1, src_reg_value 1*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 5, src_reg_value 5*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 15, src_reg_value 10*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 1, src_reg_value 1*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be45*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 5 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be45:0:1,9:1:4] #reg_value 3086532160, mem_value 53, reg_value 5*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46c)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222508 //comes with b7e81b71*/
mov byte ptr [0xbffff46c], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 53, src_reg_value 3221222508*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
mov eax, ecx	       /* [ORIGINAL_SLICE] b7e81b58  [SLICE_INFO] #src_reg[9:1:4] #src_reg_value 1*/
mov ebp, 3435973837  /* [SLICE_EXTRA]//comes with b7e81b5d*/
mul ebp	       /* [ORIGINAL_SLICE] b7e81b5d  [SLICE_INFO] #src_regregreg[10:1:4,8:1:4,5:0:4] #dst_reg_value 1, src_reg_value 1, count_reg_value 3435973837*/
shr edx, 0x3	       /* [ORIGINAL_SLICE] b7e81b5f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 0*/
lea eax, [edx+edx*4]	       /* [ORIGINAL_SLICE] b7e81b62  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 0, src_reg_value 0*/
add eax, eax	       /* [ORIGINAL_SLICE] b7e81b65  [SLICE_INFO] #src_regreg[10:1:4,10:1:4] #dst_reg_value 0, src_reg_value 0*/
sub ecx, eax	       /* [ORIGINAL_SLICE] b7e81b67  [SLICE_INFO] #src_regreg[9:1:4,10:1:4] #dst_reg_value 1, src_reg_value 0*/
test edx, edx	       /* [ORIGINAL_SLICE] b7e81b69  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 0, src_reg_value 0*/
/*[SLICE_VERIFICATION] $reg(9,4) is tainted //comes with b7e81b6b (move upwards), address b7f8be41*/
mov edi, 0xb7f8be40  /* [SLICE_ADDRESSING]//comes with b7e81b6b (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(3,4), 3086532160 //comes with b7e81b6b*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(9,4), 1 //comes with b7e81b6b*/
movzx eax, byte ptr [edi+ecx*1]	       /* [ORIGINAL_SLICE] b7e81b6b  [SLICE_INFO] #src_regmemreg[3:0:4,b7f8be41:0:1,9:1:4] #reg_value 3086532160, mem_value 49, reg_value 1*/
mov ecx, edx	       /* [ORIGINAL_SLICE] b7e81b6f  [SLICE_INFO] #src_reg[8:1:4] #src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46b)  //come with b7e81b71 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7e81b71*/
mov byte ptr [0xbffff46b], al	       /* [ORIGINAL_SLICE] b7e81b71  [SLICE_INFO] #src_regreg[10:1:1,4:0:4] #dst_reg_value 49, src_reg_value 3221222507*/
jnz jump_diverge       /* [ORIGINAL_SLICE] b7e81b73  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e83a9d (move upwards)*/
cmp dword ptr [0xbfffefe4], 0x0	       /* [ORIGINAL_SLICE] b7e83a9d  [SLICE_INFO] #src_mem[bfffefe4:1:4] #src_mem_value 15216*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e83aa4  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
xor edx, edx	       /* [ORIGINAL_SLICE] b7e83ad1  [SLICE_INFO] #src_regreg[8:1:4,8:1:4] #dst_reg_value 0, src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e83b0d (move upwards)*/
cmp dword ptr [0xbfffefe4], 0x0	       /* [ORIGINAL_SLICE] b7e83b0d  [SLICE_INFO] #src_mem[bfffefe4:1:4] #src_mem_value 15216*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e83b1a  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd4)  //come with b7e83b45 (move upwards)*/
mov eax, 0  /* [SLICE_EXTRA]//comes with b7e83b45*/
or eax, dword ptr [0xbfffefd4]	       /* [ORIGINAL_SLICE] b7e83b45  [SLICE_INFO] #src_memreg[bfffefd4:1:4,10:0:4] #mem_value 0, reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd8)  //come with b7e83b4b (move upwards)*/
mov  dword ptr [0xbfffefd8]	    , 0   /* [SLICE_EXTRA]//comes with b7e83b4b*/
or eax, dword ptr [0xbfffefd8]	       /* [ORIGINAL_SLICE] b7e83b4b  [SLICE_INFO] #src_memreg[bfffefd8:0:4,10:1:4] #mem_value 0, reg_value 0*/
cmp eax, 0x1	       /* [ORIGINAL_SLICE] b7e83b51  [SLICE_INFO] #src_reg[10:1:4] #src_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefd4)  //come with b7e83b68 (move upwards)*/
cmp dword ptr [0xbfffefd4], 0x0	       /* [ORIGINAL_SLICE] b7e83b68  [SLICE_INFO] #src_mem[bfffefd4:1:4] #src_mem_value 0*/
jnz jump_diverge       /* [ORIGINAL_SLICE] b7e83b6f  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbfffefe4)  //come with b7e83ba1 (move upwards)*/
cmp dword ptr [0xbfffefe4], 0x0	       /* [ORIGINAL_SLICE] b7e83ba1  [SLICE_INFO] #src_mem[bfffefe4:1:4] #src_mem_value 15216*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7e83ba8  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46f)  //come with b7eadbf8 (move upwards)*/
cmp byte ptr [0xbffff46f], 0xa	       /* [ORIGINAL_SLICE] b7eadbf8  [SLICE_INFO] #src_mem[bffff46f:1:1] #src_mem_value 54*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadbff  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46e)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46e], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46e:1:1] #src_mem_value 49*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46d)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46d], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46d:1:1] #src_mem_value 50*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46c)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46c], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46c:1:1] #src_mem_value 53*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46b)  //come with b7eadc0b (move upwards)*/
cmp byte ptr [0xbffff46b], 0xa	       /* [ORIGINAL_SLICE] b7eadc0b  [SLICE_INFO] #src_mem[bffff46b:1:1] #src_mem_value 49*/
jz jump_diverge       /* [ORIGINAL_SLICE] b7eadc0e  [SLICE_INFO] #src_flag[8:1:4] #branch_taken 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46b)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46b,1), 49  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46b]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46b:1:1,10:0:4] #reg_value 3221222507, mem_value 49, reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e4000c)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172748 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 0 //comes with b7eadb3c*/
mov byte ptr [0xb7e4000c], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 49, src_reg_value 3085172748, count_reg_value 0*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46c)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46c,1), 53  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46c]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46c:1:1,10:0:4] #reg_value 3221222507, mem_value 53, reg_value 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e4000d)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172748 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 1 //comes with b7eadb3c*/
mov byte ptr [0xb7e4000d], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 53, src_reg_value 3085172748, count_reg_value 1*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46d)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46d,1), 50  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46d]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46d:1:1,10:0:4] #reg_value 3221222507, mem_value 50, reg_value 2*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e4000e)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172748 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 2 //comes with b7eadb3c*/
mov byte ptr [0xb7e4000e], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 50, src_reg_value 3085172748, count_reg_value 2*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46e)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46e,1), 49  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46e]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46e:1:1,10:0:4] #reg_value 3221222507, mem_value 49, reg_value 3*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e4000f)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172748 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 3 //comes with b7eadb3c*/
mov byte ptr [0xb7e4000f], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 49, src_reg_value 3085172748, count_reg_value 3*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xbffff46f)  //come with b7eadb38 (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(4,4), 3221222507 //comes with b7eadb38*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $addr(bffff46f,1), 54  //comes with b7eadb38*/
movzx ecx, byte ptr [0xbffff46f]	       /* [ORIGINAL_SLICE] b7eadb38  [SLICE_INFO] #src_regmemreg[4:0:4,bffff46f:1:1,10:0:4] #reg_value 3221222507, mem_value 54, reg_value 4*/
/*Eliminated [SLICE_ADDRESSING] immediate_address $addr(0xb7e40010)  //come with b7eadb3c (move upwards)*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(8,4), 3085172748 //comes with b7eadb3c*/
/*Eliminated SLICE_EXTRA[SLICE_EXTRA] mov $reg(10,4), 4 //comes with b7eadb3c*/
mov byte ptr [0xb7e40010], cl	       /* [ORIGINAL_SLICE] b7eadb3c  [SLICE_INFO] #src_regregreg[9:1:1,8:0:4,10:0:4] #dst_reg_value 54, src_reg_value 3085172748, count_reg_value 4*/
/* restoring address and registers */
/* slice finishes and return to kernel */
mov ebx, 1
mov eax, 350
int 0x80
/* function that handles jump divergence */
jump_diverge:
push eax
push ecx
push edx
call handle_jump_diverge
push edx
push ecx
push eax
