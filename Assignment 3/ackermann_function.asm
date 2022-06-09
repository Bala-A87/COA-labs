%include "io.mac"
.DATA
	mInput db "Enter the value for m ", 0
	nInput db "Enter the value for n ", 0
	output_msg db "The value of Ackermann's function is ", 0
.CODE
	.STARTUP
	PutStr mInput
	GetLInt EBX	;Value of m stored
	PutStr nInput
	GetLInt EDX	;Value of n stored
	push EBX
	push EDX	;Push into stack since they are parameters to the function
	call Ackermann_fn
	PutStr output_msg
	PutLInt EAX	;Get return/function value from EAX and print
	nwln
.EXIT	;End of main
Ackermann_fn:
	enter 0, 0	;No local variables needed
	mov EDX, [EBP + 12]	;Check if m = 0 (case 1, line 39-42)
	cmp EDX, 0
	je case_1
	mov EDX, [EBP + 8]	;Check if n = 0 (case 2, line 43-50)
	cmp EDX, 0
	je case_2
	mov EDX, [EBP + 12]	;Case 3: Both m and n are positive (assuming that inputs taken are non-negative)
	push EDX	;Calculate A(m+1, n) first, where m+1 is in EDX now, so push as parameter
	mov EDX, [EBP + 8]	;Get n+1 from stack, decrement it to n, and push as parameter
	dec EDX
	push EDX
	call Ackermann_fn	;Calling Ackermann's function with parameters m+1, n
	mov EDX, [EBP + 12]	;Get m+1 from stack, decrement to get m, push
	dec EDX
	push EDX
	push EAX	;Second parameter is A(m+1, n) which is returned by previous call into EAX
	call Ackermann_fn	;Call Ackermann's function with parameters m, A(m+1, n)
	jmp end_fn
case_1:
	mov EAX, [EBP + 8]	;Get n, add 1, as n+1 is the return value
	inc EAX
	jmp end_fn
case_2:
	mov EDX, [EBP + 12]	;Get m+1, decrement to get m, our first parameter to recursive call
	dec EDX
	mov EBX, 1	;Second parameter is just 1
	push EDX
	push EBX
	call Ackermann_fn	;Call Ackermann's function with parameters m, 1
	jmp end_fn
end_fn:
	leave
	ret	;return
