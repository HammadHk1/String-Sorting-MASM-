;##################;
; HAMMAD KHALID    ;
; i192177 CS-B     ;
; STRING SORTING   ;           
;##################;
.model small
.stack
.data
; ALL DATA ELEMENTS DECLARED IN DATA SEGMENT PORTION 
; FOR DISPLAYING MESSAGE WHERE NEEDED
MSG1 DB "ENTER NAME 1",10,13,'$'
MSG2 DB "ENTER NAME 2",10,13,'$'
MSG3 DB "ENTER NAME 3",10,13,'$'
MSG4 DB "-------------------------",10,13,'$'
; FOR GETTING INPUT FROM THE USER.....
str1 db 15 dup('$')
str2 db 15 dup('$')
str3 db 15 dup('$')
; STORING THE SUM OF SUM IN THESE VARIABLE....
sum1 dw 0
sum2 dW 0
sum3 dw 0
; COUNTER USED IN ADDITION OF ASCII AND THERE MULTIPLICATION ....
count db 1
count2 db 1
count3 db 1
; STORING THE LARGEST AND SMALLEST IN THERE RESPECTABLE VARIABLES...
largest dw 0
smaller dw 0
.code
start:
; CODE PORTION OF TASK 02
	mov ax,@data
	mov ds,ax   
	;TAKING INPUT FROM THE USER ...
	mov dx,offset MSG1
	mov ah,09h
	int 21h
    ;;;;;;;;;;;;;;;;;;;;;;;
    mov dx,offset str1
	mov ah,3fh
	int 21h
    ;;;;;;;;;;;;;;;;;;;;;;;
    mov dx,offset MSG2
	mov ah,09h
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;
	mov dx,offset str2
	mov ah,3fh
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;
	mov dx,offset MSG3
	mov ah,09h
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;
	mov dx,offset str3
	mov ah,3fh
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;
	mov dx,offset MSG4
	mov ah,09h
	int 21h
	;SETTING THE VALUES FOR RUNNING THE LOOP ...	
	mov bx,0
	mov dl,0Ah
	mov si,0
	mov di,0
	;JMPS TO MULTIPLY ASCII WITH ITS LOCATION THEN ADD IT ...
	; GETTING THE SUM OF STRING 1 .....
	Addition_of_str1:
		cmp [str1+si],dl  ;COMPARING VALUES TO BREAK THE LOOP AND MOVE NEXT WHERE DL CONTAINS 0A WHICH IS USED FOR NEXT LINE
		je Addition_of_str2
		mov aL,[str1+si]
        mov bl,count
        mul bl  	
        mov bx,ax
		add sum1,bx
		inc si
		inc count
		mov count2,1
	jmp Addition_of_str1 
	;GETTING THE SUM OF STRING 2 ....
    Addition_of_str2:
		cmp [str2+di],dl   ;COMPARING VALUES TO BREAK THE LOOP AND MOVE NEXT WHERE DL CONTAINS 0A WHICH IS USED FOR NEXT LINE
		je Addition_of_str3
		mov al,[str2+di]
        mov bl,count2
        mul bl             
        mov bx,ax
		add sum2,bx
		inc di
		inc count2
		mov si,0
	jmp Addition_of_str2
	;GETTING TAKING SUM OF STRING 3 ....
	Addition_of_str3:
		cmp [str3+si],dl   ;COMPARING VALUES TO BREAK THE LOOP AND MOVE NEXT WHERE DL CONTAINS 0A WHICH IS USED FOR NEXT LINE
		je Compare_string
		mov al,[str3+si]
        mov bl,count3                     
        mul bl              
        mov bx,ax
		add sum3,bx
		inc count3
		inc si
	jmp Addition_of_str3 	
	;NOW COMPARING THE VALUES TO GET LARGEST MIDDLE AND  SMALLEST VALUE OF THE STRING .....
	Compare_string:
		mov ax,sum1
		mov bx,sum2
		mov cx,sum3
		cmp ax,bx
		jbe check_and
		jmp check_else_if
		
	check_and:
		cmp ax,cx
		jbe Set_sum1_Smallest
		jmp check_else_if
		
	check_else_if:
		cmp bx,cx
		jbe Set_sum2_Smallest
		jmp Set_sum3_Smallest
		
	Set_sum1_Smallest:
		mov smaller,ax
		jmp Larger
	
    Set_sum2_Smallest:
	   mov smaller,bx
	   jmp Larger

    Set_sum3_Smallest:
		mov smaller,cx
		jmp Larger
		
	Larger:
	    mov ax,sum1
		mov bx,sum2
		mov cx,sum3
		cmp ax,bx
		jae check_and1
		jmp check_else_if1
		
	check_and1:
		cmp ax,cx
		jae Set_sum1_Largest
		jmp check_else_if1
		
	check_else_if1:
		cmp bx,cx
		jae Set_sum2_Largest
		jmp Set_sum3_Largest
		
  	Set_sum1_Largest:
		mov largest,ax
		jmp Display1
	
    Set_sum2_Largest:
	   mov largest,bx
	   jmp Display1

    Set_sum3_Largest:
		mov Largest,cx
		jmp Display1
		
	;NOW DISLAYING THE  STRING IN ASECCENDING ORDER   
    Display1:
	    mov ax,smaller
		mov bx,sum1
		cmp ax,bx
		jne Display2
		mov dx,offset str1
		mov ah,09h
		int 21h
    Display2:
	    mov ax,smaller
		mov bx,sum2
		cmp ax,bx
		jne Display3
		mov dx,offset str2
		mov ah,09h
		int 21h
	Display3:
	    mov ax,smaller
		mov bx,sum3
		cmp ax,bx
		jne MMiddle
		mov dx,offset str3
		mov ah,09h
		int 21h	
		
	MMiddle:
     mov ax,sum1
     mov bx,sum2
	 mov cx,sum3
	
      cmp ax,largest
	  jne check_if_for_middle
	  jmp check_for_sum2
	
	check_if_for_middle:
	 cmp ax,smaller
	 jne Display_Middle1
	 jmp check_for_sum2
	 
	Display_Middle1:
	 mov dx,offset str1
	 mov ah,09h
	 int 21h
	 jmp DisplayL1
	 
    check_for_sum2:
	  cmp Bx,largest
	  jne check_if_for_middle1
	  jmp check_for_sum2
	
	check_if_for_middle1:
	 cmp Bx,smaller
	 jne Display_Middle2
	 jmp check_for_sum3
	 
	 Display_Middle2:
	 mov dx,offset str2
	 mov ah,09h
	 int 21h
	 jmp DisplayL1
	 
	 check_for_sum3:
	  cmp Cx,largest
	  jne check_if_for_middle2
	  jmp check_for_sum2
	
	check_if_for_middle2:
	 cmp cx,smaller
	 jne Display_Middle3
	 
	 Display_Middle3:
	 mov dx,offset str3
	 mov ah,09h
	 int 21h
	 jmp DisplayL1
	
	DisplayL1:
	    mov ax,largest
		mov bx,sum1
		cmp ax,bx
		jne DisplayL2
		mov dx,offset str1
		mov ah,09h
		int 21h
    Displayl2:
	    mov ax,largest
		mov bx,sum2
		cmp ax,bx
		jne DisplayL3
		mov dx,offset str2
		mov ah,09h
		int 21h
	DisplayL3:
	    mov ax,Largest
		mov bx,sum3
		cmp ax,bx
		jne Exit
		mov dx,offset str3
		mov ah,09h
		int 21h	
	
Exit:;EXIT OPTION FOR PROGRAM TO TERMINATE....	
    mov dx,offset MSG4
	mov ah,09h
	int 21h
	mov ah,04ch
    int 21h
	
end start
