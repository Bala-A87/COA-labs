%include "io.mac"
.UDATA
	num resd 1			;The number of values to sum
.CODE
	.STARTUP
	GetLInt ECX			;ECX is the loop counter, holds the number of values to sum
	mov [num], ECX		;Store the number to access later when printing. Since num is reserved as memory address, indirect addressing mode is used
	xor EDX, EDX		;Set EDX, which we choose to hold the sum, = 0 
sumloop:				;Begin loop
	GetLInt EAX			;Get next input value to add to sum
	add EDX, EAX		;Add the value to the sum
	loop sumloop
	PutLInt [num]		;Get the saved value in num and print as the first output
	nwln
	PutLInt EDX			;Print the sum, the second output
	nwln
.EXIT

