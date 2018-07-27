
_dEbb_printNotification:

;d_ebb.c,28 :: 		void dEbb_printNotification(void){
;d_ebb.c,29 :: 		switch (dEbb_value){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	GOTO	L_dEbb_printNotification0
;d_ebb.c,30 :: 		case -7:
L_dEbb_printNotification2:
;d_ebb.c,31 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -7", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,32 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,33 :: 		case -6:
L_dEbb_printNotification3:
;d_ebb.c,34 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -6", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,35 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,36 :: 		case -5:
L_dEbb_printNotification4:
;d_ebb.c,37 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -5", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr3_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,38 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,39 :: 		case -4:
L_dEbb_printNotification5:
;d_ebb.c,40 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -4", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr4_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,41 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,42 :: 		case -3:
L_dEbb_printNotification6:
;d_ebb.c,43 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr5_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,44 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,45 :: 		case -2:
L_dEbb_printNotification7:
;d_ebb.c,46 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr6_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,47 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,48 :: 		case -1:
L_dEbb_printNotification8:
;d_ebb.c,49 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr7_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,50 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,51 :: 		case 0:
L_dEbb_printNotification9:
;d_ebb.c,52 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 0", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr8_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,53 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,54 :: 		case 1:
L_dEbb_printNotification10:
;d_ebb.c,55 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr9_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,56 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,57 :: 		case 2:
L_dEbb_printNotification11:
;d_ebb.c,58 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr10_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,59 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,60 :: 		case 3:
L_dEbb_printNotification12:
;d_ebb.c,61 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr11_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,62 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,63 :: 		case 4:
L_dEbb_printNotification13:
;d_ebb.c,64 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 4", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr12_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,65 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,66 :: 		case 5:
L_dEbb_printNotification14:
;d_ebb.c,67 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 5", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr13_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,68 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,69 :: 		case 6:
L_dEbb_printNotification15:
;d_ebb.c,70 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 6", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr14_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,71 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,72 :: 		case 7:
L_dEbb_printNotification16:
;d_ebb.c,73 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 7", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr15_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,74 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,75 :: 		default:
L_dEbb_printNotification17:
;d_ebb.c,76 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,77 :: 		}
L_dEbb_printNotification0:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#249, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification40
	GOTO	L_dEbb_printNotification2
L__dEbb_printNotification40:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#250, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification41
	GOTO	L_dEbb_printNotification3
L__dEbb_printNotification41:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#251, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification42
	GOTO	L_dEbb_printNotification4
L__dEbb_printNotification42:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification43
	GOTO	L_dEbb_printNotification5
L__dEbb_printNotification43:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification44
	GOTO	L_dEbb_printNotification6
L__dEbb_printNotification44:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#254, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification45
	GOTO	L_dEbb_printNotification7
L__dEbb_printNotification45:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification46
	GOTO	L_dEbb_printNotification8
L__dEbb_printNotification46:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dEbb_printNotification47
	GOTO	L_dEbb_printNotification9
L__dEbb_printNotification47:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dEbb_printNotification48
	GOTO	L_dEbb_printNotification10
L__dEbb_printNotification48:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dEbb_printNotification49
	GOTO	L_dEbb_printNotification11
L__dEbb_printNotification49:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__dEbb_printNotification50
	GOTO	L_dEbb_printNotification12
L__dEbb_printNotification50:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__dEbb_printNotification51
	GOTO	L_dEbb_printNotification13
L__dEbb_printNotification51:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__dEbb_printNotification52
	GOTO	L_dEbb_printNotification14
L__dEbb_printNotification52:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__dEbb_printNotification53
	GOTO	L_dEbb_printNotification15
L__dEbb_printNotification53:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__dEbb_printNotification54
	GOTO	L_dEbb_printNotification16
L__dEbb_printNotification54:
	GOTO	L_dEbb_printNotification17
L_dEbb_printNotification1:
;d_ebb.c,78 :: 		}
L_end_dEbb_printNotification:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_printNotification

_dEbb_setEbbValueFromCAN:

;d_ebb.c,80 :: 		void dEbb_setEbbValueFromCAN(unsigned int value){
;d_ebb.c,81 :: 		dEbb_Value = (int)(value - EBB_DAGO_OFFSET);
	PUSH	W10
	PUSH	W11
	SUB	W10, #8, W1
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	W1, [W0]
;d_ebb.c,82 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) (dEbb_value));
	SE	W1, W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,84 :: 		}
