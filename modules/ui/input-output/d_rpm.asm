
_dRpm_init:

;d_rpm.c,18 :: 		void dRpm_init() {
;d_rpm.c,19 :: 		}
L_end_dRpm_init:
	RETURN
; end of _dRpm_init

_dRpm_getDisplayValue:

;d_rpm.c,21 :: 		float dRpm_getDisplayValue(void) {
;d_rpm.c,22 :: 		return (dRpm / 10) / 100.0;
	MOV	_dRpm, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_rpm.c,23 :: 		}
L_end_dRpm_getDisplayValue:
	RETURN
; end of _dRpm_getDisplayValue

_dRpm_set:

;d_rpm.c,25 :: 		void dRpm_set(unsigned int rpm) {
;d_rpm.c,26 :: 		dd_Indicator_setIntValueP(&ind_rpm.base, rpm);
	PUSH	W11
	PUSH	W10
	MOV	W10, W11
	MOV	#lo_addr(_ind_rpm), W10
	CALL	_dd_Indicator_setIntValueP
	POP	W10
;d_rpm.c,27 :: 		if (rpm < RPM_STRIPE_OFFSET){
	MOV	#5000, W0
	CP	W10, W0
	BRA LTU	L__dRpm_set18
	GOTO	L_dRpm_set0
L__dRpm_set18:
;d_rpm.c,28 :: 		dRpm = RPM_STRIPE_OFFSET;
	MOV	#5000, W0
	MOV	W0, _dRpm
;d_rpm.c,29 :: 		} else if ( rpm > RPM_STRIPE_MAX){
	GOTO	L_dRpm_set1
L_dRpm_set0:
	MOV	#11500, W0
	CP	W10, W0
	BRA GTU	L__dRpm_set19
	GOTO	L_dRpm_set2
L__dRpm_set19:
;d_rpm.c,30 :: 		dRpm = RPM_STRIPE_MAX;
	MOV	#11500, W0
	MOV	W0, _dRpm
;d_rpm.c,31 :: 		} else {
	GOTO	L_dRpm_set3
L_dRpm_set2:
;d_rpm.c,32 :: 		dRpm = rpm;
	MOV	W10, _dRpm
;d_rpm.c,33 :: 		}
L_dRpm_set3:
L_dRpm_set1:
;d_rpm.c,34 :: 		}
L_end_dRpm_set:
	POP	W11
	RETURN
; end of _dRpm_set

_dRpm_canUpdateLedStripe:

;d_rpm.c,36 :: 		char dRpm_canUpdateLedStripe(void) {
;d_rpm.c,37 :: 		return dRpm_ledStripeOutputEnable;
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W0
	MOV.B	[W0], W0
;d_rpm.c,38 :: 		}
L_end_dRpm_canUpdateLedStripe:
	RETURN
; end of _dRpm_canUpdateLedStripe

_dRpm_disableLedStripeOutput:

;d_rpm.c,40 :: 		void dRpm_disableLedStripeOutput(void) {
;d_rpm.c,41 :: 		dRpm_ledStripeOutputEnable = FALSE;
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_rpm.c,42 :: 		}
L_end_dRpm_disableLedStripeOutput:
	RETURN
; end of _dRpm_disableLedStripeOutput

_dRpm_enableLedStripeOutput:

;d_rpm.c,44 :: 		void dRpm_enableLedStripeOutput(void) {
;d_rpm.c,45 :: 		dRpm_ledStripeOutputEnable = TRUE;
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_rpm.c,46 :: 		}
L_end_dRpm_enableLedStripeOutput:
	RETURN
; end of _dRpm_enableLedStripeOutput

_dRpm_updateLedStripe:

