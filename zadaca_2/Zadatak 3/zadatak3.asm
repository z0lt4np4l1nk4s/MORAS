//setting RAM[5] = 0;
@5
M = 0;

//setting counter i = 4;
@i
M = 0;
@4
D = A;
@i
M = D;

//loop to sum the values of RAM[i] where i = 0,1,2,3,4
(START)
    //read the value of RAM[i] and store it to D
    @i
    A = M;
    D = M;

    //call the SAVE method which will add the number
    //stored in D to the current sum
    @SAVE
    0; JMP

    (SAVE_END)

    //checking if counter i is equal to 0
    @i
    D = M;
    //if yes, then we are done
    @END
    D; JEQ

    //decrementing the counter i
    @i
    M = M - 1;

    //jumping to the start of the loop
    @START
    0; JMP

//adding result from D to RAM[5]
(SAVE)
@5
M = D + M
@SAVE_END
0; JMP

//end of the program
(END)
@END
0; JMP