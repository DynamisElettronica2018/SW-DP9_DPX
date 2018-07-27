
_dStart_switchOn:

;d_start.c,12 :: 		void dStart_switchOn(void) {
;d_start.c,13 :: 		dStart_isSwitchOnFlag = TRUE;
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_start.c,14 :: 		}
L_end_dStart_switchOn:
	RETURN
; end of _dStart_switchOn

_dStart_switchOff:

;d_start.c,16 :: 		void dStart_switchOff(void) {
;d_start.c,17 :: 		dStart_isSwitchOnFlag = FALSE;
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_start.c,18 :: 		}
L_end_dStart_switchOff:
	RETURN
; end of _dStart_switchOff

_dStart_isSwitchedOn:

;d_start.c,20 :: 		char dStart_isSwitchedOn(void) {
;d_start.c,21 :: 		return dStart_isSwitchOnFlag;
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W0
	MOV.B	[W0], W0
;d_start.c,22 :: 		}
L_end_dStart_isSwitchedOn:
	RETURN
; end of _dStart_isSwitchedOn

_dStart_sendStartMessage:

;d_start.c,24 :: 		void dStart_sendStartMessage(void) {
;d_start.c,25 :: 		Can_writeByte(SW_FIRE_GCU_ID, TRUE);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#1, W12
	MOV	#516, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_start.c,26 :: 		}
L_end_dStart_sendStartMessage:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dStart_sendStartMessage
