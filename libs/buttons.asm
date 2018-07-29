
_external0:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,18 :: 		onBottomInterrupt{
;buttons.c,19 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external00:
	DEC	W7
	BRA NZ	L_external00
	NOP
	NOP
;buttons.c,20 :: 		if (BUTTON_BR_Pin == BUTTON_ACTIVE_STATE) {
	BTSC	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_external02
;buttons.c,21 :: 		button_onBRDown();
	CALL	_button_onBRDown
;buttons.c,22 :: 		} else if (BUTTON_BL_Pin == BUTTON_ACTIVE_STATE) {
	GOTO	L_external03
L_external02:
	BTSC	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_external04
;buttons.c,23 :: 		button_onBLDown();
	CALL	_button_onBLDown
;buttons.c,24 :: 		}
L_external04:
L_external03:
;buttons.c,25 :: 		clearExternalInterrupt(BottomInterrupt);
	MOV.B	#4, W10
	CALL	_clearExternalInterrupt
;buttons.c,26 :: 		}
L_end_external0:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external0

_external1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,28 :: 		onLeftInterrupt{
;buttons.c,29 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external15:
	DEC	W7
	BRA NZ	L_external15
	NOP
	NOP
;buttons.c,30 :: 		if (BUTTON_L1_Pin == BUTTON_ACTIVE_STATE) {
	BTSC	RB11_bit, BitPos(RB11_bit+0)
	GOTO	L_external17
;buttons.c,31 :: 		button_onL1Down();
	CALL	_button_onL1Down
;buttons.c,32 :: 		} else if (BUTTON_L2_Pin == BUTTON_ACTIVE_STATE) {
	GOTO	L_external18
L_external17:
	BTSC	RB12_bit, BitPos(RB12_bit+0)
	GOTO	L_external19
;buttons.c,33 :: 		button_onL2Down();
	CALL	_button_onL2Down
;buttons.c,34 :: 		} else if (BUTTON_L3_Pin == BUTTON_ACTIVE_STATE) {
	GOTO	L_external110
L_external19:
	BTSC	RG2_bit, BitPos(RG2_bit+0)
	GOTO	L_external111
;buttons.c,35 :: 		button_onL3Down();
	CALL	_button_onL3Down
;buttons.c,36 :: 		}
L_external111:
L_external110:
L_external18:
;buttons.c,37 :: 		clearExternalInterrupt(LeftInterrupt);
	MOV.B	#5, W10
	CALL	_clearExternalInterrupt
;buttons.c,38 :: 		}
L_end_external1:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external1

_external2:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,40 :: 		onRightInterrupt{
;buttons.c,41 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external212:
	DEC	W7
	BRA NZ	L_external212
	NOP
	NOP
;buttons.c,42 :: 		if (BUTTON_R1_Pin == BUTTON_ACTIVE_STATE) {
	BTSC	RB9_bit, BitPos(RB9_bit+0)
	GOTO	L_external214
;buttons.c,43 :: 		button_onR1Down();
	CALL	_button_onR1Down
;buttons.c,44 :: 		} else if (BUTTON_R2_Pin == BUTTON_ACTIVE_STATE) {
	GOTO	L_external215
L_external214:
	BTSC	RB10_bit, BitPos(RB10_bit+0)
	GOTO	L_external216
;buttons.c,45 :: 		button_onR2Down();
	CALL	_button_onR2Down
;buttons.c,46 :: 		} else if (BUTTON_R3_Pin == BUTTON_ACTIVE_STATE) {
	GOTO	L_external217
L_external216:
	BTSC	RG3_bit, BitPos(RG3_bit+0)
	GOTO	L_external218
;buttons.c,47 :: 		button_onR3Down();
	CALL	_button_onR3Down
;buttons.c,48 :: 		}
L_external218:
L_external217:
L_external215:
;buttons.c,49 :: 		clearExternalInterrupt(RightInterrupt);
	MOV.B	#6, W10
	CALL	_clearExternalInterrupt
;buttons.c,50 :: 		}
L_end_external2:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external2

