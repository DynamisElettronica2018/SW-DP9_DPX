
_dSignalLed_init:

;d_signalLed.c,12 :: 		void dSignalLed_init(void) {
;d_signalLed.c,13 :: 		DSIGNAL_0_Direction = OUTPUT;
	PUSH	W10
	BCLR	TRISF5_bit, BitPos(TRISF5_bit+0)
;d_signalLed.c,14 :: 		DSIGNAL_1_Direction = OUTPUT;
	BCLR	TRISF4_bit, BitPos(TRISF4_bit+0)
;d_signalLed.c,15 :: 		DSIGNAL_2_Direction = OUTPUT;
	BCLR	TRISG1_bit, BitPos(TRISG1_bit+0)
;d_signalLed.c,16 :: 		dSignalLed_set(DSIGNAL_LED_RED);
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;d_signalLed.c,17 :: 		dSignalLed_set(DSIGNAL_LED_BLUE);
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_signalLed.c,18 :: 		dSignalLed_set(DSIGNAL_LED_GREEN);
	CLR	W10
	CALL	_dSignalLed_set
;d_signalLed.c,19 :: 		delay_ms(100);
	MOV	#11, W8
	MOV	#11309, W7
L_dSignalLed_init0:
	DEC	W7
	BRA NZ	L_dSignalLed_init0
	DEC	W8
	BRA NZ	L_dSignalLed_init0
;d_signalLed.c,20 :: 		dSignalLed_unset(DSIGNAL_LED_RED);
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
;d_signalLed.c,21 :: 		dSignalLed_unset(DSIGNAL_LED_BLUE);
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_signalLed.c,22 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	CLR	W10
	CALL	_dSignalLed_unset
;d_signalLed.c,23 :: 		}
L_end_dSignalLed_init:
	POP	W10
	RETURN
; end of _dSignalLed_init

_dSignalLed_switch:

;d_signalLed.c,25 :: 		void dSignalLed_switch(unsigned char led) {
;d_signalLed.c,26 :: 		switch (led) {
	GOTO	L_dSignalLed_switch2
;d_signalLed.c,27 :: 		case DSIGNAL_LED_0:
L_dSignalLed_switch4:
;d_signalLed.c,28 :: 		DSIGNAL_0_Pin = !DSIGNAL_0_Pin;
	BTG	RF5_bit, BitPos(RF5_bit+0)
;d_signalLed.c,29 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,30 :: 		case DSIGNAL_LED_1:
L_dSignalLed_switch5:
;d_signalLed.c,31 :: 		DSIGNAL_1_Pin = !DSIGNAL_1_Pin;
	BTG	RF4_bit, BitPos(RF4_bit+0)
;d_signalLed.c,32 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,33 :: 		case DSIGNAL_LED_2:
L_dSignalLed_switch6:
;d_signalLed.c,34 :: 		DSIGNAL_2_Pin = !DSIGNAL_2_Pin;
	BTG	RG1_bit, BitPos(RG1_bit+0)
;d_signalLed.c,35 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,36 :: 		}
L_dSignalLed_switch2:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_switch19
	GOTO	L_dSignalLed_switch4
L__dSignalLed_switch19:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_switch20
	GOTO	L_dSignalLed_switch5
L__dSignalLed_switch20:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_switch21
	GOTO	L_dSignalLed_switch6
L__dSignalLed_switch21:
L_dSignalLed_switch3:
;d_signalLed.c,37 :: 		}
L_end_dSignalLed_switch:
	RETURN
; end of _dSignalLed_switch

_dSignalLed_set:

;d_signalLed.c,39 :: 		void dSignalLed_set(unsigned char led) {
;d_signalLed.c,40 :: 		switch (led) {
	GOTO	L_dSignalLed_set7
;d_signalLed.c,41 :: 		case DSIGNAL_LED_0:
L_dSignalLed_set9:
;d_signalLed.c,42 :: 		DSIGNAL_0_Pin = DSIGNAL_LED_ON;
	BSET	RF5_bit, BitPos(RF5_bit+0)
;d_signalLed.c,43 :: 		break;
	GOTO	L_dSignalLed_set8
;d_signalLed.c,44 :: 		case DSIGNAL_LED_1:
L_dSignalLed_set10:
;d_signalLed.c,45 :: 		DSIGNAL_1_Pin = DSIGNAL_LED_ON;
	BSET	RF4_bit, BitPos(RF4_bit+0)
;d_signalLed.c,46 :: 		break;
	GOTO	L_dSignalLed_set8
;d_signalLed.c,47 :: 		case DSIGNAL_LED_2:
L_dSignalLed_set11:
;d_signalLed.c,48 :: 		DSIGNAL_2_Pin = DSIGNAL_LED_ON;
	BSET	RG1_bit, BitPos(RG1_bit+0)
;d_signalLed.c,49 :: 		break;
	GOTO	L_dSignalLed_set8
;d_signalLed.c,50 :: 		}
L_dSignalLed_set7:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_set23
	GOTO	L_dSignalLed_set9
L__dSignalLed_set23:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_set24
	GOTO	L_dSignalLed_set10
L__dSignalLed_set24:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_set25
	GOTO	L_dSignalLed_set11
L__dSignalLed_set25:
L_dSignalLed_set8:
;d_signalLed.c,51 :: 		}
L_end_dSignalLed_set:
	RETURN
; end of _dSignalLed_set

_dSignalLed_unset:

;d_signalLed.c,53 :: 		void dSignalLed_unset(unsigned char led) {
;d_signalLed.c,54 :: 		switch (led) {
	GOTO	L_dSignalLed_unset12
;d_signalLed.c,55 :: 		case DSIGNAL_LED_0:
L_dSignalLed_unset14:
;d_signalLed.c,56 :: 		DSIGNAL_0_Pin = DSIGNAL_LED_OFF;
	BCLR	RF5_bit, BitPos(RF5_bit+0)
;d_signalLed.c,57 :: 		break;
	GOTO	L_dSignalLed_unset13
;d_signalLed.c,58 :: 		case DSIGNAL_LED_1:
L_dSignalLed_unset15:
;d_signalLed.c,59 :: 		DSIGNAL_1_Pin = DSIGNAL_LED_OFF;
	BCLR	RF4_bit, BitPos(RF4_bit+0)
;d_signalLed.c,60 :: 		break;
	GOTO	L_dSignalLed_unset13
;d_signalLed.c,61 :: 		case DSIGNAL_LED_2:
L_dSignalLed_unset16:
;d_signalLed.c,62 :: 		DSIGNAL_2_Pin = DSIGNAL_LED_OFF;
	BCLR	RG1_bit, BitPos(RG1_bit+0)
;d_signalLed.c,63 :: 		break;
	GOTO	L_dSignalLed_unset13
;d_signalLed.c,64 :: 		}
L_dSignalLed_unset12:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_unset27
	GOTO	L_dSignalLed_unset14
L__dSignalLed_unset27:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_unset28
	GOTO	L_dSignalLed_unset15
L__dSignalLed_unset28:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_unset29
	GOTO	L_dSignalLed_unset16
L__dSignalLed_unset29:
L_dSignalLed_unset13:
;d_signalLed.c,65 :: 		}
L_end_dSignalLed_unset:
	RETURN
; end of _dSignalLed_unset
