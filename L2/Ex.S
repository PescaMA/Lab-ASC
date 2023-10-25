.data
x: .word 0xA00
y: .word 0xA
pass: .asciz "PASS"
fail: .asciz "FAIL"
.text

.global main
main:

v1:
shrw $4, x
shlw $4, y
xor %eax,%eax
mov $y,%ax
cmpw x,%ax
je output
addw $x, y
jmp exit 

output:
mov $4, %eax
mov $1, %ebx

pass_et:
mov $pass, %ecx
mov $5, %edx
int $0x80

exit:
mov $1,%eax
mov $0, %ebx
int $0x80
