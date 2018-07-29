
_button_onBRDown:

;d_controls.c,31 :: 		void button_onGearUp() {
;d_controls.c,33 :: 		if (dGear_canGearUp() || dGear_isNeutralSet()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_canGearUp
	CP0.B	W0
	BRA Z	L__button_onBRDown58
	GOTO	L__button_onBRDown53
L__button_onBRDown58:
	CALL	_dGear_isNeutralSet
	CP0.B	W0
	BRA Z	L__button_onBRDown59
	GOTO	L__button_onBRDown52
L__button_onBRDown59:
	GOTO	L_button_onBRDown2
L__button_onBRDown53:
L__button_onBRDown52:
;d_controls.c,34 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_UP);
	MOV	#400, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_controls.c,35 :: 		} else {
	GOTO	L_button_onBRDown3
L_button_onBRDown2:
;d_controls.c,37 :: 		}
L_button_onBRDown3:
;d_controls.c,38 :: 		}
L_end_button_onBRDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onBRDown

_button_onBLDown:

;d_controls.c,40 :: 		void button_onGearDown() {
;d_controls.c,42 :: 		if (dGear_canGearDown() || dGear_isNeutralSet()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_canGearDown
	CP0.B	W0
	BRA Z	L__button_onBLDown61
	GOTO	L__button_onBLDown56
L__button_onBLDown61:
	CALL	_dGear_isNeutralSet
	CP0.B	W0
	BRA Z	L__button_onBLDown62
	GOTO	L__button_onBLDown55
L__button_onBLDown62:
	GOTO	L_button_onBLDown6
L__button_onBLDown56:
L__button_onBLDown55:
;d_controls.c,43 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_DOWN);
	MOV	#200, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_controls.c,44 :: 		} else {
	GOTO	L_button_onBLDown7
L_button_onBLDown6:
;d_controls.c,46 :: 		}
L_button_onBLDown7:
;d_controls.c,47 :: 		}
L_end_button_onBLDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onBLDown

_button_onCDown:

;d_controls.c,49 :: 		void button_onStart() {
;d_controls.c,50 :: 		if (getExternalInterruptEdge(CenterInterrupt) == NEGATIVE_EDGE) {
	PUSH	W10
	MOV.B	#8, W10
	CALL	_getExternalInterruptEdge
	CP.B	W0, #1
	BRA Z	L__button_onCDown64
	GOTO	L_button_onCDown8
L__button_onCDown64:
;d_controls.c,51 :: 		dSignalLed_set(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_controls.c,52 :: 		dStart_switchOn();
	CALL	_dStart_switchOn
;d_controls.c,53 :: 		switchExternalInterruptEdge(CenterInterrupt);
	MOV.B	#8, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,54 :: 		} else {
	GOTO	L_button_onCDown9
L_button_onCDown8:
;d_controls.c,55 :: 		dSignalLed_unset(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_controls.c,56 :: 		dStart_switchOff();
	CALL	_dStart_switchOff
;d_controls.c,57 :: 		switchExternalInterruptEdge(CenterInterrupt);
	MOV.B	#8, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,58 :: 		}
L_button_onCDown9:
;d_controls.c,59 :: 		}
L_end_button_onCDown:
	POP	W10
	RETURN
; end of _button_onCDown

_button_onL3Down:

;d_controls.c,61 :: 		void button_onMenuLeft() {
;d_controls.c,63 :: 		currentOperatingMode = d_UI_getOperatingMode();
	PUSH	W10
	CALL	_d_UI_getOperatingMode
; currentOperatingMode start address is: 0 (W0)
;d_controls.c,64 :: 		switch(currentOperatingMode){
	GOTO	L_button_onL3Down10
; currentOperatingMode end address is: 0 (W0)
;d_controls.c,65 :: 		case ACC_MODE:
L_button_onL3Down12:
;d_controls.c,66 :: 		d_UI_setOperatingMode(CRUISE_MODE);
	MOV.B	#3, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,67 :: 		break;
	GOTO	L_button_onL3Down11
;d_controls.c,68 :: 		case CRUISE_MODE:
L_button_onL3Down13:
;d_controls.c,69 :: 		d_UI_setOperatingMode(DEBUG_MODE);
	MOV.B	#2, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,70 :: 		break;
	GOTO	L_button_onL3Down11
;d_controls.c,71 :: 		case DEBUG_MODE:
L_button_onL3Down14:
;d_controls.c,72 :: 		d_UI_setOperatingMode(SETTINGS_MODE);
	MOV.B	#1, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,73 :: 		break;
	GOTO	L_button_onL3Down11
;d_controls.c,74 :: 		case SETTINGS_MODE:
L_button_onL3Down15:
;d_controls.c,75 :: 		d_UI_setOperatingMode(BOARD_DEBUG_MODE);
	CLR	W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,76 :: 		break;
	GOTO	L_button_onL3Down11
;d_controls.c,77 :: 		default:
L_button_onL3Down16:
;d_controls.c,78 :: 		break;
	GOTO	L_button_onL3Down11
;d_controls.c,79 :: 		}
L_button_onL3Down10:
; currentOperatingMode start address is: 0 (W0)
	CP.B	W0, #4
	BRA NZ	L__button_onL3Down66
	GOTO	L_button_onL3Down12
L__button_onL3Down66:
	CP.B	W0, #3
	BRA NZ	L__button_onL3Down67
	GOTO	L_button_onL3Down13
L__button_onL3Down67:
	CP.B	W0, #2
	BRA NZ	L__button_onL3Down68
	GOTO	L_button_onL3Down14
L__button_onL3Down68:
	CP.B	W0, #1
	BRA NZ	L__button_onL3Down69
	GOTO	L_button_onL3Down15
L__button_onL3Down69:
; currentOperatingMode end address is: 0 (W0)
	GOTO	L_button_onL3Down16
L_button_onL3Down11:
;d_controls.c,80 :: 		}
L_end_button_onL3Down:
	POP	W10
	RETURN
; end of _button_onL3Down

_button_onR3Down:

;d_controls.c,83 :: 		void button_onMenuRight() {
;d_controls.c,85 :: 		currentOperatingMode = d_UI_getOperatingMode();
	PUSH	W10
	CALL	_d_UI_getOperatingMode
; currentOperatingMode start address is: 0 (W0)
;d_controls.c,86 :: 		switch(currentOperatingMode){
	GOTO	L_button_onR3Down17
; currentOperatingMode end address is: 0 (W0)
;d_controls.c,87 :: 		case BOARD_DEBUG_MODE:
L_button_onR3Down19:
;d_controls.c,88 :: 		d_UI_setOperatingMode(SETTINGS_MODE);
	MOV.B	#1, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,89 :: 		break;
	GOTO	L_button_onR3Down18
;d_controls.c,90 :: 		case SETTINGS_MODE:
L_button_onR3Down20:
;d_controls.c,91 :: 		d_UI_setOperatingMode(DEBUG_MODE);
	MOV.B	#2, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,92 :: 		break;
	GOTO	L_button_onR3Down18
;d_controls.c,93 :: 		case DEBUG_MODE:
L_button_onR3Down21:
;d_controls.c,94 :: 		d_UI_setOperatingMode(CRUISE_MODE);
	MOV.B	#3, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,95 :: 		break;
	GOTO	L_button_onR3Down18
;d_controls.c,96 :: 		case CRUISE_MODE:
L_button_onR3Down22:
;d_controls.c,97 :: 		d_UI_setOperatingMode(ACC_MODE);
	MOV.B	#4, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,98 :: 		break;
	GOTO	L_button_onR3Down18
;d_controls.c,99 :: 		default:
L_button_onR3Down23:
;d_controls.c,100 :: 		break;
	GOTO	L_button_onR3Down18
;d_controls.c,101 :: 		}
L_button_onR3Down17:
; currentOperatingMode start address is: 0 (W0)
	CP.B	W0, #0
	BRA NZ	L__button_onR3Down71
	GOTO	L_button_onR3Down19
L__button_onR3Down71:
	CP.B	W0, #1
	BRA NZ	L__button_onR3Down72
	GOTO	L_button_onR3Down20
L__button_onR3Down72:
	CP.B	W0, #2
	BRA NZ	L__button_onR3Down73
	GOTO	L_button_onR3Down21
L__button_onR3Down73:
	CP.B	W0, #3
	BRA NZ	L__button_onR3Down74
	GOTO	L_button_onR3Down22
L__button_onR3Down74:
; currentOperatingMode end address is: 0 (W0)
	GOTO	L_button_onR3Down23
L_button_onR3Down18:
;d_controls.c,102 :: 		}
L_end_button_onR3Down:
	POP	W10
	RETURN
; end of _button_onR3Down

_button_onL2Down:

;d_controls.c,104 :: 		void button_onNeutral() {
;d_controls.c,105 :: 		if (!dGear_isNeutralSet()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_isNeutralSet
	CP0.B	W0
	BRA Z	L__button_onL2Down76
	GOTO	L_button_onL2Down24
L__button_onL2Down76:
;d_controls.c,106 :: 		if (dGear_get() == 1) {
	CALL	_dGear_get
	CP.B	W0, #1
	BRA Z	L__button_onL2Down77
	GOTO	L_button_onL2Down25
L__button_onL2Down77:
;d_controls.c,107 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_UP);
	MOV	#50, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_controls.c,108 :: 		} else if (dGear_get() == 2) {
	GOTO	L_button_onL2Down26
L_button_onL2Down25:
	CALL	_dGear_get
	CP.B	W0, #2
	BRA Z	L__button_onL2Down78
	GOTO	L_button_onL2Down27
L__button_onL2Down78:
;d_controls.c,109 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_DOWN);
	MOV	#100, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_controls.c,110 :: 		}
L_button_onL2Down27:
L_button_onL2Down26:
;d_controls.c,111 :: 		}
L_button_onL2Down24:
;d_controls.c,112 :: 		}
L_end_button_onL2Down:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onL2Down

_button_onR1Down:

;d_controls.c,114 :: 		void button_onMenuUp() {
;d_controls.c,116 :: 		currentOperatingMode = d_UI_getOperatingMode();
	CALL	_d_UI_getOperatingMode
; currentOperatingMode start address is: 0 (W0)
;d_controls.c,117 :: 		switch(currentOperatingMode){
	GOTO	L_button_onR1Down28
; currentOperatingMode end address is: 0 (W0)
;d_controls.c,118 :: 		case BOARD_DEBUG_MODE:
L_button_onR1Down30:
;d_controls.c,119 :: 		case DEBUG_MODE:
L_button_onR1Down31:
;d_controls.c,120 :: 		case SETTINGS_MODE:
L_button_onR1Down32:
;d_controls.c,121 :: 		dd_Menu_selectUp();
	CALL	_dd_Menu_selectUp
;d_controls.c,122 :: 		break;
	GOTO	L_button_onR1Down29
;d_controls.c,123 :: 		case CRUISE_MODE:
L_button_onR1Down33:
;d_controls.c,124 :: 		case ACC_MODE:
L_button_onR1Down34:
;d_controls.c,125 :: 		dHardReset_reset();
	CALL	_dHardReset_reset
;d_controls.c,126 :: 		break;
	GOTO	L_button_onR1Down29
;d_controls.c,127 :: 		default:
L_button_onR1Down35:
;d_controls.c,128 :: 		return;
	GOTO	L_end_button_onR1Down
;d_controls.c,129 :: 		}
L_button_onR1Down28:
; currentOperatingMode start address is: 0 (W0)
	CP.B	W0, #0
	BRA NZ	L__button_onR1Down80
	GOTO	L_button_onR1Down30
L__button_onR1Down80:
	CP.B	W0, #2
	BRA NZ	L__button_onR1Down81
	GOTO	L_button_onR1Down31
L__button_onR1Down81:
	CP.B	W0, #1
	BRA NZ	L__button_onR1Down82
	GOTO	L_button_onR1Down32
L__button_onR1Down82:
	CP.B	W0, #3
	BRA NZ	L__button_onR1Down83
	GOTO	L_button_onR1Down33
L__button_onR1Down83:
	CP.B	W0, #4
	BRA NZ	L__button_onR1Down84
	GOTO	L_button_onR1Down34
L__button_onR1Down84:
; currentOperatingMode end address is: 0 (W0)
	GOTO	L_button_onR1Down35
L_button_onR1Down29:
;d_controls.c,130 :: 		}
L_end_button_onR1Down:
	RETURN
; end of _button_onR1Down

_button_onR2Down:

;d_controls.c,133 :: 		void button_onMenuDown() {
;d_controls.c,135 :: 		currentOperatingMode = d_UI_getOperatingMode();
	CALL	_d_UI_getOperatingMode
; currentOperatingMode start address is: 0 (W0)
;d_controls.c,136 :: 		switch(currentOperatingMode){
	GOTO	L_button_onR2Down36
; currentOperatingMode end address is: 0 (W0)
;d_controls.c,137 :: 		case BOARD_DEBUG_MODE:
L_button_onR2Down38:
;d_controls.c,138 :: 		case SETTINGS_MODE:
L_button_onR2Down39:
;d_controls.c,139 :: 		case DEBUG_MODE:
L_button_onR2Down40:
;d_controls.c,140 :: 		dd_Menu_selectDown();
	CALL	_dd_Menu_selectDown
;d_controls.c,141 :: 		break;
	GOTO	L_button_onR2Down37
;d_controls.c,142 :: 		case CRUISE_MODE:
L_button_onR2Down41:
;d_controls.c,143 :: 		case ACC_MODE:
L_button_onR2Down42:
;d_controls.c,144 :: 		d_traction_control_increase();
	CALL	_d_traction_control_increase
;d_controls.c,145 :: 		break;
	GOTO	L_button_onR2Down37
;d_controls.c,146 :: 		default:
L_button_onR2Down43:
;d_controls.c,147 :: 		return;
	GOTO	L_end_button_onR2Down
;d_controls.c,148 :: 		}
L_button_onR2Down36:
; currentOperatingMode start address is: 0 (W0)
	CP.B	W0, #0
	BRA NZ	L__button_onR2Down86
	GOTO	L_button_onR2Down38
L__button_onR2Down86:
	CP.B	W0, #1
	BRA NZ	L__button_onR2Down87
	GOTO	L_button_onR2Down39
L__button_onR2Down87:
	CP.B	W0, #2
	BRA NZ	L__button_onR2Down88
	GOTO	L_button_onR2Down40
L__button_onR2Down88:
	CP.B	W0, #3
	BRA NZ	L__button_onR2Down89
	GOTO	L_button_onR2Down41
L__button_onR2Down89:
	CP.B	W0, #4
	BRA NZ	L__button_onR2Down90
	GOTO	L_button_onR2Down42
L__button_onR2Down90:
; currentOperatingMode end address is: 0 (W0)
	GOTO	L_button_onR2Down43
L_button_onR2Down37:
;d_controls.c,149 :: 		}
L_end_button_onR2Down:
	RETURN
; end of _button_onR2Down

_button_onL1Down:

;d_controls.c,151 :: 		void button_onMenuOk() {
;d_controls.c,153 :: 		currentOperatingMode = d_UI_getOperatingMode();
	PUSH	W10
	CALL	_d_UI_getOperatingMode
; currentOperatingMode start address is: 0 (W0)
;d_controls.c,154 :: 		switch(currentOperatingMode){
	GOTO	L_button_onL1Down44
; currentOperatingMode end address is: 0 (W0)
;d_controls.c,155 :: 		case DEBUG_MODE:
L_button_onL1Down46:
;d_controls.c,156 :: 		dDCU_switchAcquisition();
	CALL	_dDCU_switchAcquisition
;d_controls.c,157 :: 		case SETTINGS_MODE:
L_button_onL1Down47:
;d_controls.c,158 :: 		d_UI_onSettingsChange(RIGHT);
	MOV.B	#1, W10
	CALL	_d_UI_onSettingsChange
;d_controls.c,159 :: 		break;
	GOTO	L_button_onL1Down45
;d_controls.c,160 :: 		case CRUISE_MODE:
L_button_onL1Down48:
;d_controls.c,161 :: 		d_traction_control_decrease();
	CALL	_d_traction_control_decrease
;d_controls.c,162 :: 		break;
	GOTO	L_button_onL1Down45
;d_controls.c,163 :: 		case ACC_MODE:
L_button_onL1Down49:
;d_controls.c,164 :: 		dAcc_requestAction();
	CALL	_dAcc_requestAction
;d_controls.c,165 :: 		break;
	GOTO	L_button_onL1Down45
;d_controls.c,166 :: 		default:
L_button_onL1Down50:
;d_controls.c,167 :: 		return;
	GOTO	L_end_button_onL1Down
;d_controls.c,168 :: 		}
L_button_onL1Down44:
; currentOperatingMode start address is: 0 (W0)
	CP.B	W0, #2
	BRA NZ	L__button_onL1Down92
	GOTO	L_button_onL1Down46
L__button_onL1Down92:
	CP.B	W0, #1
	BRA NZ	L__button_onL1Down93
	GOTO	L_button_onL1Down47
L__button_onL1Down93:
	CP.B	W0, #3
	BRA NZ	L__button_onL1Down94
	GOTO	L_button_onL1Down48
L__button_onL1Down94:
	CP.B	W0, #4
	BRA NZ	L__button_onL1Down95
	GOTO	L_button_onL1Down49
L__button_onL1Down95:
; currentOperatingMode end address is: 0 (W0)
	GOTO	L_button_onL1Down50
L_button_onL1Down45:
;d_controls.c,169 :: 		}
L_end_button_onL1Down:
	POP	W10
	RETURN
; end of _button_onL1Down
