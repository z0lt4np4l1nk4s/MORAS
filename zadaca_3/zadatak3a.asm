$MV(R0, base)

@R1
D = M;

@EXP_NOT_ZERO
D; JNE

@R2
M = 1;

@END
0; JMP

(EXP_NOT_ZERO)

D = D - 1;

@EXP_NOT_ONE
D; JNE

$MV(R0, R2)

@END
0; JMP

(EXP_NOT_ONE)

@R0
D = M - 1;

@BASE_NOT_ONE
D; JNE

$MV(R0, R2)

@END
0; JMP

(BASE_NOT_ONE)

@R1
D = M;

@exp
M = D-1;

$MV(base, R2)

$WHILE(exp) 
    $MV(R2, value)
    
    @base
    D = M;

    @counter
    M = D - 1;

    $WHILE(counter)
        $SUM(value, R2, R2)

        @counter
        M = M - 1;
    $END

    @exp
    M = M - 1
$END

(END)
@END
0; JMP