;d_rpm.c,48 :: 		void dRpm_updateLedStripe(void) {
;d_rpm.c,50 :: 		if (dRpm > RPM_STRIPE_OFFSET) {
	PUSH	W10
	PUSH	W11
	MOV	_dRpm, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__dRpm_updateLedStripe24
	GOTO	L_dRpm_updateLedStripe4
L__dRpm_updateLedStripe24:
;d_rpm.c,51 :: 		dLedStripeState = (dRpm - RPM_STRIPE_OFFSET) / RPM_STRIPE_STEP;
	MOV	_dRpm, W1
	MOV	#5000, W0
	SUB	W1, W0, W1
	MOV	#812, W2
	REPEAT	#17
	DIV.U	W1, W2
; dLedStripeState start address is: 0 (W0)
;d_rpm.c,52 :: 		} else {
; dLedStripeState end address is: 0 (W0)
	GOTO	L_dRpm_updateLedStripe5
L_dRpm_updateLedStripe4:
;d_rpm.c,53 :: 		dLedStripeState = 0;
; dLedStripeState start address is: 0 (W0)
	CLR	W0
; dLedStripeState end address is: 0 (W0)
;d_rpm.c,54 :: 		}
L_dRpm_updateLedStripe5:
;d_rpm.c,55 :: 		switch (dLedStripeState) {
; dLedStripeState start address is: 0 (W0)
	GOTO	L_dRpm_updateLedStripe6
; dLedStripeState end address is: 0 (W0)
;d_rpm.c,56 :: 		case 0:
L_dRpm_updateLedStripe8:
;d_rpm.c,57 :: 		dLedStripe_clear();
	CALL	_dLedStripe_clear
;d_rpm.c,58 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,59 :: 		case 1:
L_dRpm_updateLedStripe9:
;d_rpm.c,60 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,61 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_1);
	MOV.B	#1, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,62 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_2);
	MOV.B	#2, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,63 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
	MOV.B	#3, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,64 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,65 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,66 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,67 :: 		case 2:
L_dRpm_updateLedStripe10:
;d_rpm.c,68 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,69 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,70 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_2);
	MOV.B	#2, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,71 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
	MOV.B	#3, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,72 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,73 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,74 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,75 :: 		case 3:
L_dRpm_updateLedStripe11:
;d_rpm.c,76 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,77 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,78 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,79 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
	MOV.B	#3, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,80 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,81 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,82 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,83 :: 		case 4:
L_dRpm_updateLedStripe12:
;d_rpm.c,84 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,85 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,86 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,87 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,88 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,89 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,90 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,91 :: 		case 5:
L_dRpm_updateLedStripe13:
;d_rpm.c,92 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,93 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,94 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,95 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,96 :: 		dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_4);
	MOV.B	#4, W11
	MOV.B	#4, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,97 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,98 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,99 :: 		case 6:
L_dRpm_updateLedStripe14:
;d_rpm.c,100 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,101 :: 		dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,102 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,103 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,104 :: 		dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_4);
	MOV.B	#4, W11
	MOV.B	#4, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,105 :: 		dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_5);
	MOV.B	#5, W11
	MOV.B	#4, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,106 :: 		break;
	GOTO	L_dRpm_updateLedStripe7
;d_rpm.c,107 :: 		}
L_dRpm_updateLedStripe6:
; dLedStripeState start address is: 0 (W0)
	CP.B	W0, #0
	BRA NZ	L__dRpm_updateLedStripe25
	GOTO	L_dRpm_updateLedStripe8
L__dRpm_updateLedStripe25:
	CP.B	W0, #1
	BRA NZ	L__dRpm_updateLedStripe26
	GOTO	L_dRpm_updateLedStripe9
L__dRpm_updateLedStripe26:
	CP.B	W0, #2
	BRA NZ	L__dRpm_updateLedStripe27
	GOTO	L_dRpm_updateLedStripe10
L__dRpm_updateLedStripe27:
	CP.B	W0, #3
	BRA NZ	L__dRpm_updateLedStripe28
	GOTO	L_dRpm_updateLedStripe11
L__dRpm_updateLedStripe28:
	CP.B	W0, #4
	BRA NZ	L__dRpm_updateLedStripe29
	GOTO	L_dRpm_updateLedStripe12
L__dRpm_updateLedStripe29:
	CP.B	W0, #5
	BRA NZ	L__dRpm_updateLedStripe30
	GOTO	L_dRpm_updateLedStripe13
L__dRpm_updateLedStripe30:
	CP.B	W0, #6
	BRA NZ	L__dRpm_updateLedStripe31
	GOTO	L_dRpm_updateLedStripe14
L__dRpm_updateLedStripe31:
; dLedStripeState end address is: 0 (W0)
L_dRpm_updateLedStripe7:
;d_rpm.c,108 :: 		}
L_end_dRpm_updateLedStripe:
	POP	W11
	POP	W10
	RETURN
; end of _dRpm_updateLedStripe
