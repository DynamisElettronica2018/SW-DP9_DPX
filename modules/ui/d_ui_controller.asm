
_d_UIController_init:

;d_ui_controller.c,31 :: 		void d_UIController_init() {
;d_ui_controller.c,32 :: 		Can_init();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_Can_init
;d_ui_controller.c,33 :: 		dDCU_init();
	CALL	_dDCU_init
;d_ui_controller.c,34 :: 		dPaddle_init();
	CALL	_dPaddle_init
;d_ui_controller.c,35 :: 		Buzzer_init();
	CALL	_Buzzer_init
;d_ui_controller.c,36 :: 		Buttons_init();
	CALL	_Buttons_init
;d_ui_controller.c,37 :: 		dSignalLed_init();
	CALL	_dSignalLed_init
;d_ui_controller.c,38 :: 		dRpm_init();
	CALL	_dRpm_init
;d_ui_controller.c,39 :: 		dLedStripe_init();
	CALL	_dLedStripe_init
;d_ui_controller.c,40 :: 		d_traction_control_init();
	CALL	_d_traction_control_init
;d_ui_controller.c,41 :: 		dAcc_init();
	CALL	_dAcc_init
;d_ui_controller.c,42 :: 		dAutocross_init();
	CALL	_dAutocross_init
;d_ui_controller.c,43 :: 		dd_GraphicController_init();
	CALL	_dd_GraphicController_init
;d_ui_controller.c,44 :: 		setInterruptPriority(TIMER2_DEVICE, MEDIUM_PRIORITY);
	MOV.B	#4, W11
	MOV.B	#2, W10
	CALL	_setInterruptPriority
;d_ui_controller.c,45 :: 		setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
	MOV	#4719, W11
	MOV	#14979, W12
	MOV.B	#2, W10
	CALL	_setTimer
;d_ui_controller.c,46 :: 		d_UI_setOperatingMode(CRUISE_MODE);
	MOV.B	#3, W10
	CALL	_d_UI_setOperatingMode
;d_ui_controller.c,47 :: 		}
L_end_d_UIController_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UIController_init

_d_UI_setOperatingMode:

;d_ui_controller.c,49 :: 		void d_UI_setOperatingMode(OperatingMode mode) {
;d_ui_controller.c,50 :: 		d_OperatingMode_close[d_currentOperatingMode]();
	MOV	#lo_addr(_d_currentOperatingMode), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_close), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W10
	CALL	W0
	POP	W10
;d_ui_controller.c,51 :: 		d_currentOperatingMode = mode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	W10, [W0]
;d_ui_controller.c,52 :: 		d_OperatingMode_init[mode]();
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;d_ui_controller.c,53 :: 		}
L_end_d_UI_setOperatingMode:
	RETURN
; end of _d_UI_setOperatingMode

_d_UI_getOperatingMode:

;d_ui_controller.c,55 :: 		OperatingMode d_UI_getOperatingMode(){
;d_ui_controller.c,56 :: 		return d_currentOperatingMode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
;d_ui_controller.c,57 :: 		}
L_end_d_UI_getOperatingMode:
	RETURN
; end of _d_UI_getOperatingMode

_timer1_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_ui_controller.c,61 :: 		onTimer1Interrupt{
;d_ui_controller.c,62 :: 		dd_GraphicController_onTimerInterrupt();
	CALL	_dd_GraphicController_onTimerInterrupt
;d_ui_controller.c,63 :: 		}
L_end_timer1_interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer1_interrupt
