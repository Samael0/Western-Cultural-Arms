	.data
str1:	.asciz	"Lost Generation: %d"
str2:	.asciz	"Greatest Generation: %d"
str3:	.asciz	"Baby Boomer Generation: %d"
str4:	.asciz	"Generation X: %d"
str5:	.asciz	"Generation Y: %d"
str6:	.asciz	"Generation Z: %d"
str7:	.asciz	"Not Applicable: %d"
ary:	.word	105

	.text
	.global main

main:	stmfd	sp!,{lr}

LG:	

end:	ldmfd	sp!,{lr}
	mov	pc,lr
