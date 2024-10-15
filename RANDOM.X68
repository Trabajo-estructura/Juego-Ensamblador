*-----------------------------------------------------------
* RANDOM NUMBER GENERATOR
*   
* It generates a pseudorandomly number specified by registers
* D1 as LOW limit and D2 as TOP limit. Registers have to be
* set as parameters to the routine through the stack.
* 
* INPUT:    D1.W and D2.W. For changing seed (A7) <- SEED
* OUTPUT:   Random number in D3 register
*-----------------------------------------------------------

*===========================================================
GENRAN:

    MOVE.W #1,D1  
    MOVE.W #10,D2   
    MOVE.L #SEED,D4
    MOVE.L #AMUL,D5
    MOVE.L #CMUL,D6
    MOVE.L #MMOD,D7
    MULU.W D4,D5
    ADD.L D6,D5
    DIVU.W D7,D5
    LSR.L #8,D5
    LSR.L #8,D5
    MOVE.L D5,D4
    SUB.W D1,D2
    DIVU.W D2,D5
    LSR.L #8,D5
    LSR.L #8,D5
    ADD.W D1,D5
    MOVE.W D5,D3

    RTE
    
*===========================================================

*===========================================================
* CONSTANTS:

AMUL:       EQU     $6D
CMUL:       EQU     $1B
MMOD:       EQU     $1000
SEED:       EQU     $7B

*===========================================================

*===========================================================
* VARIABLES:

LOW:        DC.B    1
TOP:        DC.B    1

*===========================================================


    END    START        





*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
