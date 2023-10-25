.data
x: .word 2
y: .word 4

.text

.global main
main:
add $1,x

exit:
mov $1,%eax
mov $0, %ebx
int $0x80
