.INCLUDE "M32DEF.INC"
;Generate rats locations 
          
          .EQU LON=0X00
		  .EQU LOFF=0XFF


          LDI R16,0
		  CLR R16
          OUT DDRB,R16
		  SER R16
		  OUT  DDRD,R16   ; CONFIGURATION
	      
		  LDI R18, LOW(RAMEND) 
          OUT SPL, R18
          LDI R18, HIGH(RAMEND)
          OUT SPH, R18          ;stack
          
		  
          LDI R21,3
 LOOP:   
	      OUT PORTD,R16
		  CALL DELAY
		  CLR R16
		  OUT PORTD,R16
		  CALL DELAY
	      SER R16
  	      DEC R21
		  BRNE LOOP
SER R16		 
OUT PORTD,R16



		  

	 

          ;LDI ZL,  LOW(DATA<<1)
          ;LDI ZH,  HIGH(DATA<<1)
	      ;LPM  R14,  Z+
		  ;CLR R17
		  ;LDI R17, 0XF8
  	      ;OUT PORTD, R14



DELAY:	
        ;LDI R18,0xFF
COUNT1:	LDI R17,0xFF
COUNT2: LDI R20,0xFF
COUNT3: DEC R20
        BRNE COUNT3
        DEC R17 
		BRNE COUNT2
		;DEC R18 
		;BRNE COUNT1 
		RET 



          

 ;DATA: .DB 0XF2, 0XF3, 0XF2, 0XF8,0XF2, 0XA3,0XB2, 0XC3

