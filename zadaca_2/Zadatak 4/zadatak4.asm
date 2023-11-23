//MAIN DIAGONAL
(MAIN_DIAGONAL)
    @2054
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;

    @k
    M = 1;

    @33
    D = A;

    @last_inc
    M = D;

    @MAIN_DRAW_LAST_RETURN
    D = A;

    @draw_last_return
    M = D;

    (MAIN_DIAGONAL_LOOP_START)
        @k
        D = M;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        MD = M + D;

        @22480
        D = D - A;

        @MAIN_DIAGONAL_LOOP_END
        D; JGT

        @16384
        D = A;

        @k
        D = D - M;

        @DRAW_LAST_START
        D; JEQ

        @k
        D = M;
        M = M + D;

        (MAIN_DRAW_LAST_RETURN)

        @MAIN_DIAGONAL_LOOP_START
        0; JMP

    (MAIN_DIAGONAL_LOOP_END)
(MAIN_DIAGONAL_END)

//SIDE DIAGONAL
(SIDE_DIAGONAL)
    @6086
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;

    @31
    D = A;

    @last_inc
    M = -D;

    @SIDE_DRAW_LAST_RETURN
    D = A;

    @draw_last_return
    M = D;

    @k
    D = 1;
    M = D + 1;

    (SIDE_DIAGONAL_LOOP_START)
        @k
        D = M;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        MD = M - D;

        @18472
        D = D - A;

        @SIDE_DIAGONAL_LOOP_END
        D; JLT

        @16384
        D = A;

        @k
        D = D - M;

        @DRAW_LAST_START
        D; JEQ

        @k
        D = M;
        M = M + D;

        (SIDE_DRAW_LAST_RETURN)

        @SIDE_DIAGONAL_LOOP_START
        0; JMP

    (SIDE_DIAGONAL_LOOP_END)
(SIDE_DIAGONAL_END)

//VERTICAL LEFT LINE
(VERT_LEFT_LINE)
    @2054
    D = A;

    @i
    M = D;
    (VERT_LEFT_LOOP_START)
        @i
        D = M;

        @SCREEN
        A = A + D;
        M = M + 1;

        @32
        D = A;

        @i
        MD = M + D;

        @6118
        D = D - A;

        @VERT_LEFT_LOOP_END
        D; JEQ

        @VERT_LEFT_LOOP_START
        0; JMP
    (VERT_LEFT_LOOP_END)
(VERT_LEFT_LINE_END)

//HORIZONTAL TOP LINE
(HORIZ_TOP_LINE)
    @2054
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;

    (HORIZ_TOP_LOOP_START)
        @i
        A = M;
        M = -1;

        @i
        MD = M + 1;

        @18446
        D = D - A;

        @HORIZ_TOP_LOOP_END
        D; JEQ

        @HORIZ_TOP_LOOP_START
        0; JMP
    (HORIZ_TOP_LOOP_END)
(HORIZ_TOP_LINE_END)

//HORIZONTAL BOTTOM LINE
(HORIZ_BOTTOM_LINE)
    @6118
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;

    (HORIZ_BOTTOM_LOOP_START)
        @i
        A = M;
        M = -1;

        @i
        MD = M + 1;

        @22510
        D = D - A;

        @HORIZ_BOTTOM_LOOP_END
        D; JEQ

        @HORIZ_BOTTOM_LOOP_START
        0; JMP
    (HORIZ_BOTTOM_LOOP_END)
(HORIZ_BOTTOM_LINE_END)

//VERTICAL RIGHT LINE
(VERT_RIGHT_LINE)
    @2093
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;
    (VERT_RIGHT_LOOP_START)
        //-32768
        @32767
        D = A;
        D = D + 1;
        D = -D;

        @i
        A = M;
        M = M + D;

        @32
        D = A;

        @i
        MD = M + D;

        @22500
        D = D - A;

        @VERT_RIGHT_LOOP_END
        D; JGT

        @VERT_RIGHT_LOOP_START
        0; JMP
    (VERT_RIGHT_LOOP_END)
(VERT_RIGHT_LINE_END)

(END)
@END
0; JMP

//drawing the last point
(DRAW_LAST_START)
    @32767
    D = A;
    D = D + 1;
    D = -D;

    @i
    A = M;
    M = D;

    @last_inc
    D = M;

    @i
    M = M + D;

    @k
    M = 1;

    @draw_last_return
    A = M;
    0; JMP
(DRAW_LAST_END)