_external4:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,52 :: 		onCenterInterrupt{
;buttons.c,53 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external419:
	DEC	W7
	BRA NZ	L_external419
	NOP
	NOP
;buttons.c,54 :: 		button_onCDown();
	CALL	_button_onCDown
;buttons.c,55 :: 		clearExternalInterrupt(CenterInterrupt);
	MOV.B	#8, W10
	CALL	_clearExternalInterrupt
;buttons.c,56 :: 		}
L_end_external4:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external4

_Buttons_init:

;buttons.c,58 :: 		void Buttons_init(void) {
;buttons.c,59 :: 		BUTTON_R1_Direction = INPUT;
	PUSH	W10
	PUSH	W11
	BSET	TRISB9_bit, BitPos(TRISB9_bit+0)
;buttons.c,60 :: 		BUTTON_R2_Direction = INPUT;
	BSET	TRISB10_bit, BitPos(TRISB10_bit+0)
;buttons.c,61 :: 		BUTTON_R3_Direction = INPUT;
	BSET	TRISG3_bit, BitPos(TRISG3_bit+0)
;buttons.c,62 :: 		BUTTON_L1_Direction = INPUT;
	BSET	TRISB11_bit, BitPos(TRISB11_bit+0)
;buttons.c,63 :: 		BUTTON_L2_Direction = INPUT;
	BSET	TRISB12_bit, BitPos(TRISB12_bit+0)
;buttons.c,64 :: 		BUTTON_L3_Direction = INPUT;
	BSET	TRISG2_bit, BitPos(TRISG2_bit+0)
;buttons.c,65 :: 		BUTTON_BL_Direction = INPUT;
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;buttons.c,66 :: 		BUTTON_BR_Direction = INPUT;
	BSET	TRISF3_bit, BitPos(TRISF3_bit+0)
;buttons.c,68 :: 		setExternalInterrupt(INT0_DEVICE, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_setExternalInterrupt
;buttons.c,69 :: 		setExternalInterrupt(INT1_DEVICE, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_setExternalInterrupt
;buttons.c,70 :: 		setExternalInterrupt(INT2_DEVICE, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_setExternalInterrupt
;buttons.c,71 :: 		setExternalInterrupt(INT4_DEVICE, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_setExternalInterrupt
;buttons.c,72 :: 		}
L_end_Buttons_init:
	POP	W11
	POP	W10
	RETURN
; end of _Buttons_init

_Buttons_protractPress:

;buttons.c,78 :: 		void Buttons_protractPress(unsigned char button, unsigned int milliseconds) {
;buttons.c,79 :: 		if (!Buttons_isPressureProtracted()) {
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__Buttons_protractPress61
	GOTO	L_Buttons_protractPress21
L__Buttons_protractPress61:
;buttons.c,80 :: 		buttons_pressureProtraction = milliseconds;
	MOV	W11, _buttons_pressureProtraction
;buttons.c,81 :: 		buttons_pressureProtractionButton = button;
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	W10, [W0]
;buttons.c,82 :: 		buttons_pressureProtractionFlag = TRUE;
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;buttons.c,83 :: 		}
L_Buttons_protractPress21:
;buttons.c,84 :: 		}
L_end_Buttons_protractPress:
	RETURN
; end of _Buttons_protractPress

_Buttons_tick:

;buttons.c,86 :: 		void Buttons_tick(void) {
;buttons.c,87 :: 		if (buttons_pressureProtraction > 0) {
	MOV	_buttons_pressureProtraction, W0
	CP	W0, #0
	BRA GTU	L__Buttons_tick63
	GOTO	L_Buttons_tick22
L__Buttons_tick63:
;buttons.c,88 :: 		buttons_pressureProtraction -= 1;
	MOV	#1, W1
	MOV	#lo_addr(_buttons_pressureProtraction), W0
	SUBR	W1, [W0], [W0]
;buttons.c,89 :: 		if (buttons_pressureProtraction == 0) {
	MOV	_buttons_pressureProtraction, W0
	CP	W0, #0
	BRA Z	L__Buttons_tick64
	GOTO	L_Buttons_tick23
L__Buttons_tick64:
;buttons.c,90 :: 		switch (buttons_pressureProtractionButton) {
	GOTO	L_Buttons_tick24
;buttons.c,91 :: 		case BUTTON_R1:
L_Buttons_tick26:
;buttons.c,92 :: 		button_onR1Down();
	CALL	_button_onR1Down
;buttons.c,93 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,94 :: 		case BUTTON_R2:
L_Buttons_tick27:
;buttons.c,95 :: 		button_onR2Down();
	CALL	_button_onR2Down
;buttons.c,96 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,97 :: 		case BUTTON_R3:
L_Buttons_tick28:
;buttons.c,98 :: 		button_onR3Down();
	CALL	_button_onR3Down
;buttons.c,99 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,100 :: 		case BUTTON_L1:
L_Buttons_tick29:
;buttons.c,101 :: 		button_onL1Down();
	CALL	_button_onL1Down
;buttons.c,102 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,103 :: 		case BUTTON_L2:
L_Buttons_tick30:
;buttons.c,104 :: 		button_onL2Down();
	CALL	_button_onL2Down
;buttons.c,105 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,106 :: 		case BUTTON_L3:
L_Buttons_tick31:
;buttons.c,107 :: 		button_onL3Down();
	CALL	_button_onL3Down
;buttons.c,108 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,109 :: 		case BUTTON_BL:
L_Buttons_tick32:
;buttons.c,110 :: 		button_onBLDown();
	CALL	_button_onBLDown
;buttons.c,111 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,112 :: 		case BUTTON_BR:
L_Buttons_tick33:
;buttons.c,113 :: 		button_onBRDown();
	CALL	_button_onBRDown
;buttons.c,114 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,115 :: 		default:
L_Buttons_tick34:
;buttons.c,116 :: 		break;
	GOTO	L_Buttons_tick25
;buttons.c,117 :: 		}
L_Buttons_tick24:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Buttons_tick65
	GOTO	L_Buttons_tick26
L__Buttons_tick65:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Buttons_tick66
	GOTO	L_Buttons_tick27
L__Buttons_tick66:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Buttons_tick67
	GOTO	L_Buttons_tick28
L__Buttons_tick67:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__Buttons_tick68
	GOTO	L_Buttons_tick29
L__Buttons_tick68:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__Buttons_tick69
	GOTO	L_Buttons_tick30
L__Buttons_tick69:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__Buttons_tick70
	GOTO	L_Buttons_tick31
L__Buttons_tick70:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__Buttons_tick71
	GOTO	L_Buttons_tick32
L__Buttons_tick71:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Buttons_tick72
	GOTO	L_Buttons_tick33
L__Buttons_tick72:
	GOTO	L_Buttons_tick34
L_Buttons_tick25:
;buttons.c,118 :: 		} else {
	GOTO	L_Buttons_tick35
L_Buttons_tick23:
;buttons.c,119 :: 		switch (buttons_pressureProtractionButton) {
	GOTO	L_Buttons_tick36
;buttons.c,120 :: 		case BUTTON_R1:
L_Buttons_tick38:
;buttons.c,121 :: 		if (BUTTON_R1_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RB9_bit, BitPos(RB9_bit+0)
	GOTO	L_Buttons_tick39
;buttons.c,122 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,123 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,124 :: 		}
L_Buttons_tick39:
;buttons.c,125 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,126 :: 		case BUTTON_R2:
L_Buttons_tick40:
;buttons.c,127 :: 		if (BUTTON_R2_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RB10_bit, BitPos(RB10_bit+0)
	GOTO	L_Buttons_tick41
;buttons.c,128 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,129 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,130 :: 		}
L_Buttons_tick41:
;buttons.c,131 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,132 :: 		case BUTTON_R3:
L_Buttons_tick42:
;buttons.c,133 :: 		if (BUTTON_R3_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RG3_bit, BitPos(RG3_bit+0)
	GOTO	L_Buttons_tick43
;buttons.c,134 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,135 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,136 :: 		}
L_Buttons_tick43:
;buttons.c,137 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,138 :: 		case BUTTON_L1:
L_Buttons_tick44:
;buttons.c,139 :: 		if (BUTTON_L1_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RB11_bit, BitPos(RB11_bit+0)
	GOTO	L_Buttons_tick45
;buttons.c,140 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,141 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,142 :: 		}
L_Buttons_tick45:
;buttons.c,143 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,144 :: 		case BUTTON_L2:
L_Buttons_tick46:
;buttons.c,145 :: 		if (BUTTON_L2_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RB12_bit, BitPos(RB12_bit+0)
	GOTO	L_Buttons_tick47
;buttons.c,146 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,147 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,148 :: 		}
L_Buttons_tick47:
;buttons.c,149 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,150 :: 		case BUTTON_L3:
L_Buttons_tick48:
;buttons.c,151 :: 		if (BUTTON_L3_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RG2_bit, BitPos(RG2_bit+0)
	GOTO	L_Buttons_tick49
;buttons.c,152 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,153 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,154 :: 		}
L_Buttons_tick49:
;buttons.c,155 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,156 :: 		case BUTTON_BL:
L_Buttons_tick50:
;buttons.c,157 :: 		if (BUTTON_BL_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_Buttons_tick51
;buttons.c,158 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,159 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,160 :: 		}
L_Buttons_tick51:
;buttons.c,161 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,162 :: 		case BUTTON_BR:
L_Buttons_tick52:
;buttons.c,163 :: 		if (BUTTON_BR_Pin != BUTTON_ACTIVE_STATE) {
	BTSS	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_Buttons_tick53
;buttons.c,164 :: 		buttons_pressureProtraction = 0;
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,165 :: 		Buttons_clearPressureProtraction();
	CALL	_Buttons_clearPressureProtraction
;buttons.c,166 :: 		}
L_Buttons_tick53:
;buttons.c,167 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,168 :: 		default:
L_Buttons_tick54:
;buttons.c,169 :: 		break;
	GOTO	L_Buttons_tick37
;buttons.c,170 :: 		}
L_Buttons_tick36:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Buttons_tick73
	GOTO	L_Buttons_tick38
L__Buttons_tick73:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Buttons_tick74
	GOTO	L_Buttons_tick40
L__Buttons_tick74:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Buttons_tick75
	GOTO	L_Buttons_tick42
L__Buttons_tick75:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__Buttons_tick76
	GOTO	L_Buttons_tick44
L__Buttons_tick76:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__Buttons_tick77
	GOTO	L_Buttons_tick46
L__Buttons_tick77:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__Buttons_tick78
	GOTO	L_Buttons_tick48
L__Buttons_tick78:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__Buttons_tick79
	GOTO	L_Buttons_tick50
L__Buttons_tick79:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Buttons_tick80
	GOTO	L_Buttons_tick52
L__Buttons_tick80:
	GOTO	L_Buttons_tick54
L_Buttons_tick37:
;buttons.c,171 :: 		}
L_Buttons_tick35:
;buttons.c,172 :: 		}
L_Buttons_tick22:
;buttons.c,173 :: 		}
L_end_Buttons_tick:
	RETURN
; end of _Buttons_tick

_Buttons_isPressureProtracted:

;buttons.c,175 :: 		char Buttons_isPressureProtracted(void) {
;buttons.c,176 :: 		return buttons_pressureProtractionFlag;
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W0
	MOV.B	[W0], W0
;buttons.c,177 :: 		}
L_end_Buttons_isPressureProtracted:
	RETURN
; end of _Buttons_isPressureProtracted

_Buttons_clearPressureProtraction:

;buttons.c,179 :: 		void Buttons_clearPressureProtraction(void) {
;buttons.c,180 :: 		buttons_pressureProtractionFlag = FALSE;
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;buttons.c,181 :: 		}
L_end_Buttons_clearPressureProtraction:
	RETURN
; end of _Buttons_clearPressureProtraction
