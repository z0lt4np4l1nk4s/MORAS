//setting the letter counter to 0
@letters_in_row_count
M = 0;

@SCREEN
D = A;

//setting the offset to the start of the screen
@offset
M = D;

(MAIN_LOOP)
    //capturing the key press
    @KBD
    D = M;

    //if nothing pressed then just continue
    @MAIN_LOOP
    D; JEQ

    //storing the pressed keys value
    @key
    M = D;

    //waiting till the user releases the key
    (LET_GO)
    @KBD
    D = M
    @LET_GO
    D; JNE

    //jumping to the piece of code that will draw a letter or delete the last one
    @DRAW_LETTER
    0; JMP

    (DRAW_LETTER_RETURN)

    //jumping to the piece of code where we are checking whether we reached the end of the current line or not
    @NEW_LINE
    0; JMP

    (NEW_LINE_RETURN)

    @MAIN_LOOP
    0; JMP
(MAIN_LOOP_END)

(END)
@END
0; JMP

(DRAW_LETTER)
    @key
    D = M;

    //if no key was pressed then just moving back to the main loop
    @DRAW_LETTER_RETURN
    D; JEQ

    //checking whether 0 was pressed
    //if yes then jumping to the piece of code which will clear the last letter
    @48
    D = A;

    @key
    D = D - M;

    @CLEAR_LETTER
    D; JEQ

    //if we reached the end of the screen we can't draw anything more,
    //so we are just jumping back to the main loop
    @24576
    D = A;

    @offset
    D = D - M;

    @DRAW_LETTER_RETURN
    D; JLE
    
    //checking whether the letter A was pressed
    //if yes then jumping to the piece of code which will draw the letter A
    //othwerwise we just move on
    @65
    D = A;

    @key
    D = D - M;

    @DRAW_A
    D; JEQ

    //checking whether the letter E was pressed
    //if yes then jumping to the piece of code which will draw the letter E
    //othwerwise we just move on
    @69
    D = A;

    @key
    D = D - M;

    @DRAW_E
    D; JEQ

    //checking whether the letter I was pressed
    //if yes then jumping to the piece of code which will draw the letter I
    //othwerwise we just move on
    @73
    D = A;

    @key
    D = D - M;

    @DRAW_I
    D; JEQ

    //checking whether the letter O was pressed
    //if yes then jumping to the piece of code which will draw the letter O
    //othwerwise we just move on
    @79
    D = A;

    @key
    D = D - M;

    @DRAW_O
    D; JEQ

    //checking whether the letter U was pressed
    //if yes then jumping to the piece of code which will draw the letter U
    //othwerwise we just move on
    @85
    D = A;

    @key
    D = D - M;

    @DRAW_U
    D; JEQ

    (DRAW_RETURN)

    @DRAW_LETTER_RETURN
    0; JMP
(DRAW_LETTER_END)

(DRAW_A)
    //code for drawing the letter A on the screen

    @letters_in_row_count
    M = M + 1;

    @offset
    D = M;

    @i
    M = D;
    A = D;
    M = 0;

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @960
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @2016
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @3120
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @3120
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @6168
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @6168
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @8184
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @8184
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @6168
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @12300
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @12300
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @24582
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @24582
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @24582
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //skipping bottom line if we are in the last row of the screen
    @24064
    D = A;

    @offset
    D = D - M;
    
    @SKIP_A_BOTTOM
    D; JLE

    @i
    A = M;
    M = 0;

    (SKIP_A_BOTTOM)

    @offset
    M = M + 1;

    @DRAW_RETURN
    0; JMP
(DRAW_A_END)

(DRAW_E)
    //code for drawing the letter E on the screen
    
    @letters_in_row_count
    M = M + 1;

    @offset
    D = M;

    @i
    M = D;
    A = D;
    M = 0;

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M;

    @4
    D = A;

    @k
    M = D;

    (DRAW_E_LOOP1_START)
        //VALUE
        @12
        D = A;

        @i
        A = M;
        M = D

        @32
        D = A;

        @i
        M = D + M

        @k 
        M = M - 1;
        D = M;

        @DRAW_E_LOOP1_END
        D; JEQ

        @DRAW_E_LOOP1_START
        0; JMP
    (DRAW_E_LOOP1_END)

    //VALUE
    @4092
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @4092
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    @4
    D = A;

    @k
    M = D;

    (DRAW_E_LOOP2_START)
        //VALUE
        @12
        D = A;

        @i
        A = M;
        M = D

        @32
        D = A;

        @i
        M = D + M

        @k 
        M = M - 1;
        D = M;

        @DRAW_E_LOOP2_END
        D; JEQ

        @DRAW_E_LOOP2_START
        0; JMP
    (DRAW_E_LOOP2_END)

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //skipping bottom line if we are in the last row of the screen
    @24064
    D = A;

    @offset
    D = D - M;
    
    @SKIP_E_BOTTOM
    D; JLE

    @i
    A = M;
    M = 0;
    
    (SKIP_E_BOTTOM)

    @offset
    M = M + 1;

    @DRAW_RETURN
    0; JMP
(DRAW_E_END)

