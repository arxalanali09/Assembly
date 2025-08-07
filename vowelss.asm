.model small
.stack 100h
.data
    inputString db 'HelleAuA', 0 ; Input string with null terminator
    vowels db 'aeiouAEIOU', 0  ; Vowels to check, terminated with 0
    output db 50 dup(0) ; Space for output (initialize with 0)

.code
Main proc
    ; Set up data segments
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Initialize source and destination pointers using MOV and OFFSET
    mov si, offset inputString  ; Load address of inputString into SI
    mov di, offset output       ; Load address of output buffer into DI

next_char:
    mov al, [si]         ; Load the next character from input string
    cmp al, 0            ; Check if end of string (null terminator)
    je display_output    ; Jump to output display if end of string

    ; Check if the character is a vowel using MOV
    mov bx, offset vowels ; Load address of vowels string into BX
check_vowel:
    mov dl, [bx]         ; Load the next vowel into DL (using DL for comparison)
    cmp dl, 0            ; Check if end of vowels string (null terminator)
    je not_vowel         ; If end of vowels string, it's not a vowel

    cmp al, dl           ; Compare input character with current vowel
    je is_vowel          ; If match, it's a vowel

    inc bx               ; Move to next vowel
    jmp check_vowel

not_vowel:
    inc si               ; Move to next character in input string
    jmp next_char

is_vowel:
    mov [di], al         ; Store vowel in output buffer
    inc di               ; Increment output pointer
    inc si               ; Move to next character in input string
    jmp next_char

display_output:
    ; Null-terminate the output buffer
    mov byte ptr [di], '$'

    ; Display the output (vowels extracted from input string)
    mov dx, offset output
    mov ah, 9            ; DOS interrupt for displaying a string
    int 21h              ; Call interrupt 21h to display the string

    ; Exit program
    mov ah, 4ch
    int 21h

Main endp
end Main
