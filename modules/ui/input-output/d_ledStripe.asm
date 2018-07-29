
_dLedStripe_init:

;d_ledStripe.c,11 :: 		void dLedStripe_init(void) {
;d_ledStripe.c,12 :: 		DLS_0_Direction = OUTPUT;
	BCLR	TRISD2_bit, BitPos(TRISD2_bit+0)
;d_ledStripe.c,13 :: 		DLS_1_Direction = OUTPUT;
	BCLR	TRISD3_bit, BitPos(TRISD3_bit+0)
;d_ledStripe.c,14 :: 		DLS_2_Direction = OUTPUT;
	BCLR	TRISD4_bit, BitPos(TRISD4_bit+0)
;d_ledStripe.c,15 :: 		DLS_3_Direction = OUTPUT;
	BCLR	TRISD5_bit, BitPos(TRISD5_bit+0)
;d_ledStripe.c,16 :: 		DLS_4_Direction = OUTPUT;
	BCLR	TRISD6_bit, BitPos(TRISD6_bit+0)
;d_ledStripe.c,17 :: 		DLS_5_Direction = OUTPUT;
	BCLR	TRISD7_bit, BitPos(TRISD7_bit+0)
;d_ledStripe.c,18 :: 		DLS_RED_Direction = OUTPUT;
	BCLR	TRISG12_bit, BitPos(TRISG12_bit+0)
;d_ledStripe.c,19 :: 		DLS_GREEN_Direction = OUTPUT;
	BCLR	TRISG0_bit, BitPos(TRISG0_bit+0)
;d_ledStripe.c,20 :: 		DLS_BLUE_Direction = OUTPUT;
	BCLR	TRISG14_bit, BitPos(TRISG14_bit+0)
;d_ledStripe.c,21 :: 		dLedStripe_clear();
	CALL	_dLedStripe_clear
;d_ledStripe.c,22 :: 		}
L_end_dLedStripe_init:
	RETURN
; end of _dLedStripe_init

_dLedStripe_debugByte:

;d_ledStripe.c,24 :: 		void dLedStripe_debugByte(unsigned char debugByte) {
;d_ledStripe.c,26 :: 		for (i = DLS_LED_COUNT; i > 0; i -= 1) {
	PUSH	W11
; i start address is: 4 (W2)
	MOV.B	#6, W2
; i end address is: 4 (W2)
L_dLedStripe_debugByte0:
; i start address is: 4 (W2)
	CP.B	W2, #0
	BRA GTU	L__dLedStripe_debugByte55
	GOTO	L_dLedStripe_debugByte1
L__dLedStripe_debugByte55:
;d_ledStripe.c,27 :: 		if (debugByte & 1) {
	BTSS	W10, #0
	GOTO	L_dLedStripe_debugByte3
;d_ledStripe.c,28 :: 		dLedStripe_setLedColorAtPosition(DLS_RED, i - 1);
	ZE	W2, W0
	DEC	W0
	PUSH	W10
	MOV.B	W0, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
	POP	W10
;d_ledStripe.c,29 :: 		} else {
	GOTO	L_dLedStripe_debugByte4
L_dLedStripe_debugByte3:
;d_ledStripe.c,30 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, i - 1);
	ZE	W2, W0
	DEC	W0
	PUSH	W10
	MOV.B	W0, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
	POP	W10
;d_ledStripe.c,31 :: 		}
L_dLedStripe_debugByte4:
;d_ledStripe.c,32 :: 		debugByte = debugByte >> 1;
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledStripe.c,26 :: 		for (i = DLS_LED_COUNT; i > 0; i -= 1) {
; i start address is: 0 (W0)
	SUB.B	W2, #1, W0
; i end address is: 4 (W2)
;d_ledStripe.c,33 :: 		}
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_debugByte0
L_dLedStripe_debugByte1:
;d_ledStripe.c,34 :: 		}
L_end_dLedStripe_debugByte:
	POP	W11
	RETURN
; end of _dLedStripe_debugByte

_dLedStripe_clear:

;d_ledStripe.c,36 :: 		void dLedStripe_clear(void) {
;d_ledStripe.c,37 :: 		unsigned char i = 0;
	PUSH	W10
	PUSH	W11
;d_ledStripe.c,38 :: 		for (i = 0; i < DLS_LED_COUNT; i += 1) {
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dLedStripe_clear5:
; i start address is: 4 (W2)
	CP.B	W2, #6
	BRA LTU	L__dLedStripe_clear57
	GOTO	L_dLedStripe_clear6
L__dLedStripe_clear57:
;d_ledStripe.c,39 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, i);
	MOV.B	W2, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_ledStripe.c,38 :: 		for (i = 0; i < DLS_LED_COUNT; i += 1) {
; i start address is: 0 (W0)
	ADD.B	W2, #1, W0
; i end address is: 4 (W2)
;d_ledStripe.c,40 :: 		}
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_clear5
L_dLedStripe_clear6:
;d_ledStripe.c,41 :: 		}
L_end_dLedStripe_clear:
	POP	W11
	POP	W10
	RETURN
; end of _dLedStripe_clear

_dLedStripe_setLedColorAtPosition:

;d_ledStripe.c,43 :: 		void dLedStripe_setLedColorAtPosition(unsigned char color, unsigned char led) {
;d_ledStripe.c,44 :: 		dLedStripe_setLedFromByteStripe(&dLedStripe_redStripe, led, color & 1);
	PUSH	W10
	PUSH	W12
	ZE	W10, W0
	AND	W0, #1, W0
	PUSH	W10
	MOV.B	W0, W12
	MOV	#lo_addr(_dLedStripe_redStripe), W10
	CALL	_dLedStripe_setLedFromByteStripe
	POP	W10
;d_ledStripe.c,45 :: 		color = color >> 1;
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledStripe.c,46 :: 		dLedStripe_setLedFromByteStripe(&dLedStripe_greenStripe, led, color & 1);
	ZE	W0, W0
	AND	W0, #1, W0
	PUSH	W10
	MOV.B	W0, W12
	MOV	#lo_addr(_dLedStripe_greenStripe), W10
	CALL	_dLedStripe_setLedFromByteStripe
	POP	W10
;d_ledStripe.c,47 :: 		color = color >> 1;
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledStripe.c,48 :: 		dLedStripe_setLedFromByteStripe(&dLedStripe_blueStripe, led, color & 1);
	ZE	W0, W0
	AND	W0, #1, W0
	MOV.B	W0, W12
	MOV	#lo_addr(_dLedStripe_blueStripe), W10
	CALL	_dLedStripe_setLedFromByteStripe
;d_ledStripe.c,49 :: 		}
L_end_dLedStripe_setLedColorAtPosition:
	POP	W12
	POP	W10
	RETURN
; end of _dLedStripe_setLedColorAtPosition

_dLedStripe_setLedStripe:

;d_ledStripe.c,51 :: 		void dLedStripe_setLedStripe(unsigned char colors[]) {
;d_ledStripe.c,53 :: 		for (i = 0; i < DLS_LED_COUNT; i += 1) {
	PUSH	W11
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dLedStripe_setLedStripe8:
; i start address is: 4 (W2)
	CP.B	W2, #6
	BRA LTU	L__dLedStripe_setLedStripe60
	GOTO	L_dLedStripe_setLedStripe9
L__dLedStripe_setLedStripe60:
;d_ledStripe.c,54 :: 		dLedStripe_setLedColorAtPosition(colors[i], i);
	ZE	W2, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV.B	W2, W11
	MOV.B	[W0], W10
	CALL	_dLedStripe_setLedColorAtPosition
	POP	W10
;d_ledStripe.c,53 :: 		for (i = 0; i < DLS_LED_COUNT; i += 1) {
; i start address is: 0 (W0)
	ADD.B	W2, #1, W0
; i end address is: 4 (W2)
;d_ledStripe.c,55 :: 		}
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_setLedStripe8
L_dLedStripe_setLedStripe9:
;d_ledStripe.c,56 :: 		}
L_end_dLedStripe_setLedStripe:
	POP	W11
	RETURN
; end of _dLedStripe_setLedStripe

_dLedStripe_switchLedColorAtPosition:

;d_ledStripe.c,58 :: 		void dLedStripe_switchLedColorAtPosition(unsigned char color, unsigned char led) {
;d_ledStripe.c,60 :: 		currentColor = dLedStripe_getLedColorAtPosition(led);
	PUSH	W10
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dLedStripe_getLedColorAtPosition
	POP	W10
;d_ledStripe.c,61 :: 		if (color == currentColor) {
	CP.B	W10, W0
	BRA Z	L__dLedStripe_switchLedColorAtPosition62
	GOTO	L_dLedStripe_switchLedColorAtPosition11
L__dLedStripe_switchLedColorAtPosition62:
;d_ledStripe.c,62 :: 		dLedStripe_setLedColorAtPosition(DLS_BLACK, led);
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_ledStripe.c,63 :: 		} else {
	GOTO	L_dLedStripe_switchLedColorAtPosition12
L_dLedStripe_switchLedColorAtPosition11:
;d_ledStripe.c,64 :: 		dLedStripe_setLedColorAtPosition(color, led);
	CALL	_dLedStripe_setLedColorAtPosition
;d_ledStripe.c,65 :: 		}
L_dLedStripe_switchLedColorAtPosition12:
;d_ledStripe.c,66 :: 		}
L_end_dLedStripe_switchLedColorAtPosition:
	POP	W10
	RETURN
; end of _dLedStripe_switchLedColorAtPosition

_dLedStripe_getLedColorAtPosition:

;d_ledStripe.c,68 :: 		unsigned char dLedStripe_getLedColorAtPosition(unsigned char led) {
;d_ledStripe.c,70 :: 		finalColor = 0;
; finalColor start address is: 2 (W1)
	CLR	W1
;d_ledStripe.c,71 :: 		if ((dLedStripe_redStripe >> led) & 1) {
	MOV	#lo_addr(_dLedStripe_redStripe), W0
	ZE	[W0], W0
	ZE	W10, W2
	LSR	W0, W2, W0
	BTSS	W0, #0
	GOTO	L__dLedStripe_getLedColorAtPosition50
;d_ledStripe.c,72 :: 		finalColor = finalColor | DLS_RED;
; finalColor start address is: 2 (W1)
	IOR.B	W1, #1, W1
; finalColor end address is: 2 (W1)
; finalColor end address is: 2 (W1)
;d_ledStripe.c,73 :: 		}
	GOTO	L_dLedStripe_getLedColorAtPosition13
L__dLedStripe_getLedColorAtPosition50:
;d_ledStripe.c,71 :: 		if ((dLedStripe_redStripe >> led) & 1) {
;d_ledStripe.c,73 :: 		}
L_dLedStripe_getLedColorAtPosition13:
;d_ledStripe.c,74 :: 		if ((dLedStripe_greenStripe >> led) & 1) {
; finalColor start address is: 2 (W1)
	MOV	#lo_addr(_dLedStripe_greenStripe), W0
	ZE	[W0], W0
	ZE	W10, W2
	LSR	W0, W2, W0
	BTSS	W0, #0
	GOTO	L__dLedStripe_getLedColorAtPosition51
;d_ledStripe.c,75 :: 		finalColor = finalColor | DLS_GREEN;
; finalColor start address is: 2 (W1)
	IOR.B	W1, #2, W1
; finalColor end address is: 2 (W1)
; finalColor end address is: 2 (W1)
;d_ledStripe.c,76 :: 		}
	GOTO	L_dLedStripe_getLedColorAtPosition14
L__dLedStripe_getLedColorAtPosition51:
;d_ledStripe.c,74 :: 		if ((dLedStripe_greenStripe >> led) & 1) {
;d_ledStripe.c,76 :: 		}
L_dLedStripe_getLedColorAtPosition14:
;d_ledStripe.c,77 :: 		if ((dLedStripe_blueStripe >> led) & 1) {
; finalColor start address is: 2 (W1)
	MOV	#lo_addr(_dLedStripe_blueStripe), W0
	ZE	[W0], W0
	ZE	W10, W2
	LSR	W0, W2, W0
	BTSS	W0, #0
	GOTO	L__dLedStripe_getLedColorAtPosition52
;d_ledStripe.c,78 :: 		finalColor = finalColor | DLS_BLUE;
; finalColor start address is: 2 (W1)
	IOR.B	W1, #4, W1
; finalColor end address is: 2 (W1)
; finalColor end address is: 2 (W1)
;d_ledStripe.c,79 :: 		}
	GOTO	L_dLedStripe_getLedColorAtPosition15
L__dLedStripe_getLedColorAtPosition52:
;d_ledStripe.c,77 :: 		if ((dLedStripe_blueStripe >> led) & 1) {
;d_ledStripe.c,79 :: 		}
L_dLedStripe_getLedColorAtPosition15:
;d_ledStripe.c,80 :: 		return finalColor;
; finalColor start address is: 2 (W1)
	MOV.B	W1, W0
; finalColor end address is: 2 (W1)
;d_ledStripe.c,81 :: 		}
L_end_dLedStripe_getLedColorAtPosition:
	RETURN
; end of _dLedStripe_getLedColorAtPosition

_dLedStripe_setLedFromByteStripe:

;d_ledStripe.c,83 :: 		void dLedStripe_setLedFromByteStripe(unsigned char *stripe, unsigned char led, unsigned char on) {
;d_ledStripe.c,84 :: 		if (on) {
	CP0.B	W12
	BRA NZ	L__dLedStripe_setLedFromByteStripe65
	GOTO	L_dLedStripe_setLedFromByteStripe16
L__dLedStripe_setLedFromByteStripe65:
;d_ledStripe.c,85 :: 		*stripe = *stripe | (1 << led);
	ZE	W11, W1
	MOV	#1, W0
	SL	W0, W1, W1
	ZE	[W10], W0
	IOR	W0, W1, W0
	MOV.B	W0, [W10]
;d_ledStripe.c,86 :: 		} else {
	GOTO	L_dLedStripe_setLedFromByteStripe17
L_dLedStripe_setLedFromByteStripe16:
;d_ledStripe.c,87 :: 		*stripe = *stripe & (~(1 << led));
	ZE	W11, W1
	MOV	#1, W0
	SL	W0, W1, W0
	COM.B	W0, W1
	ZE	[W10], W0
	AND	W0, W1, W0
	MOV.B	W0, [W10]
;d_ledStripe.c,88 :: 		}
L_dLedStripe_setLedFromByteStripe17:
;d_ledStripe.c,89 :: 		}
L_end_dLedStripe_setLedFromByteStripe:
	RETURN
; end of _dLedStripe_setLedFromByteStripe

_dLedStripe_updateFrame:

;d_ledStripe.c,91 :: 		void dLedStripe_updateFrame(void) {
;d_ledStripe.c,92 :: 		dLedStripe_hardClearColors();
	PUSH	W10
	CALL	_dLedStripe_hardClearColors
;d_ledStripe.c,93 :: 		switch (dLedStripe_colorSelector) {
	GOTO	L_dLedStripe_updateFrame18
;d_ledStripe.c,94 :: 		case DLS_RED:
L_dLedStripe_updateFrame20:
;d_ledStripe.c,95 :: 		dLedStripe_hardSetLedStripe(dLedStripe_redStripe);
	MOV	#lo_addr(_dLedStripe_redStripe), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetLedStripe
;d_ledStripe.c,96 :: 		dLedStripe_hardSetColor(dLedStripe_colorSelector);
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetColor
;d_ledStripe.c,97 :: 		dRedPersistenceCounter += 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_dRedPersistenceCounter), W0
	ADD.B	W1, [W0], [W0]
;d_ledStripe.c,98 :: 		if (dRedPersistenceCounter == DLS_RED_PERSISTENCE) {
	MOV	#lo_addr(_dRedPersistenceCounter), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA Z	L__dLedStripe_updateFrame67
	GOTO	L_dLedStripe_updateFrame21
L__dLedStripe_updateFrame67:
;d_ledStripe.c,99 :: 		dLedStripe_colorSelector = DLS_GREEN;
	MOV	#lo_addr(_dLedStripe_colorSelector), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;d_ledStripe.c,100 :: 		dRedPersistenceCounter = 0;
	MOV	#lo_addr(_dRedPersistenceCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_ledStripe.c,101 :: 		}
L_dLedStripe_updateFrame21:
;d_ledStripe.c,102 :: 		break;
	GOTO	L_dLedStripe_updateFrame19
;d_ledStripe.c,103 :: 		case DLS_GREEN:
L_dLedStripe_updateFrame22:
;d_ledStripe.c,104 :: 		dLedStripe_hardSetLedStripe(dLedStripe_greenStripe);
	MOV	#lo_addr(_dLedStripe_greenStripe), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetLedStripe
;d_ledStripe.c,105 :: 		dLedStripe_hardSetColor(dLedStripe_colorSelector);
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetColor
;d_ledStripe.c,106 :: 		dLedStripe_colorSelector = DLS_BLUE;
	MOV	#lo_addr(_dLedStripe_colorSelector), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;d_ledStripe.c,107 :: 		break;
	GOTO	L_dLedStripe_updateFrame19
;d_ledStripe.c,108 :: 		case DLS_BLUE:
L_dLedStripe_updateFrame23:
;d_ledStripe.c,109 :: 		dLedStripe_hardSetLedStripe(dLedStripe_blueStripe);
	MOV	#lo_addr(_dLedStripe_blueStripe), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetLedStripe
;d_ledStripe.c,110 :: 		dLedStripe_hardSetColor(dLedStripe_colorSelector);
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetColor
;d_ledStripe.c,111 :: 		dLedStripe_colorSelector = DLS_RED;
	MOV	#lo_addr(_dLedStripe_colorSelector), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_ledStripe.c,112 :: 		break;
	GOTO	L_dLedStripe_updateFrame19
;d_ledStripe.c,113 :: 		}
L_dLedStripe_updateFrame18:
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dLedStripe_updateFrame68
	GOTO	L_dLedStripe_updateFrame20
L__dLedStripe_updateFrame68:
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dLedStripe_updateFrame69
	GOTO	L_dLedStripe_updateFrame22
L__dLedStripe_updateFrame69:
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__dLedStripe_updateFrame70
	GOTO	L_dLedStripe_updateFrame23
L__dLedStripe_updateFrame70:
L_dLedStripe_updateFrame19:
;d_ledStripe.c,114 :: 		}
L_end_dLedStripe_updateFrame:
	POP	W10
	RETURN
; end of _dLedStripe_updateFrame

_dLedStripe_hardSetLedStripe:

;d_ledStripe.c,116 :: 		void dLedStripe_hardSetLedStripe(unsigned char stripe) {
;d_ledStripe.c,118 :: 		for (i = 0; i < DLS_LED_COUNT; i += 1) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_dLedStripe_hardSetLedStripe24:
; i start address is: 2 (W1)
	CP.B	W1, #6
	BRA LTU	L__dLedStripe_hardSetLedStripe72
	GOTO	L_dLedStripe_hardSetLedStripe25
L__dLedStripe_hardSetLedStripe72:
;d_ledStripe.c,119 :: 		if (stripe & 1) {
	BTSS	W10, #0
	GOTO	L_dLedStripe_hardSetLedStripe27
;d_ledStripe.c,120 :: 		dLedStripe_hardSetLedPin(i);
	PUSH	W10
	MOV.B	W1, W10
	CALL	_dLedStripe_hardSetLedPin
	POP	W10
;d_ledStripe.c,121 :: 		} else {
	GOTO	L_dLedStripe_hardSetLedStripe28
L_dLedStripe_hardSetLedStripe27:
;d_ledStripe.c,122 :: 		dLedStripe_hardUnsetLedPin(i);
	PUSH	W10
	MOV.B	W1, W10
	CALL	_dLedStripe_hardUnsetLedPin
	POP	W10
;d_ledStripe.c,123 :: 		}
L_dLedStripe_hardSetLedStripe28:
;d_ledStripe.c,124 :: 		stripe = stripe >> 1;
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledStripe.c,118 :: 		for (i = 0; i < DLS_LED_COUNT; i += 1) {
; i start address is: 0 (W0)
	ADD.B	W1, #1, W0
; i end address is: 2 (W1)
;d_ledStripe.c,125 :: 		}
	MOV.B	W0, W1
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_hardSetLedStripe24
L_dLedStripe_hardSetLedStripe25:
;d_ledStripe.c,126 :: 		}
L_end_dLedStripe_hardSetLedStripe:
	RETURN
; end of _dLedStripe_hardSetLedStripe

_dLedStripe_hardClearColors:

;d_ledStripe.c,128 :: 		void dLedStripe_hardClearColors(void) {
;d_ledStripe.c,129 :: 		DLS_RED_Pin = DLS_COLOR_OFF;
	BSET	LATG12_bit, BitPos(LATG12_bit+0)
;d_ledStripe.c,130 :: 		DLS_BLUE_Pin = DLS_COLOR_OFF;
	BSET	RG14_bit, BitPos(RG14_bit+0)
;d_ledStripe.c,131 :: 		DLS_GREEN_Pin = DLS_COLOR_OFF;
	BSET	RG0_bit, BitPos(RG0_bit+0)
;d_ledStripe.c,132 :: 		}
L_end_dLedStripe_hardClearColors:
	RETURN
; end of _dLedStripe_hardClearColors

_dLedStripe_hardSetColor:

;d_ledStripe.c,134 :: 		void dLedStripe_hardSetColor(unsigned char color) {
;d_ledStripe.c,135 :: 		switch (color) {
	GOTO	L_dLedStripe_hardSetColor29
;d_ledStripe.c,136 :: 		case DLS_RED:
L_dLedStripe_hardSetColor31:
;d_ledStripe.c,137 :: 		DLS_RED_Pin = DLS_COLOR_ON;
	BCLR	LATG12_bit, BitPos(LATG12_bit+0)
;d_ledStripe.c,138 :: 		break;
	GOTO	L_dLedStripe_hardSetColor30
;d_ledStripe.c,139 :: 		case DLS_GREEN:
L_dLedStripe_hardSetColor32:
;d_ledStripe.c,140 :: 		DLS_GREEN_Pin = DLS_COLOR_ON;
	BCLR	RG0_bit, BitPos(RG0_bit+0)
;d_ledStripe.c,141 :: 		break;
	GOTO	L_dLedStripe_hardSetColor30
;d_ledStripe.c,142 :: 		case DLS_BLUE:
L_dLedStripe_hardSetColor33:
;d_ledStripe.c,143 :: 		DLS_BLUE_Pin = DLS_COLOR_ON;
	BCLR	RG14_bit, BitPos(RG14_bit+0)
;d_ledStripe.c,144 :: 		break;
	GOTO	L_dLedStripe_hardSetColor30
;d_ledStripe.c,145 :: 		}
L_dLedStripe_hardSetColor29:
	CP.B	W10, #1
	BRA NZ	L__dLedStripe_hardSetColor75
	GOTO	L_dLedStripe_hardSetColor31
L__dLedStripe_hardSetColor75:
	CP.B	W10, #2
	BRA NZ	L__dLedStripe_hardSetColor76
	GOTO	L_dLedStripe_hardSetColor32
L__dLedStripe_hardSetColor76:
	CP.B	W10, #4
	BRA NZ	L__dLedStripe_hardSetColor77
	GOTO	L_dLedStripe_hardSetColor33
L__dLedStripe_hardSetColor77:
L_dLedStripe_hardSetColor30:
;d_ledStripe.c,146 :: 		}
L_end_dLedStripe_hardSetColor:
	RETURN
; end of _dLedStripe_hardSetColor

_dLedStripe_hardSetLedPin:

;d_ledStripe.c,148 :: 		void dLedStripe_hardSetLedPin(unsigned char led) {
;d_ledStripe.c,149 :: 		switch (led) {
	GOTO	L_dLedStripe_hardSetLedPin34
;d_ledStripe.c,150 :: 		case DLS_LED_0:
L_dLedStripe_hardSetLedPin36:
;d_ledStripe.c,151 :: 		DLS_0_Pin = DLS_LED_ON;
	BSET	RD2_bit, BitPos(RD2_bit+0)
;d_ledStripe.c,152 :: 		break;
	GOTO	L_dLedStripe_hardSetLedPin35
;d_ledStripe.c,153 :: 		case DLS_LED_1:
L_dLedStripe_hardSetLedPin37:
;d_ledStripe.c,154 :: 		DLS_1_Pin = DLS_LED_ON;
	BSET	RD3_bit, BitPos(RD3_bit+0)
;d_ledStripe.c,155 :: 		break;
	GOTO	L_dLedStripe_hardSetLedPin35
;d_ledStripe.c,156 :: 		case DLS_LED_2:
L_dLedStripe_hardSetLedPin38:
;d_ledStripe.c,157 :: 		DLS_2_Pin = DLS_LED_ON;
	BSET	RD4_bit, BitPos(RD4_bit+0)
;d_ledStripe.c,158 :: 		break;
	GOTO	L_dLedStripe_hardSetLedPin35
;d_ledStripe.c,159 :: 		case DLS_LED_3:
L_dLedStripe_hardSetLedPin39:
;d_ledStripe.c,160 :: 		DLS_3_Pin = DLS_LED_ON;
	BSET	RD5_bit, BitPos(RD5_bit+0)
;d_ledStripe.c,161 :: 		break;
	GOTO	L_dLedStripe_hardSetLedPin35
;d_ledStripe.c,162 :: 		case DLS_LED_4:
L_dLedStripe_hardSetLedPin40:
;d_ledStripe.c,163 :: 		DLS_4_Pin = DLS_LED_ON;
	BSET	RD6_bit, BitPos(RD6_bit+0)
;d_ledStripe.c,164 :: 		break;
	GOTO	L_dLedStripe_hardSetLedPin35
;d_ledStripe.c,165 :: 		case DLS_LED_5:
L_dLedStripe_hardSetLedPin41:
;d_ledStripe.c,166 :: 		DLS_5_Pin = DLS_LED_ON;
	BSET	RD7_bit, BitPos(RD7_bit+0)
;d_ledStripe.c,167 :: 		break;
	GOTO	L_dLedStripe_hardSetLedPin35
;d_ledStripe.c,168 :: 		}
L_dLedStripe_hardSetLedPin34:
	CP.B	W10, #0
	BRA NZ	L__dLedStripe_hardSetLedPin79
	GOTO	L_dLedStripe_hardSetLedPin36
L__dLedStripe_hardSetLedPin79:
	CP.B	W10, #1
	BRA NZ	L__dLedStripe_hardSetLedPin80
	GOTO	L_dLedStripe_hardSetLedPin37
L__dLedStripe_hardSetLedPin80:
	CP.B	W10, #2
	BRA NZ	L__dLedStripe_hardSetLedPin81
	GOTO	L_dLedStripe_hardSetLedPin38
L__dLedStripe_hardSetLedPin81:
	CP.B	W10, #3
	BRA NZ	L__dLedStripe_hardSetLedPin82
	GOTO	L_dLedStripe_hardSetLedPin39
L__dLedStripe_hardSetLedPin82:
	CP.B	W10, #4
	BRA NZ	L__dLedStripe_hardSetLedPin83
	GOTO	L_dLedStripe_hardSetLedPin40
L__dLedStripe_hardSetLedPin83:
	CP.B	W10, #5
	BRA NZ	L__dLedStripe_hardSetLedPin84
	GOTO	L_dLedStripe_hardSetLedPin41
L__dLedStripe_hardSetLedPin84:
L_dLedStripe_hardSetLedPin35:
;d_ledStripe.c,169 :: 		}
L_end_dLedStripe_hardSetLedPin:
	RETURN
; end of _dLedStripe_hardSetLedPin

_dLedStripe_hardUnsetLedPin:

;d_ledStripe.c,171 :: 		void dLedStripe_hardUnsetLedPin(unsigned char led) {
;d_ledStripe.c,172 :: 		switch (led) {
	GOTO	L_dLedStripe_hardUnsetLedPin42
;d_ledStripe.c,173 :: 		case DLS_LED_0:
L_dLedStripe_hardUnsetLedPin44:
;d_ledStripe.c,174 :: 		DLS_0_Pin = DLS_LED_OFF;
	BCLR	RD2_bit, BitPos(RD2_bit+0)
;d_ledStripe.c,175 :: 		break;
	GOTO	L_dLedStripe_hardUnsetLedPin43
;d_ledStripe.c,176 :: 		case DLS_LED_1:
L_dLedStripe_hardUnsetLedPin45:
;d_ledStripe.c,177 :: 		DLS_1_Pin = DLS_LED_OFF;
	BCLR	RD3_bit, BitPos(RD3_bit+0)
;d_ledStripe.c,178 :: 		break;
	GOTO	L_dLedStripe_hardUnsetLedPin43
;d_ledStripe.c,179 :: 		case DLS_LED_2:
L_dLedStripe_hardUnsetLedPin46:
;d_ledStripe.c,180 :: 		DLS_2_Pin = DLS_LED_OFF;
	BCLR	RD4_bit, BitPos(RD4_bit+0)
;d_ledStripe.c,181 :: 		break;
	GOTO	L_dLedStripe_hardUnsetLedPin43
;d_ledStripe.c,182 :: 		case DLS_LED_3:
L_dLedStripe_hardUnsetLedPin47:
;d_ledStripe.c,183 :: 		DLS_3_Pin = DLS_LED_OFF;
	BCLR	RD5_bit, BitPos(RD5_bit+0)
;d_ledStripe.c,184 :: 		break;
	GOTO	L_dLedStripe_hardUnsetLedPin43
;d_ledStripe.c,185 :: 		case DLS_LED_4:
L_dLedStripe_hardUnsetLedPin48:
;d_ledStripe.c,186 :: 		DLS_4_Pin = DLS_LED_OFF;
	BCLR	RD6_bit, BitPos(RD6_bit+0)
;d_ledStripe.c,187 :: 		break;
	GOTO	L_dLedStripe_hardUnsetLedPin43
;d_ledStripe.c,188 :: 		case DLS_LED_5:
L_dLedStripe_hardUnsetLedPin49:
;d_ledStripe.c,189 :: 		DLS_5_Pin = DLS_LED_OFF;
	BCLR	RD7_bit, BitPos(RD7_bit+0)
;d_ledStripe.c,190 :: 		break;
	GOTO	L_dLedStripe_hardUnsetLedPin43
;d_ledStripe.c,191 :: 		}
L_dLedStripe_hardUnsetLedPin42:
	CP.B	W10, #0
	BRA NZ	L__dLedStripe_hardUnsetLedPin86
	GOTO	L_dLedStripe_hardUnsetLedPin44
L__dLedStripe_hardUnsetLedPin86:
	CP.B	W10, #1
	BRA NZ	L__dLedStripe_hardUnsetLedPin87
	GOTO	L_dLedStripe_hardUnsetLedPin45
L__dLedStripe_hardUnsetLedPin87:
	CP.B	W10, #2
	BRA NZ	L__dLedStripe_hardUnsetLedPin88
	GOTO	L_dLedStripe_hardUnsetLedPin46
L__dLedStripe_hardUnsetLedPin88:
	CP.B	W10, #3
	BRA NZ	L__dLedStripe_hardUnsetLedPin89
	GOTO	L_dLedStripe_hardUnsetLedPin47
L__dLedStripe_hardUnsetLedPin89:
	CP.B	W10, #4
	BRA NZ	L__dLedStripe_hardUnsetLedPin90
	GOTO	L_dLedStripe_hardUnsetLedPin48
L__dLedStripe_hardUnsetLedPin90:
	CP.B	W10, #5
	BRA NZ	L__dLedStripe_hardUnsetLedPin91
	GOTO	L_dLedStripe_hardUnsetLedPin49
L__dLedStripe_hardUnsetLedPin91:
L_dLedStripe_hardUnsetLedPin43:
;d_ledStripe.c,192 :: 		}
L_end_dLedStripe_hardUnsetLedPin:
	RETURN
; end of _dLedStripe_hardUnsetLedPin
