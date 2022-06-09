%include "io.mac"
.UDATA
	inStr resb 20	;Input
	toCont resb 1			
.DATA
	encrNum  db "5791368024"	;0 gets encrypted as 5, 1 as 7, so on
.CODE
	.STARTUP
continue:
	GetStr inStr	;Get the input
	mov EDX, inStr	;Store address in register for easier access and manipulation
encryption:
	mov AL, [EDX]	;We are going to manipulate the value of the current string character so that we can use xlat
	cmp AL, 0	;If null character, input string has ended, so jump out of string traversal loop
	je encrypted
	xor AL, 48	;Converts ASCII value of characters 0-9 to integers 0-9, while also affecting a few other characters, which we will test in the next line to ensure only 0-9 are encrypted
	cmp AL, 9
	jg increment	;Not from 0-9, so move to next character of string
	mov EBX, encrNum	;For xlat, which is performed in the next line
	xlatb
	mov [EDX], AL	;Store the encrypted character back into the string
increment:
	inc EDX
	jmp encryption	;Next iteration of string traversal loop
encrypted:
	PutStr inStr	;Encryption done, so print encrypted string
	nwln
	GetStr toCont	;Does user want to continue?
	mov EDX, [toCont]	;Store their input character in register
	or EDX, 32	;If they entered Y, this would convert it to y
	cmp EDX, 121	;121 is ASCII of y, so they would like to continue, so jump and take string input again, else exit
	je continue
.EXIT

