.model small
.stack 100h
.data

    RegisteredName     db 100 dup('$')
    RegisteredPassword db 100 dup('$')

    LoggedInName       db 100 dup('$')
    LoggedInPassword   db 100 dup('$')

    register           db "Registration Form $"
    Loginmsg           db "Login Form $ "
    rname              db " Name : $"
    rpassword          db " Password : $ "

    lname              db " Name : $"
    lpassword          db " Password : $ "

    ClientName         db " Name : $"
    Password           db " Password : $ "
    Invalid            db "Login Failed $ "
    Successmsg         db "Login Successful $ "


    ;-------------------------------
    msg                db " Welcome to Quizlet $"
    q1                 db " What is the capital of Pakistan? a) Islamabad b) Karachi $"
    a1                 db "a$"
    q2                 db " What is the capital of China? a) Beijing b) Karachi $"
    a2                 db "a$"
    q3                 db " What is the capital of India? a) Beijing b) NewDelhi $"
    a3                 db "b$"
    q4                 db " What is the capital of Bangladesh? a) Beijing b) Dhaka $"
    a4                 db "b$"
    q5                 db " What is the capital of Iran? a) Tehran b) Karachi $"
    a5                 db "a$"
    score_msg          db "Your total score is: $"
    remarks            db "Remarks: $"
    excellent          db "Excellent $"
    average            db "Average $"
    fail               db "Fail $"

    tryagain           db 'Press 0 to try again and 1 to logout from Quiz App: $'
    logoutmsg          db 'Logged out From Quiz App Succesfully$'

    msg1               db 'Correct Answer$'
    msg2               db 'Incorrect Answer$'
    Flag               db '0'

.code

