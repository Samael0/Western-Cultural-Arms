	.data
str1:	.asciz	"Lost Generation:        %d\n"
str2:	.asciz	"Greatest Generation:    %d\n"
str3:	.asciz	"Baby Boomer Generation: %d\n"
str4:	.asciz	"Generation X:           %d\n"
str5:	.asciz	"Generation Y:           %d\n"
str6:	.asciz	"Generation Z:           %d\n"
str7:	.asciz	"Not Applicable:         %d\n"
ary:	.word	100,40,5,65,78
	.equ	arysize,(. - ary)/4

	.text
	.global main

main:	stmfd	sp!,{lr}
	ldr	r1,=ary
	ldr	r2,=arysize
	mov	r5,#0
	mov	r6,#0
	mov	r10,#0
	mov	r0,#0

read:	cmp	r0,r2
	beq	prtlg
	ldr	r3,[r1]
	add	r1,#4
	add	r0,r0,#1
	b	lg

lg:	cmp	r3,#127
	ble	lg2
	add	r5,r5,#1
	b	read

lg2:	cmp	r3,#102
	blt	gg
	add	r6,r6,#1
	b	read

gg:	cmp	r3,#101
	ble	gg2		

gg2:	cmp	r3,#93
	blt	bb
	add	r7,r7,#1
	b	read

bb:	cmp	r3,#71
	ble	bb2

bb2:	cmp	r3,#53
	blt	gx
	add	r8,r8,#1
	b	read

gx:	cmp	r3,#52
	ble	gx2

gx2:	cmp	r3,#38
	blt	gy
	add	r9,r9,#1
	b	read

gy:	cmp	r3,#36
	ble	gy2

gy2:	cmp	r3,#22
	blt	gz
	add	r10,r10,#1
	b	read

gz:	cmp	r3,#21
	ble	gz2

gz2:	cmp	r3,#7
	blt	na
	add	r11,r11,#1
	b	read

na:	add	r5,r5,#1
	b	read

prtlg:	cmp	r6,#0
	beq	prtgg
	@print for lost generation code here
	ldr	r0,=str1
	mov	r1,r6
	bl	printf
	@end
	b	prtgg

prtgg:	cmp	r7,#0
	beq	prtbb
	@print for greatest gebereation code here
	ldr	r0,=str2
	mov	r1,r7
	bl	printf
	@end
	b	prtbb

prtbb:	cmp	r8,#0
	beq	prtgx
	@print for baby boomer code here
	ldr	r0,=str3
	mov	r1,r8
	bl	printf
	@end
	b	prtgx

prtgx:	cmp	r9,#0
	beq	prtgy
	@print for generation X code here
	ldr	r0,=str4
	mov	r1,r9
	bl	printf
	@end
	b	prtgy

prtgy:	cmp	r10,#0
	beq	prtgz
	@print for generation Y code here
	ldr	r0,=str5
	mov	r1,r10
	bl	printf
	@end
	b	prtgz

prtgz:	cmp	r11,#0
	beq	prtna
	@print for generation Z code here
	ldr	r0,=str6
	mov	r1,r11
	bl	printf
	@end
	b	prtna

prtna:	cmp	r5,#0
	beq	end
	@print for not applicable code here
	ldr	r0,=str7
	mov	r1,r5
	bl	printf
	@end
	b	end

end:	ldmfd	sp!,{lr}
	mov	pc,lr
	.end
