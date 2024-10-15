*-----------------------------------------------------------
* Title      : TEST OF RANDOM
* Written by : VICENT ROIG
* Date       : 15/10/24
* Description: THIS IS A TEST OF RANDOM FILE
*
* Note       : If you want different numbers, change the seed
* like MOVE.W #X,(NEWSEED) AFTER installing the routine,
* where X is a number likely to be 115<=X<=132.
* By default is X = 123. 
*
* REMEMBER: Changing either the low, top or both limits, 
* will ensure new pseudorandomly genereted numbers within that range.
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "RANDOM.X68"
    
    
START:    

    ;INSTALL USER ROUTINE
    JSR INITRAN
    LEA.L VECTOR,A1
    MOVE.W #5,D0        ; NUMBER OF PSEUDORANDOMLY GENERATED NUMBERS
    MOVE.W #1,(LOW)     ; LOW LIMIT
    MOVE.W #10,(TOP)    ; TOP LIMIT
    
.LOOP:
    
    CLR.W D3
    TRAP #0             ; CALL TO USER ROUTINE
    MOVE.W D3,(A1)+
    DBRA D0,.LOOP
    

    SIMHALT             

VECTOR:     DS.W    6   ; VECTOR TO STORE THE RANDOM NUMBERS

    END    START       




*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
