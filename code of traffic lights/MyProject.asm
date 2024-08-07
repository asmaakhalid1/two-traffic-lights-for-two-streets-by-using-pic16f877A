
_main:

;MyProject.c,7 :: 		void main(){
;MyProject.c,8 :: 		int arr[]={0,1,2,3,4,5,6,7,8,9,16,17,18,19,20,21,22,23,24,25,32,33,34,35};
	MOVLW      ?ICSmain_arr_L0+0
	MOVWF      ___DoICPAddr+0
	MOVLW      hi_addr(?ICSmain_arr_L0+0)
	MOVWF      ___DoICPAddr+1
	MOVLW      main_arr_L0+0
	MOVWF      FSR
	MOVLW      52
	MOVWF      R0+0
	CALL       ___CC2DW+0
;MyProject.c,13 :: 		trisb=0;
	CLRF       TRISB+0
;MyProject.c,14 :: 		trisd=1;
	MOVLW      1
	MOVWF      TRISD+0
;MyProject.c,15 :: 		trisc=0;
	CLRF       TRISC+0
;MyProject.c,16 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,17 :: 		portc=0;
	CLRF       PORTC+0
;MyProject.c,18 :: 		portd=0;
	CLRF       PORTD+0
;MyProject.c,19 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,20 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;MyProject.c,21 :: 		while(1)           //infinite loop
L_main1:
;MyProject.c,23 :: 		while(portd.b0!=1)    // while switch is open automatic mode go on
L_main3:
	BTFSC      PORTD+0, 0
	GOTO       L_main4
;MyProject.c,25 :: 		for( i = 23; i >=1&&portd.b0!=1;i-- ){
	MOVLW      23
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main5:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      1
	SUBWF      main_i_L0+0, 0
L__main58:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
	BTFSC      PORTD+0, 0
	GOTO       L_main6
L__main56:
;MyProject.c,26 :: 		portb=arr[i];
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,27 :: 		red2=1;
	BSF        PORTC+0, 1
;MyProject.c,28 :: 		yellow2=0;
	BCF        PORTC+0, 2
;MyProject.c,29 :: 		green2=0;
	BCF        PORTC+0, 3
;MyProject.c,30 :: 		red1=0;
	BCF        PORTC+0, 4
;MyProject.c,31 :: 		if(i>3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVF       main_i_L0+0, 0
	SUBLW      3
L__main59:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;MyProject.c,32 :: 		yellow1=0;
	BCF        PORTC+0, 5
;MyProject.c,33 :: 		green1=1;}
	BSF        PORTC+0, 6
	GOTO       L_main11
L_main10:
;MyProject.c,35 :: 		yellow1=1;
	BSF        PORTC+0, 5
;MyProject.c,36 :: 		green1=0;}
	BCF        PORTC+0, 6
L_main11:
;MyProject.c,37 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;MyProject.c,25 :: 		for( i = 23; i >=1&&portd.b0!=1;i-- ){
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;MyProject.c,38 :: 		}
	GOTO       L_main5
L_main6:
;MyProject.c,39 :: 		x=1;     //to make this loop dosent work until first loop ended
	MOVLW      1
	MOVWF      main_x_L0+0
	MOVLW      0
	MOVWF      main_x_L0+1
;MyProject.c,40 :: 		for(i=15;i>=1&&x&&portd.b0!=1;i--){
	MOVLW      15
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main13:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      1
	SUBWF      main_i_L0+0, 0
L__main60:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
	MOVF       main_x_L0+0, 0
	IORWF      main_x_L0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	BTFSC      PORTD+0, 0
	GOTO       L_main14
L__main55:
;MyProject.c,41 :: 		portb=arr[i];
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,42 :: 		red2=0;
	BCF        PORTC+0, 1
;MyProject.c,43 :: 		yellow1=0;
	BCF        PORTC+0, 5
;MyProject.c,44 :: 		green1=0;
	BCF        PORTC+0, 6
;MyProject.c,45 :: 		red1=1;
	BSF        PORTC+0, 4
;MyProject.c,46 :: 		if(i>3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVF       main_i_L0+0, 0
	SUBLW      3
L__main61:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;MyProject.c,47 :: 		yellow2=0;
	BCF        PORTC+0, 2
;MyProject.c,48 :: 		green2=1;}
	BSF        PORTC+0, 3
	GOTO       L_main19
L_main18:
;MyProject.c,50 :: 		yellow2=1;
	BSF        PORTC+0, 2
;MyProject.c,51 :: 		green2=0;
	BCF        PORTC+0, 3
;MyProject.c,52 :: 		}
L_main19:
;MyProject.c,53 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;MyProject.c,40 :: 		for(i=15;i>=1&&x&&portd.b0!=1;i--){
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;MyProject.c,54 :: 		}
	GOTO       L_main13
L_main14:
;MyProject.c,55 :: 		}      //end of automatic mode
	GOTO       L_main3
L_main4:
;MyProject.c,56 :: 		while(portd.b0==1)// start of manual
L_main21:
	BTFSS      PORTD+0, 0
	GOTO       L_main22