L_end_dEbb_setEbbValueFromCAN:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_setEbbValueFromCAN

_dEbb_propagateEbbChange:

;d_ebb.c,87 :: 		void dEbb_propagateEbbChange(void) {
;d_ebb.c,88 :: 		switch (dEbb_state){
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange18
;d_ebb.c,89 :: 		case EBB_IS_CALIBRATING:
L_dEbb_propagateEbbChange20:
;d_ebb.c,90 :: 		dd_Indicator_setStringValue(EBB, "=0=");
	MOV	#lo_addr(?lstr16_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,91 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,92 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_propagateEbbChange21:
;d_ebb.c,93 :: 		dd_Indicator_setStringValue(EBB, "/");
	MOV	#lo_addr(?lstr17_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,94 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,95 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_propagateEbbChange22:
;d_ebb.c,96 :: 		dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
	MOV	#lo_addr(?lstr18_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,97 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,98 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_propagateEbbChange23:
;d_ebb.c,99 :: 		dd_Indicator_setStringValue(EBB, "...");
	MOV	#lo_addr(?lstr19_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,100 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,101 :: 		default:
L_dEbb_propagateEbbChange24:
;d_ebb.c,102 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) (dEbb_value));
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,103 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,104 :: 		}
L_dEbb_propagateEbbChange18:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange57
	GOTO	L_dEbb_propagateEbbChange20
L__dEbb_propagateEbbChange57:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange58
	GOTO	L_dEbb_propagateEbbChange21
L__dEbb_propagateEbbChange58:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange59
	GOTO	L_dEbb_propagateEbbChange22
L__dEbb_propagateEbbChange59:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange60
	GOTO	L_dEbb_propagateEbbChange23
L__dEbb_propagateEbbChange60:
	GOTO	L_dEbb_propagateEbbChange24
L_dEbb_propagateEbbChange19:
;d_ebb.c,105 :: 		}
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_propagateValue:

;d_ebb.c,107 :: 		void dEbb_propagateValue(signed char value){
;d_ebb.c,108 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, (int)(value + EBB_DAGO_OFFSET));
	PUSH	W10
	PUSH	W11
	PUSH	W12
	SE	W10, W0
	ADD	W0, #8, W0
	PUSH	W10
	MOV	W0, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
	POP	W10
;d_ebb.c,109 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) (value));
	SE	W10, W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,110 :: 		}
L_end_dEbb_propagateValue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateValue

_dEbb_move:

;d_ebb.c,112 :: 		void dEbb_move(signed char movements){
;d_ebb.c,114 :: 		if(!dEbb_errorOccurred){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dEbb_errorOccurred), W0
	CP0	[W0]
	BRA Z	L__dEbb_move63
	GOTO	L_dEbb_move25
L__dEbb_move63:
;d_ebb.c,115 :: 		value = dEbb_value - movements;
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W1
	SE	W10, W0
	SUB	W1, W0, W0
; value start address is: 2 (W1)
	MOV.B	W0, W1
;d_ebb.c,116 :: 		if(value > EBB_MAX_VALUE){
	CP.B	W0, #3
	BRA GT	L__dEbb_move64
	GOTO	L_dEbb_move26
L__dEbb_move64:
;d_ebb.c,117 :: 		value = EBB_MAX_VALUE;
	MOV.B	#3, W1
;d_ebb.c,118 :: 		} else if(value < EBB_MIN_VALUE){
	GOTO	L_dEbb_move27
L_dEbb_move26:
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA LT	L__dEbb_move65
	GOTO	L__dEbb_move35
L__dEbb_move65:
; value end address is: 2 (W1)
;d_ebb.c,119 :: 		value = EBB_MIN_VALUE;
; value start address is: 0 (W0)
	MOV.B	#253, W0
; value end address is: 0 (W0)
	MOV.B	W0, W1
;d_ebb.c,120 :: 		}
	GOTO	L_dEbb_move28
L__dEbb_move35:
;d_ebb.c,118 :: 		} else if(value < EBB_MIN_VALUE){
;d_ebb.c,120 :: 		}
L_dEbb_move28:
; value start address is: 2 (W1)
; value end address is: 2 (W1)
L_dEbb_move27:
;d_ebb.c,121 :: 		dEbb_Value = value;
; value start address is: 2 (W1)
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	W1, [W0]
;d_ebb.c,122 :: 		dEbb_propagateValue(value);
	MOV.B	W1, W10
