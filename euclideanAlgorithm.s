.data  
num_1:
	.long 1071
num_2:
	.long 462
result:
	.long 0

printf_format:
        .string "%d\n"     

.text                        
 
.globl  main                  

.type   main, @function       
 
 
main:
cmpl  $0, (num_2)        
je   loop_end 
loop_start:
  xor %eax , %eax 
  xor %edx , %edx 
  
  movl (num_1), %eax
  divl (num_2)
 
 
  movl (num_2), %eax
  movl %eax, (num_1)

  movl %edx, (num_2)
  
  cmpl  $0, (num_2)  
  jne   loop_start   

loop_end:  
  pushl (num_1)
  pushl $printf_format
  call  printf


  
  
  movl $1, %eax 
  movl $0, %ebx 
  int     $0x80
  
  
   