;MyProject.c,58 :: 		int sec=3;
	MOVLW      3
	MOVWF      main_sec_L2+0
	MOVLW      0
	MOVWF      main_sec_L2+1
;MyProject.c,59 :: 		if(portd.b0==1&&red2==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main25
	BTFSS      PORTC+0, 1
	GOTO       L_main25
L__main54:
;MyProject.c,60 :: 		for(sec=3;sec>0&&portd.b0==1;sec--){
	MOVLW      3
	MOVWF      main_sec_L2+0
	MOVLW      0
	MOVWF      main_sec_L2+1
L_main26:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_sec_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVF       main_sec_L2+0, 0
	SUBLW      0
L__main62:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
	BTFSS      PORTD+0, 0
	GOTO       L_main27
L__main53:
;MyProject.c,61 :: 		portb=arr[sec];
	MOVF       main_sec_L2+0, 0
	MOVWF      R0+0
	MOVF       main_sec_L2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,62 :: 		yellow1=1;
	BSF        PORTC+0, 5
;MyProject.c,63 :: 		green1=0;
	BCF        PORTC+0, 6
;MyProject.c,64 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;MyProject.c,60 :: 		for(sec=3;sec>0&&portd.b0==1;sec--){
	MOVLW      1
	SUBWF      main_sec_L2+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_sec_L2+1, 1
;MyProject.c,65 :: 		}
	GOTO       L_main26
L_main27:
;MyProject.c,66 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,67 :: 		red2=0;
	BCF        PORTC+0, 1
;MyProject.c,68 :: 		yellow2=0;
	BCF        PORTC+0, 2
;MyProject.c,69 :: 		green2=1;
	BSF        PORTC+0, 3
;MyProject.c,70 :: 		red1=1;
	BSF        PORTC+0, 4
;MyProject.c,71 :: 		yellow1=0;
	BCF        PORTC+0, 5
;MyProject.c,72 :: 		green1=0;
	BCF        PORTC+0, 6
;MyProject.c,73 :: 		while(portd.b0==1&&portd.b1==0);
L_main32:
	BTFSS      PORTD+0, 0
	GOTO       L_main33
	BTFSC      PORTD+0, 1
	GOTO       L_main33
L__main52:
	GOTO       L_main32
L_main33:
;MyProject.c,74 :: 		}
L_main25:
;MyProject.c,76 :: 		if(portd.b0==1&&portc.b1==0){
	BTFSS      PORTD+0, 0
	GOTO       L_main38
	BTFSC      PORTC+0, 1
	GOTO       L_main38
L__main51:
;MyProject.c,77 :: 		for(sec=3;sec>0&&portd.b0==1;sec--){
	MOVLW      3
	MOVWF      main_sec_L2+0
	MOVLW      0
	MOVWF      main_sec_L2+1
L_main39:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_sec_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVF       main_sec_L2+0, 0
	SUBLW      0
L__main63:
	BTFSC      STATUS+0, 0
	GOTO       L_main40
	BTFSS      PORTD+0, 0
	GOTO       L_main40
L__main50:
;MyProject.c,78 :: 		portb=arr[sec];
	MOVF       main_sec_L2+0, 0
	MOVWF      R0+0
	MOVF       main_sec_L2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,79 :: 		yellow2=1;
	BSF        PORTC+0, 2
;MyProject.c,80 :: 		green2=0;
	BCF        PORTC+0, 3
;MyProject.c,81 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	DECFSZ     R11+0, 1
	GOTO       L_main44
	NOP
	NOP
;MyProject.c,77 :: 		for(sec=3;sec>0&&portd.b0==1;sec--){
	MOVLW      1
	SUBWF      main_sec_L2+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_sec_L2+1, 1
;MyProject.c,82 :: 		}
	GOTO       L_main39
L_main40:
;MyProject.c,83 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,84 :: 		red2=1;
	BSF        PORTC+0, 1
;MyProject.c,85 :: 		yellow2=0;
	BCF        PORTC+0, 2
;MyProject.c,86 :: 		green2=0;
	BCF        PORTC+0, 3
;MyProject.c,87 :: 		red1=0;
	BCF        PORTC+0, 4
;MyProject.c,88 :: 		yellow1=0;
	BCF        PORTC+0, 5
;MyProject.c,89 :: 		green1=1;
	BSF        PORTC+0, 6
;MyProject.c,90 :: 		while(portd.b0==1&&portd.b1==0); //in case manual mode is on and switch of manual is open stop looping
L_main45:
	BTFSS      PORTD+0, 0
	GOTO       L_main46
	BTFSC      PORTD+0, 1
	GOTO       L_main46
L__main49:
	GOTO       L_main45
L_main46:
;MyProject.c,91 :: 		}
L_main38:
;MyProject.c,92 :: 		}
	GOTO       L_main21
L_main22:
;MyProject.c,93 :: 		}
	GOTO       L_main1
;MyProject.c,94 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