; value end address is: 2 (W1)
	CALL	_dEbb_propagateValue
;d_ebb.c,123 :: 		}else
	GOTO	L_dEbb_move29
L_dEbb_move25:
;d_ebb.c,124 :: 		dd_Indicator_setStringValueP(EBB, "/");
	MOV	#lo_addr(?lstr20_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValueP
L_dEbb_move29:
;d_ebb.c,125 :: 		}
L_end_dEbb_move:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_move

_dEbb_init:

;d_ebb.c,127 :: 		void dEbb_init(void){
;d_ebb.c,129 :: 		}
L_end_dEbb_init:
	RETURN
; end of _dEbb_init

_dEbb_setPositionZero:

;d_ebb.c,131 :: 		void dEbb_setPositionZero(void){
;d_ebb.c,132 :: 		if(!dEbb_errorOccurred){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_dEbb_errorOccurred), W0
	CP0	[W0]
	BRA Z	L__dEbb_setPositionZero68
	GOTO	L_dEbb_setPositionZero30
L__dEbb_setPositionZero68:
;d_ebb.c,133 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, EBB_SET_ZERO);
	MOV	#100, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_ebb.c,134 :: 		dEbb_Value = 0;
	MOV	#lo_addr(_dEbb_value), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_ebb.c,135 :: 		dd_GraphicController_fireTimedNotification(1000, "CALIBRATE", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr21_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,136 :: 		dEbb_isSetZero = TRUE;
	MOV	#1, W0
	MOV	W0, _dEbb_isSetZero
;d_ebb.c,137 :: 		}
L_dEbb_setPositionZero30:
;d_ebb.c,138 :: 		}
L_end_dEbb_setPositionZero:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_setPositionZero

_dEbb_calibrationState:

;d_ebb.c,140 :: 		void dEbb_calibrationState(unsigned int value){
;d_ebb.c,141 :: 		if(dEbb_isSetZero == TRUE && value == TRUE){
	MOV	_dEbb_isSetZero, W0
	CP	W0, #1
	BRA Z	L__dEbb_calibrationState70
	GOTO	L__dEbb_calibrationState38
L__dEbb_calibrationState70:
	CP	W10, #1
	BRA Z	L__dEbb_calibrationState71
	GOTO	L__dEbb_calibrationState37
L__dEbb_calibrationState71:
L__dEbb_calibrationState36:
;d_ebb.c,142 :: 		dEbb_isSetZero = FALSE;
	CLR	W0
	MOV	W0, _dEbb_isSetZero
;d_ebb.c,141 :: 		if(dEbb_isSetZero == TRUE && value == TRUE){
L__dEbb_calibrationState38:
L__dEbb_calibrationState37:
;d_ebb.c,144 :: 		}
L_end_dEbb_calibrationState:
	RETURN
; end of _dEbb_calibrationState

_dEbb_error:

;d_ebb.c,146 :: 		void dEbb_error(unsigned int value){
;d_ebb.c,147 :: 		if(value == EBB_ERROR){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CP	W10, #1
	BRA Z	L__dEbb_error73
	GOTO	L_dEbb_error34
L__dEbb_error73:
;d_ebb.c,148 :: 		dEbb_errorOccurred = EBB_ERROR;
	MOV	#1, W0
	MOV	W0, _dEbb_errorOccurred
;d_ebb.c,149 :: 		dd_GraphicController_fireTimedNotification(1000, "EBB ERROR", ERROR);
	MOV.B	#2, W12
	MOV	#lo_addr(?lstr22_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,150 :: 		dd_Indicator_setStringValueP(EBB, "/");
	MOV	#lo_addr(?lstr23_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValueP
;d_ebb.c,151 :: 		}
L_dEbb_error34:
;d_ebb.c,152 :: 		}
L_end_dEbb_error:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_error

_dEbb_tick:

;d_ebb.c,201 :: 		void dEbb_tick(void) {
;d_ebb.c,228 :: 		}
L_end_dEbb_tick:
	RETURN
; end of _dEbb_tick
