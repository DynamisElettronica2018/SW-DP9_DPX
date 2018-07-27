
_dAcc_init:

;d_acceleration.c,35 :: 		void dAcc_init(void) {
;d_acceleration.c,36 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,37 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,38 :: 		dAcc_timeToGo = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_timeToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,39 :: 		dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;
	CLR	W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,40 :: 		if (dHardReset_hasBeenReset())
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA NZ	L__dAcc_init13
	GOTO	L_dAcc_init0
L__dAcc_init13:
;d_acceleration.c,41 :: 		dAcc_resetOccurred = TRUE;
	MOV	#1, W0
	MOV	W0, _dAcc_resetOccurred
L_dAcc_init0:
;d_acceleration.c,42 :: 		}
L_end_dAcc_init:
	RETURN
; end of _dAcc_init

_dAcc_hasResetOccurred:

;d_acceleration.c,44 :: 		unsigned int dAcc_hasResetOccurred(void){
;d_acceleration.c,45 :: 		return dAcc_resetOccurred;
	MOV	_dAcc_resetOccurred, W0
;d_acceleration.c,46 :: 		}
L_end_dAcc_hasResetOccurred:
	RETURN
; end of _dAcc_hasResetOccurred

_dAcc_clearReset:

;d_acceleration.c,48 :: 		void dAcc_clearReset(void){
;d_acceleration.c,49 :: 		dAcc_resetOccurred = FALSE;
	CLR	W0
	MOV	W0, _dAcc_resetOccurred
;d_acceleration.c,50 :: 		}
L_end_dAcc_clearReset:
	RETURN
; end of _dAcc_clearReset

_dAcc_restartAcc:

;d_acceleration.c,52 :: 		void dAcc_restartAcc(void){
;d_acceleration.c,53 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,54 :: 		}
L_end_dAcc_restartAcc:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_restartAcc

_dAcc_startAutoAcceleration:

;d_acceleration.c,56 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,57 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration18
	GOTO	L_dAcc_startAutoAcceleration1
L__dAcc_startAutoAcceleration18:
;d_acceleration.c,58 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,59 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,60 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_ACCELERATION);
	MOV	#1, W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,61 :: 		}
L_dAcc_startAutoAcceleration1:
;d_acceleration.c,62 :: 		}
L_end_dAcc_startAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,64 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,65 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,66 :: 		dAcc_readyToGo = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,67 :: 		}
L_end_dAcc_startClutchRelease:
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_feedbackGCU:

;d_acceleration.c,69 :: 		void dAcc_feedbackGCU(unsigned int value){
;d_acceleration.c,70 :: 		if(d_UI_getOperatingMode() == ACC_MODE){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W10
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA Z	L__dAcc_feedbackGCU21
	GOTO	L_dAcc_feedbackGCU2
L__dAcc_feedbackGCU21:
;d_acceleration.c,71 :: 		if(value == COMMAND_START_ACCELERATION){
	CP	W10, #1
	BRA Z	L__dAcc_feedbackGCU22
	GOTO	L_dAcc_feedbackGCU3
L__dAcc_feedbackGCU22:
;d_acceleration.c,72 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,73 :: 		dAcc_GCUConfirmed = COMMAND_START_ACCELERATION;
	MOV	#1, W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,74 :: 		dd_GraphicController_fixNotification("STEADY");
	MOV	#lo_addr(?lstr1_d_acceleration), W10
	CALL	_dd_GraphicController_fixNotification
;d_acceleration.c,75 :: 		dAcc_startClutchRelease();
	CALL	_dAcc_startClutchRelease
;d_acceleration.c,76 :: 		} else if (value == COMMAND_START_CLUTCH_RELEASE){
	GOTO	L_dAcc_feedbackGCU4
L_dAcc_feedbackGCU3:
	CP	W10, #2
	BRA Z	L__dAcc_feedbackGCU23
	GOTO	L_dAcc_feedbackGCU5
L__dAcc_feedbackGCU23:
;d_acceleration.c,77 :: 		dAcc_GCUConfirmed = COMMAND_START_CLUTCH_RELEASE;
	MOV	#2, W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,78 :: 		dAcc_timeToGo = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_timeToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,79 :: 		dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr2_d_acceleration), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_acceleration.c,80 :: 		} else if (value == COMMAND_STOP_ACCELERATION){
	GOTO	L_dAcc_feedbackGCU6
L_dAcc_feedbackGCU5:
	CP	W10, #0
	BRA Z	L__dAcc_feedbackGCU24
	GOTO	L_dAcc_feedbackGCU7
L__dAcc_feedbackGCU24:
;d_acceleration.c,81 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,82 :: 		dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;
	CLR	W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,83 :: 		}
L_dAcc_feedbackGCU7:
L_dAcc_feedbackGCU6:
L_dAcc_feedbackGCU4:
;d_acceleration.c,84 :: 		}
L_dAcc_feedbackGCU2:
;d_acceleration.c,85 :: 		}
L_end_dAcc_feedbackGCU:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_feedbackGCU