(DRAW_I)
    //code for drawing the letter I on the screen

    @letters_in_row_count
    M = M + 1;

    @offset
    D = M;

    @i
    M = D;
    A = D;
    M = 0;

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M;

    @10
    D = A;

    @k
    M = D;

    (DRAW_I_LOOP_START)
        //VALUE
        @384
        D = A;

        @i
        A = M;
        M = D

        @32
        D = A;

        @i
        M = D + M

        @k 
        M = M - 1;
        D = M;

        @DRAW_I_LOOP_END
        D; JEQ

        @DRAW_I_LOOP_START
        0; JMP
    (DRAW_I_LOOP_END)

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @16380
    D = A;

    @i
    A = M;
    M = D;

    @32
    D = A;

    @i
    M = D + M;

    //skipping bottom line if we are in the last row of the screen
    @24064
    D = A;

    @offset
    D = D - M;
    
    @SKIP_I_BOTTOM
    D; JLE

    @i
    A = M;
    M = 0;
    
    (SKIP_I_BOTTOM)

    @offset
    M = M + 1;

    @DRAW_RETURN
    0; JMP
(DRAW_I_END)

(DRAW_O)
    //code for drawing the letter O on the screen

    @letters_in_row_count
    M = M + 1;

    @offset
    D = M;

    @i
    M = D;
    A = D;
    M = 0;

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @2016
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @7224
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    @10
    D = A;

    @k
    M = D;

    (DRAW_O_LOOP_START)
        //VALUE
        @14364
        D = A;

        @i
        A = M;
        M = D

        @32
        D = A;

        @i
        M = D + M

        @k 
        M = M - 1;
        D = M;

        @DRAW_O_LOOP_END
        D; JEQ

        @DRAW_O_LOOP_START
        0; JMP
    (DRAW_O_LOOP_END)

    //VALUE
    @7224
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M

    //VALUE
    @2016
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M;

    //skipping bottom line if we are in the last row of the screen
    @24064
    D = A;

    @offset
    D = D - M;
    
    @SKIP_O_BOTTOM
    D; JLE

    @i
    A = M;
    M = 0;
    
    (SKIP_O_BOTTOM)

    @offset
    M = M + 1;

    @DRAW_RETURN
    0; JMP
(DRAW_O_END)

(DRAW_U)
    //code for drawing the letter U on the screen

    @letters_in_row_count
    M = M + 1;

    @offset
    D = M;

    @i
    M = D;
    A = D;
    M = 0;

    @32
    D = A;

    @i
    M = D + M;

    @11
    D = A;

    @k
    M = D;

    (DRAW_U_LOOP_START)
        //VALUE
        @28686
        D = A;

        @i
        A = M;
        M = D

        @32
        D = A;

        @i
        M = D + M

        @k 
        M = M - 1;
        D = M;

        @DRAW_U_LOOP_END
        D; JEQ

        @DRAW_U_LOOP_START
        0; JMP
    (DRAW_U_LOOP_END)

    //VALUE
    @14364
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M;

    //VALUE
    @7224
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M;


    //VALUE
    @2016
    D = A;

    @i
    A = M;
    M = D

    @32
    D = A;

    @i
    M = D + M;

    //skipping bottom line if we are in the last row of the screen
    @24064
    D = A;

    @offset
    D = D - M;
    
    @SKIP_U_BOTTOM
    D; JLE

    @i
    A = M;
    M = 0;
    
    (SKIP_U_BOTTOM)

    @offset
    M = M + 1;

    @DRAW_RETURN
    0; JMP
(DRAW_U_END)

(CLEAR_LETTER)
    //code for clearing the last drawn letter

    //first we need to check if we are still on the start of the screen or not
    //if we are then we don't have anything to clear, so we are just jumping back to the place we came from
    @SCREEN
    D = A;

    @offset
    D = D - M;

    @DRAW_RETURN
    D; JGE

    //checking whether we are on the start of a line
    //if yes then we have to move back to the previous one and clear the last drawn letter there
    @letters_in_row_count
    D = M;

    @BACK_LINE
    D; JEQ

    (BACK_LINE_RETURN)

    //finally clearing the last drawn letter from the screen
    @offset
    M = M - 1;
    D = M;

    @i
    M = D;

    @16
    D = A;

    @k
    M = D;

    (CLEAR_LETTER_LOOP_START)
        @i
        A = M;
        M = 0;

        @32
        D = A;

        @i
        M = D + M

        @k 
        M = M - 1;
        D = M;

        @CLEAR_LETTER_LOOP_END
        D; JEQ

        @CLEAR_LETTER_LOOP_START
        0; JMP
    (CLEAR_LETTER_LOOP_END)

    //decrementing the number of letters in the row
    @letters_in_row_count
    M = M - 1;
    D = M;

    @DRAW_RETURN
    0; JMP
(CLEAR_LETTER_END)

(NEW_LINE)
    //code for moving to a new line if we reached the end of the current one

    @32
    D = A;

    //checking whether we are on the end of the line or not
    @letters_in_row_count
    D = D - M;

    //if not then we are just skipping
    @SKIP_NEW_LINE
    D; JNE

    //if yes then we move to a new line
    @letters_in_row_count
    M = 0;

    @480
    D = A;

    @offset
    M = M + D;

    (SKIP_NEW_LINE)

    @NEW_LINE_RETURN
    0; JMP
(NEW_LINE_END)

(BACK_LINE)
    //code to move back to the end of the previous line

    @480
    D = A;

    @offset
    M = M - D;

    @32
    D = A;

    @letters_in_row_count
    M = D;

    @BACK_LINE_RETURN
    0; JMP
(BACK_LINE_END)