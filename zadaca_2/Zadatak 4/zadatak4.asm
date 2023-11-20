//MAIN DIAGONAL
(MAIN_DIAGONAL)
    @2054
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;

    (MAIN_DIAGONAL_LOOP_START)
        //1
        @i
        A = M;
        M = 1;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //2
        @2
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //4
        @4
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //8
        @8
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //16
        @16
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //32
        @32
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //64
        @64
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //128
        @128
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //256
        @256
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //512
        @512
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //1024
        @1024
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //2048
        @2048
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //4096
        @4096
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //8192
        @8192
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //16384
        @16384
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //32768
        @32767
        D = A;
        D = D + 1;
        D = -D;

        @i
        A = M;
        M = D;

        @33
        D = A;

        @i
        M = M + D;
        D = M;

        @22200
        D = D - A;

        @MAIN_DIAGONAL_LOOP_END
        D; JGT

        @MAIN_DIAGONAL_LOOP_START
        0; JMP
    (MAIN_DIAGONAL_LOOP_END)
(MAIN_DIAGONAL_END)

//SIDE DIAGONAL
(SIDE_DIAGONAL)
    @2061
    D = A;

    @SCREEN
    D = D + A;

    @i
    M = D;

    (SIDE_DIAGONAL_LOOP_START)
        //-32768
        @32767
        D = A;
        D = D + 1;
        D = -D;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //16384
        @16384
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //8192
        @8192
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //4096
        @4096
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //2048
        @2048
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //1024
        @1024
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //512
        @512
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //256
        @256
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //128
        @128
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //64
        @64
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //32
        @32
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //16
        @16
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //8
        @8
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //4
        @4
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //2
        @2
        D = A;

        @i
        A = M;
        M = D;

        @32
        D = A;

        @i
        M = M + D;
        D = M;

        //1
        @i
        A = M;
        M = 1;

        @31
        D = A;

        @i
        M = M + D;
        D = M;

        @22400
        D = D - A;

        @SIDE_DIAGONAL_LOOP_END
        D; JGT

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
        M = M + D;
        D = M;

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
        M = M + 1;
        D = M;

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
        M = M + 1;
        D = M;

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
        M = M + D;
        D = M;

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