_dAcc_stopAutoAcceleration:

;d_acceleration.c,87 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,88 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,89 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,90 :: 		dd_GraphicController_unsetOnScreenNotification();
	CALL	_dd_GraphicController_unsetOnScreenNotification
;d_acceleration.c,91 :: 		if (d_UI_getOperatingMode() == ACC_MODE){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA Z	L__dAcc_stopAutoAcceleration26
	GOTO	L_dAcc_stopAutoAcceleration8
L__dAcc_stopAutoAcceleration26:
;d_acceleration.c,92 :: 		d_UI_AccModeInit();
	CALL	_d_UI_AccModeInit
;d_acceleration.c,93 :: 		}
L_dAcc_stopAutoAcceleration8:
;d_acceleration.c,94 :: 		}
L_end_dAcc_stopAutoAcceleration:
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_stopAutoAccelerationFromSW:

;d_acceleration.c,96 :: 		void dAcc_stopAutoAccelerationFromSW(void){
;d_acceleration.c,97 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,98 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,99 :: 		}
L_end_dAcc_stopAutoAccelerationFromSW:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_stopAutoAccelerationFromSW

_dAcc_requestAction:

;d_acceleration.c,101 :: 		void dAcc_requestAction(){
;d_acceleration.c,102 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction29
	GOTO	L_dAcc_requestAction9
L__dAcc_requestAction29:
;d_acceleration.c,103 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;d_acceleration.c,104 :: 		}
	GOTO	L_dAcc_requestAction10
L_dAcc_requestAction9:
;d_acceleration.c,105 :: 		else if (dAcc_readyToGo){
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_requestAction30
	GOTO	L_dAcc_requestAction11
L__dAcc_requestAction30:
;d_acceleration.c,106 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_CLUTCH_RELEASE);
	MOV	#2, W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,107 :: 		dAcc_readyToGo = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,108 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,109 :: 		}
L_dAcc_requestAction11:
L_dAcc_requestAction10:
;d_acceleration.c,110 :: 		}
L_end_dAcc_requestAction:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_requestAction

_dAcc_isAutoAccelerationActive:

;d_acceleration.c,112 :: 		char dAcc_isAutoAccelerationActive(void) {
;d_acceleration.c,113 :: 		return dAcc_autoAcceleration;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	MOV.B	[W0], W0
;d_acceleration.c,114 :: 		}
L_end_dAcc_isAutoAccelerationActive:
	RETURN
; end of _dAcc_isAutoAccelerationActive

_dAcc_hasGCUConfirmed:

;d_acceleration.c,116 :: 		unsigned int dAcc_hasGCUConfirmed(void){
;d_acceleration.c,117 :: 		return dAcc_GCUConfirmed;
	MOV	_dAcc_GCUConfirmed, W0
;d_acceleration.c,118 :: 		}
L_end_dAcc_hasGCUConfirmed:
	RETURN
; end of _dAcc_hasGCUConfirmed

_dAcc_isTimeToGo:

;d_acceleration.c,120 :: 		char dAcc_isTimeToGo(void){
;d_acceleration.c,121 :: 		return dAcc_timeToGo;
	MOV	#lo_addr(d_acceleration_dAcc_timeToGo), W0
	MOV.B	[W0], W0
;d_acceleration.c,122 :: 		}
L_end_dAcc_isTimeToGo:
	RETURN
; end of _dAcc_isTimeToGo

_dAcc_isReleasingClutch:

;d_acceleration.c,124 :: 		char dAcc_isReleasingClutch(void) {
;d_acceleration.c,125 :: 		return dAcc_releasingClutch;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,126 :: 		}
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch
