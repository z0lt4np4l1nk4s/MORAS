//SELECTION SORT

//reading the array size
$MV(R0, i)

//k = 99 for easier calculations
@99
D = A

@k
M = D;

$WHILE(i)
    //max_ind = i
    $MV(i, max_ind)

    //j = i
    $MV(i, j)

    $WHILE(j)
        //calculating the indexes in memory
        //ind = j + k
        $SUM(j, k, ind)

        //max_ind_temp = max_ind + k
        $SUM(max_ind, k, max_ind_temp)
        
        //checking if A[j] > A[max_ind]
        @ind
        A = M;
        D = M;

        @max_ind_temp
        A = M;
        D = D - M;

        //skipping if not
        @SKIP_SET_NEW_MAX
        D; JLT

        //if yes then
        //max_ind = j
        $MV(j, max_ind)

        (SKIP_SET_NEW_MAX)
    $END

    //calculating the indexes in memory
    $SUM(max_ind, k, arr_max)
    $SUM(i, k, arr_i)

    //swapping A[i] and A[max_ind]
    @arr_max
    A = M;
    D = M;

    @temp
    M = D;

    @arr_i
    A = M;
    D = M;

    @arr_max
    A = M;
    M = D;

    @temp
    D = M;

    @arr_i
    A = M
    M = D
$END

(END)
@END
0; JMP