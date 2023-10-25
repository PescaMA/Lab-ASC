.data
x: .word 0x2A00
y: .word 0xA
pass: .asciz "PASS\n"
fail: .asciz "FAIL\n"
.text

.global main

main:
shrw $4, x
shlw $4, y
xor %eax,%eax
mov y,%ax
cmpw x,%ax
je pass_et
movw y, %ax
addw x, %ax
movw y, %ax
jmp fail_et

pass_et:
mov $4, %eax
mov $1, %ebx
mov $pass, %ecx
mov $5, %edx
int $0x80
jmp exit

fail_et:
mov $4, %eax
mov $1, %ebx
mov $fail, %ecx
mov $5, %edx
int $0x80
jmp exit

exit:
mov $1,%eax
mov $0, %ebx
int $0x80