main proc



                        mov  ax, @data
                        mov  ds, ax

    ; Register user name
                        mov  si, offset RegisteredName
                        mov  dx, offset register
                        mov  ah, 9
                        int  21h

                        mov  dx, 10
                        mov  ah, 2
                        int  21h

                        mov  dx, 13
                        mov  ah, 2
                        int  21h

                        mov  dx, offset rname
                        mov  ah, 9
                        int  21h

    SignUpName:         
                        mov  ah, 1
                        int  21h
                        cmp  al, 13                           ; Check for ENTER key (end of input)
                        je   SignUpPassword                   ; Jump to password registration
                        mov  [si], al                         ; Store character in RegisteredName
                        inc  si
                        jmp  SignUpName

    SignUpPassword:     
    ; Register password
                        mov  di, offset RegisteredPassword
                        mov  dx, offset rpassword
                        mov  ah, 9
                        int  21h

    L2:                 
                        mov  ah, 1
                        int  21h
                        cmp  al, 13                           ; Check for ENTER key (end of input)
                        je   login                            ; Jump to login process
                        mov  [di], al                         ; Store character in RegisteredPassword
                        inc  di
                        jmp  L2

    login:              
                        mov  dx, offset Loginmsg
                        mov  ah, 9
                        int  21h

                        mov  dx, 10
                        mov  ah, 2
                        int  21h

                        mov  dx, 13
                        mov  ah, 2
                        int  21h

    ; Login user name
                        mov  si, offset LoggedInName          ; Point to input buffer for entered name
                        mov  dx, offset lname
                        mov  ah, 9
                        int  21h

    username:           
                        mov  ah, 1
                        int  21h
                        cmp  al, 13                           ; Check for ENTER key (end of input)
                        je   loginPassword                    ; Jump to password input
                        mov  [si], al                         ; Store character in LoggedInName
                        inc  si
                        jmp  username

    loginPassword:      
    ; Login password
                        mov  di, offset LoggedInPassword      ; Point to input buffer for entered password
                        mov  dx, offset lpassword
                        mov  ah, 9
                        int  21h

    LPass:              
                        mov  ah, 1
                        int  21h
                        cmp  al, 13                           ; Check for ENTER key (end of input)
                        je   compare                          ; Jump to comparison process
                        mov  [di], al                         ; Store character in LoggedInPassword
                        inc  di
                        jmp  LPass

    compare:            
    ; Reset si and di to start of name and password for comparison
                        mov  si, offset RegisteredName        ; Registered name
                        mov  di, offset LoggedInName          ; Entered name

    ; Compare registered name and entered name
    LcompareName:       
                        mov  al, [si]                         ; Load byte from registered name
                        mov  bl, [di]                         ; Load byte from entered name
                        cmp  al, bl                           ; Compare bytes
                        jne  failed                           ; If not equal, jump to failed
                        cmp  al, '$'                          ; Check if end of string (null terminator)
                        je   LcomparePassword                 ; If so, jump to password comparison

                        inc  si
                        inc  di
                        jmp  LcompareName

    LcomparePassword:   
    ; Reset si and di to start of registered and entered passwords
                        mov  si, offset RegisteredPassword    ; Registered password
                        mov  di, offset LoggedInPassword      ; Entered password

    ; Compare registered password and entered password
    LcomparePass:       
                        mov  al, [si]                         ; Load byte from registered password
                        mov  bl, [di]                         ; Load byte from entered password
                        cmp  al, bl                           ; Compare bytes
                        jne  failed                           ; If not equal, jump to failed
                        cmp  al, '$'                          ; Check if end of string (null terminator)
                        je   Success                          ; If so, login successful

                        inc  si
                        inc  di
                        jmp  LcomparePass

    failed:             
                        mov  dx, offset Invalid
                        mov  ah, 9
                        int  21h
                        jmp  ExitProgram

    Success:            
                        mov  dx, offset Successmsg
                        mov  ah, 9
                        int  21h
                        jmp  programEND

    programEND:         
                        mov  dx, 10
                        mov  ah, 2
                        int  21h

                        mov  dx, 13
                        mov  ah, 2
                        int  21h

    ; Output registered name and password
                        mov  dx, offset ClientName
                        mov  ah, 9
                        int  21h
                        mov  dx, offset RegisteredName
                        mov  ah, 9
                        int  21h

                        mov  dx, 10
                        mov  ah, 2
                        int  21h

                        mov  dx, 13
                        mov  ah, 2
                        int  21h

                        mov  dx, offset Password
                        mov  ah, 9
                        int  21h
                        mov  dx, offset RegisteredPassword
                        mov  ah, 9
                        int  21h



    ; Print newline
                        call newline

 



                        mov  bl, 0                            ; counter to store correct answers

    ; Display welcome message
                        mov  dx, offset msg
                        mov  ah, 9
                        int  21h

    ; Print newline
                        call newline

    ; Question 1
                        mov  dx, offset q1
                        mov  ah, 9
                        int  21h

    ; Get user input
                        mov  ah, 1
                        int  21h

    ; Compare with answer 1
                        cmp  al, [a1]
                        jne  skip_increment1
                        call newline
                        mov  flag,'1'
                        mov  dx,offset msg1
                        mov  ah,9
                        int  21h
                        inc  bl                               ; Increment score if correct

    skip_increment1:    
                        call check
                        call newline

    ; Question 2
                        mov  dx, offset q2
                        mov  ah, 9
                        int  21h

    ; Get user input
                        mov  ah, 1
                        int  21h

    ; Compare with answer 2
                        cmp  al, [a2]
                        jne  skip_increment2
                        call newline
                        mov  flag,'1'
                        mov  dx,offset msg1
                        mov  ah,9
                        int  21h
                        inc  bl                               ; Increment score if correct

    skip_increment2:    
                        call check
                        call newline

    ; Question 3
                        mov  dx, offset q3
                        mov  ah, 9
                        int  21h

    ; Get user input
                        mov  ah, 1
                        int  21h

    ; Compare with answer 3
                        cmp  al, [a3]
                        jne  skip_increment3
                        call newline
                        mov  flag,'1'
                        mov  dx,offset msg1
                        mov  ah,9
                        int  21h
                        inc  bl                               ; Increment score if correct

    skip_increment3:    
                        call check
                        call newline

    ; Question 4
                        mov  dx, offset q4
                        mov  ah, 9
                        int  21h

    ; Get user input
                        mov  ah, 1
                        int  21h

    ; Compare with answer 4
                        cmp  al, [a4]
                        jne  skip_increment4
                        call newline
                        mov  flag,'1'
                        mov  dx,offset msg1
                        mov  ah,9
                        int  21h
                        inc  bl                               ; Increment score if correct

    skip_increment4:    
                        call check
                        call newline

    ; Question 5
                        mov  dx, offset q5
                        mov  ah, 9
                        int  21h

    ; Get user input
                        mov  ah, 1
                        int  21h

    ; Compare with answer 5
                        cmp  al, [a5]
                        jne  skip_increment5
                        call newline
                        mov  flag,'1'
                        mov  dx,offset msg1
                        mov  ah,9
                        int  21h
                        inc  bl                               ; Increment score if correct

    skip_increment5:    
                        call check
                        call newline



                        mov  dx, offset RegisteredName
                        mov  ah, 9
                        int  21h

                        call newline

    ; Display score message
                        mov  dx, offset score_msg
                        mov  ah, 9
                        int  21h

    ; Convert score to ASCII and print
                        mov  al, bl                           ; Copy score to al
                        add  al, 30h                          ; Convert to ASCII
                        mov  dl, al
                        mov  ah, 2
                        int  21h

                        call newline
    
    ; Display remark message
                        mov  dx, offset remarks
                        mov  ah, 9
                        int  21h

    ; Check score in bl for remarks (compare numeric score)
                        cmp  bl, 5
                        je   display_excellent
                        cmp  bl, 4
                        je   display_excellent
                        cmp  bl, 3
                        je   display_average
                        cmp  bl, 2
                        je   display_average
                        cmp  bl, 1
                        je   display_fail
                        jmp  display_fail

    display_excellent:  
                        mov  dx, offset excellent
                        jmp  display_remarks_end

    display_average:    
                        mov  dx, offset average
                        jmp  display_remarks_end

    display_fail:       
                        mov  dx, offset fail
                        jmp  display_remarks_end

    display_remarks_end:
                        mov  ah, 9
                        int  21h
                        call newline

    ;Try again Code
                        mov  dx,offset tryagain
                        mov  ah,9
                        int  21h
                        mov  ah,1
                        int  21h
                        cmp  al,48
                        je   try_again
                        call newline
                        mov  dx,offset logoutmsg
                        mov  ah,9
                        int  21h
                        jmp  ExitProgram

    try_again:          
                        call programEND



    ExitProgram:        


    ; Exit program
                        mov  ah, 4Ch
                        int  21h


main endp

newline proc
                        mov  dx,10
                        mov  ah,2
                        int  21h
                        mov  dx,13
                        mov  ah,2
                        int  21h
                        ret
newline endp

check proc

                        cmp  flag,'1'
                        jne  C1
                        jmp  returnstatement

    C1:                 
                        call newline
                        mov  dx,offset msg2
                        mov  ah,9
                        int  21h
                        jmp  returnstatement

    returnstatement:    
                        mov  flag,'0'
                        ret

check endp


end main