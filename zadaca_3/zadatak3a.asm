$MV(R0, base)

@R1
D = M;

@NOT_ZERO
D; JNE

@R2
M = 1;

@END
0; JMP

(NOT_ZERO)

D = D - 1;

@NOT_ONE
D; JNE

$MV(R0, R2)

@END
0; JMP

(NOT_ONE)

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
    $END
$END

(END)
@END
0; JMP