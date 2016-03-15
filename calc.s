.data  
num_1:
	.long 2
num_2:
	.long 5
num_3:
	.long 3
num_4:
	.long 8
num_5:
	.long 6
res_1:
	.long 0
res_2:
	.long 0
res_3:
	.long 0
result:
	.long 0

printf_format:
        .string "%d\n"     

.text                        
 
.globl  main                  

.type   main, @function       
 
 
main:
  movl  (num_4), %eax
  movl  (num_5), %ebx
  sub %ebx, %eax
  movl %eax, (res_1)
  
  pushl (res_1)
  pushl $printf_format
  call  printf
  
  
  movl  (num_1), %eax
  movl  (num_2), %ebx
  mull  %ebx  
  movl %eax, (res_2)
  
  pushl (res_2)
  pushl $printf_format
  call  printf
  
  
  movl  (num_3), %eax
  movl  (res_1), %ebx
  mull  %ebx  
  movl %eax, (res_3)
  
  pushl (res_3)
  pushl $printf_format
  call  printf
  
  movl  (res_2), %eax
  movl  (res_3), %ebx
  sub %ebx, %eax
  movl %eax, (result)
  
  pushl (result)
  pushl $printf_format
  call  printf
  movl $1, %eax /* номер системного вызова exit - 1 */
  movl $0, %ebx /* передать 0 как значение параметра */
  int     $0x80
   