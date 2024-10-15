*-----------------------------------------------------------
* RANDOM NUMBER GENERATOR
*   
* It generates a pseudorandomly number specified by
* LOW limit and TOP limit.
* 
* INPUT:    (LOW) as low limit and (TOP) as top limit
* OUTPUT:   Random number in D3 register
*-----------------------------------------------------------

*===========================================================
INITRAN:

    ; INSTALL USER ROUTINE
    MOVE.L #GENRAN,($80)
    MOVE.W #SEED,(NEWSEED)
    
    MOVE.W SR,-(A7)
    ANDI.W #$DFFF,(A7)
    
    RTE

*===========================================================
GENRAN:
    
    ; RESTORE REGISTERS
    MOVEM.W D4-D6,-(A7)
    
    MOVE.W (NEWSEED),D4
    MOVE.W #AMUL,D5
    MULU.W D4,D5
    ADD.W #CMUL,D5
    DIVU.W #MMOD,D5
    LSR.L #8,D5
    LSR.L #8,D5
    MOVE.W D5,(NEWSEED)
    MOVE.W (TOP),D6
    SUB.W (LOW),D6
    DIVU.W D6,D5
    LSR.L #8,D5
    LSR.L #8,D5
    ADD.W (LOW),D5
    MOVE.W D5,D3
    
    MOVEM.W (A7)+,D4-D6

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

NEWSEED:    DC.W    1
LOW:        DC.W    1
TOP:        DC.W    1

*===========================================================








*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
