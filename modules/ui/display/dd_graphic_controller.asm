
_dd_GraphicController_timerSetup:

;dd_graphic_controller.c,56 :: 		void dd_GraphicController_timerSetup(void) {
;dd_graphic_controller.c,57 :: 		setInterruptPriority(TIMER1_DEVICE, LOW_PRIORITY);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#5, W11
	MOV.B	#1, W10
	CALL	_setInterruptPriority
;dd_graphic_controller.c,58 :: 		setTimer(TIMER1_DEVICE, FRAME_PERIOD);
	MOV	#52429, W11
	MOV	#15820, W12
	MOV.B	#1, W10
	CALL	_setTimer
;dd_graphic_controller.c,59 :: 		clearTimer1();
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,60 :: 		}
L_end_dd_GraphicController_timerSetup:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_timerSetup

_dd_GraphicController_getTmrCounterLimit:

;dd_graphic_controller.c,65 :: 		unsigned char dd_GraphicController_getTmrCounterLimit(unsigned int period)
;dd_graphic_controller.c,67 :: 		return (unsigned char) floor(period/1000.0*FRAME_RATE);
	PUSH	W10
	PUSH	W11
	MOV	W10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV.D	W0, W10
	CALL	_floor
	CALL	__Float2Longint
;dd_graphic_controller.c,68 :: 		}
;dd_graphic_controller.c,67 :: 		return (unsigned char) floor(period/1000.0*FRAME_RATE);
;dd_graphic_controller.c,68 :: 		}
L_end_dd_GraphicController_getTmrCounterLimit:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_getTmrCounterLimit

_dd_GraphicController_startupLogo:

;dd_graphic_controller.c,72 :: 		void dd_GraphicController_startupLogo(void) {
;dd_graphic_controller.c,73 :: 		dd_onStartupCounterLimit = dd_GraphicController_getTmrCounterLimit(STARTUP_LOGO_PERIOD);
	PUSH	W10
	MOV	#1000, W10
	CALL	_dd_GraphicController_getTmrCounterLimit
	MOV	#lo_addr(_dd_onStartupCounterLimit), W1
	MOV.B	W0, [W1]
;dd_graphic_controller.c,74 :: 		dd_printLogoAnimation();
	CALL	_dd_printLogoAnimation
;dd_graphic_controller.c,75 :: 		dd_onStartup = 1;
	MOV	#lo_addr(_dd_onStartup), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,77 :: 		}
L_end_dd_GraphicController_startupLogo:
	POP	W10
	RETURN
; end of _dd_GraphicController_startupLogo

_dd_GraphicController_turnOnBacklight:

;dd_graphic_controller.c,79 :: 		void dd_GraphicController_turnOnBacklight(void) {
;dd_graphic_controller.c,80 :: 		DD_BACKLIGHT_PIN = TRUE;
	BSET	RB15_bit, BitPos(RB15_bit+0)
;dd_graphic_controller.c,81 :: 		}
L_end_dd_GraphicController_turnOnBacklight:
	RETURN
; end of _dd_GraphicController_turnOnBacklight

_dd_GraphicController_turnOffBacklight:

;dd_graphic_controller.c,83 :: 		void dd_GraphicController_turnOffBacklight(void) {
;dd_graphic_controller.c,84 :: 		DD_BACKLIGHT_PIN = FALSE;
	BCLR	RB15_bit, BitPos(RB15_bit+0)
;dd_graphic_controller.c,85 :: 		}
L_end_dd_GraphicController_turnOffBacklight:
	RETURN
; end of _dd_GraphicController_turnOffBacklight

_dd_GraphicController_switchBacklight:

;dd_graphic_controller.c,87 :: 		void dd_GraphicController_switchBacklight(void) {
;dd_graphic_controller.c,88 :: 		DD_BACKLIGHT_PIN = !DD_BACKLIGHT_PIN;
	BTG	RB15_bit, BitPos(RB15_bit+0)
;dd_graphic_controller.c,89 :: 		}
L_end_dd_GraphicController_switchBacklight:
	RETURN
; end of _dd_GraphicController_switchBacklight

_dd_GraphicController_init:

;dd_graphic_controller.c,91 :: 		void dd_GraphicController_init(void) {
;dd_graphic_controller.c,92 :: 		DD_BACKLIGHT_PIN_DIRECTION = OUTPUT;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	BCLR	TRISB15_bit, BitPos(TRISB15_bit+0)
;dd_graphic_controller.c,93 :: 		dd_GraphicController_turnOnBacklight();
	CALL	_dd_GraphicController_turnOnBacklight
;dd_graphic_controller.c,94 :: 		eGlcd_init();
	CALL	_eGlcd_init
;dd_graphic_controller.c,95 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,96 :: 		eGlcd_setFont(DD_Dashboard_Font);
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_graphic_controller_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
;dd_graphic_controller.c,97 :: 		if (!dHardReset_hasBeenReset()) {
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__dd_GraphicController_init58
	GOTO	L_dd_GraphicController_init0
L__dd_GraphicController_init58:
;dd_graphic_controller.c,98 :: 		dd_GraphicController_startupLogo();
	CALL	_dd_GraphicController_startupLogo
;dd_graphic_controller.c,99 :: 		}
L_dd_GraphicController_init0:
;dd_graphic_controller.c,100 :: 		dd_GraphicController_timerSetup();
	CALL	_dd_GraphicController_timerSetup
;dd_graphic_controller.c,101 :: 		dd_GraphicController_forceFullFrameUpdate();
	CALL	_dd_GraphicController_forceFullFrameUpdate
;dd_graphic_controller.c,102 :: 		}
L_end_dd_GraphicController_init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_init

_dd_GraphicController_invertColors:

;dd_graphic_controller.c,104 :: 		void dd_GraphicController_invertColors(void) {
;dd_graphic_controller.c,105 :: 		dd_GraphicController_queueColorInversion();
	CALL	_dd_GraphicController_queueColorInversion
;dd_graphic_controller.c,106 :: 		eGlcd_invertColors();
	CALL	_eGlcd_invertColors
;dd_graphic_controller.c,107 :: 		dd_GraphicController_forceNextFrameUpdate();
	CALL	_dd_GraphicController_forceNextFrameUpdate
;dd_graphic_controller.c,108 :: 		}
L_end_dd_GraphicController_invertColors:
	RETURN
; end of _dd_GraphicController_invertColors

_dd_GraphicController_areColorsInverted:

;dd_graphic_controller.c,110 :: 		char dd_GraphicController_areColorsInverted(void) {
;dd_graphic_controller.c,111 :: 		return BLACK == PIXEL_OFF;
	MOV.B	#_BLACK, W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__dd_GraphicController_areColorsInverted61
	INC.B	W0
L__dd_GraphicController_areColorsInverted61:
;dd_graphic_controller.c,112 :: 		}
L_end_dd_GraphicController_areColorsInverted:
	RETURN
; end of _dd_GraphicController_areColorsInverted

_dd_GraphicController_setInterface:

;dd_graphic_controller.c,114 :: 		void dd_GraphicController_setInterface(Interface interface) {
;dd_graphic_controller.c,115 :: 		dd_isInterfaceChangedFromLastFrame = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,116 :: 		dd_onInterfaceChange = TRUE;
	MOV	#lo_addr(_dd_onInterfaceChange), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,117 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,118 :: 		dd_onInterfaceChangeCounterLimit = dd_GraphicController_getTmrCounterLimit(OP_MODE_POPUP_PERIOD);
	PUSH	W10
	MOV	#700, W10
	CALL	_dd_GraphicController_getTmrCounterLimit
	POP	W10
	MOV	#lo_addr(_dd_onInterfaceChangeCounterLimit), W1
	MOV.B	W0, [W1]
;dd_graphic_controller.c,119 :: 		dd_currentInterface = interface;
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	W10, [W0]
;dd_graphic_controller.c,120 :: 		}
L_end_dd_GraphicController_setInterface:
	RETURN
; end of _dd_GraphicController_setInterface

_dd_GraphicController_setCollectionInterface:

;dd_graphic_controller.c,122 :: 		void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title) {
;dd_graphic_controller.c,123 :: 		dd_GraphicController_setInterface(interface);
	PUSH	W10
	PUSH.D	W12
	PUSH	W11
	CALL	_dd_GraphicController_setInterface
;dd_graphic_controller.c,124 :: 		dd_Interface_init[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
	POP	W11
	POP.D	W12
;dd_graphic_controller.c,125 :: 		if ( strlen(title) < MAX_INTERFACE_TITLE_LENGTH )
	MOV	W13, W10
	CALL	_strlen
	CP	W0, #20
	BRA LT	L__dd_GraphicController_setCollectionInterface64
	GOTO	L_dd_GraphicController_setCollectionInterface1
L__dd_GraphicController_setCollectionInterface64:
;dd_graphic_controller.c,126 :: 		strcpy(dd_currentInterfaceTitle, title);
	PUSH	W11
	MOV	W13, W11
	MOV	#lo_addr(_dd_currentInterfaceTitle), W10
	CALL	_strcpy
	POP	W11
L_dd_GraphicController_setCollectionInterface1:
;dd_graphic_controller.c,127 :: 		dd_currentIndicators = indicator_collection;
	MOV	W11, _dd_currentIndicators
;dd_graphic_controller.c,128 :: 		dd_currentIndicatorsCount = indicator_count;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	MOV.B	W12, [W0]
;dd_graphic_controller.c,129 :: 		}
L_end_dd_GraphicController_setCollectionInterface:
	POP	W10
	RETURN
; end of _dd_GraphicController_setCollectionInterface

_dd_GraphicController_getInterface:

;dd_graphic_controller.c,131 :: 		Interface dd_GraphicController_getInterface(void) {
;dd_graphic_controller.c,132 :: 		return dd_currentInterface;
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,133 :: 		}
L_end_dd_GraphicController_getInterface:
	RETURN
; end of _dd_GraphicController_getInterface

_dd_GraphicController_saveCurrentInterface:

;dd_graphic_controller.c,135 :: 		void dd_GraphicController_saveCurrentInterface(void) {
;dd_graphic_controller.c,136 :: 		strcpy(dd_lastInterfaceTitle, dd_currentInterfaceTitle);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dd_currentInterfaceTitle), W11
	MOV	#lo_addr(dd_graphic_controller_dd_lastInterfaceTitle), W10
	CALL	_strcpy
;dd_graphic_controller.c,137 :: 		dd_lastInterface = dd_currentInterface;
	MOV	#lo_addr(dd_graphic_controller_dd_lastInterface), W1
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	[W0], [W1]
;dd_graphic_controller.c,138 :: 		}
L_end_dd_GraphicController_saveCurrentInterface:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_saveCurrentInterface

_dd_GraphicController_setNotificationFlag:

;dd_graphic_controller.c,140 :: 		void dd_GraphicController_setNotificationFlag (void){
;dd_graphic_controller.c,141 :: 		dd_notificationFlag = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,142 :: 		}
L_end_dd_GraphicController_setNotificationFlag:
	RETURN
; end of _dd_GraphicController_setNotificationFlag

_dd_GraphicController_unsetNotificationFlag:

;dd_graphic_controller.c,144 :: 		void dd_GraphicController_unsetNotificationFlag (void){
;dd_graphic_controller.c,145 :: 		dd_notificationFlag = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,146 :: 		}
L_end_dd_GraphicController_unsetNotificationFlag:
	RETURN
; end of _dd_GraphicController_unsetNotificationFlag

_dd_GraphicController_setOnScreenNotification:

;dd_graphic_controller.c,148 :: 		void dd_GraphicController_setOnScreenNotification (void){
;dd_graphic_controller.c,149 :: 		dd_notificationOnScreen = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationOnScreen), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,150 :: 		}
L_end_dd_GraphicController_setOnScreenNotification:
	RETURN
; end of _dd_GraphicController_setOnScreenNotification

_dd_GraphicController_unsetOnScreenNotification:

;dd_graphic_controller.c,152 :: 		void dd_GraphicController_unsetOnScreenNotification (void){
;dd_graphic_controller.c,153 :: 		dd_notificationOnScreen = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationOnScreen), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,154 :: 		}
L_end_dd_GraphicController_unsetOnScreenNotification:
	RETURN
; end of _dd_GraphicController_unsetOnScreenNotification

dd_graphic_controller_dd_GraphicController_getOnScreenNotification:

;dd_graphic_controller.c,156 :: 		static char dd_GraphicController_getOnScreenNotification (void){
;dd_graphic_controller.c,157 :: 		return dd_notificationOnScreen;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationOnScreen), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,158 :: 		}
L_end_dd_GraphicController_getOnScreenNotification:
	RETURN
; end of dd_graphic_controller_dd_GraphicController_getOnScreenNotification

_dd_GraphicController_clearNotification:

;dd_graphic_controller.c,160 :: 		void dd_GraphicController_clearNotification(void) {
;dd_graphic_controller.c,161 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,162 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,163 :: 		dd_GraphicController_unsetNotificationFlag();
	CALL	_dd_GraphicController_unsetNotificationFlag
;dd_graphic_controller.c,164 :: 		}
L_end_dd_GraphicController_clearNotification:
	RETURN
; end of _dd_GraphicController_clearNotification

_dd_GraphicController_fireNotification:

;dd_graphic_controller.c,166 :: 		void dd_GraphicController_fireNotification(char *text, NotificationType type) {
;dd_graphic_controller.c,167 :: 		strcpy(dd_notificationText, text);
	PUSH	W10
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_strcpy
;dd_graphic_controller.c,168 :: 		dd_printMessage(dd_notificationText);
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,169 :: 		}
L_end_dd_GraphicController_fireNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fireNotification

_dd_GraphicController_fixNotification:

;dd_graphic_controller.c,171 :: 		void dd_GraphicController_fixNotification(char *text){
;dd_graphic_controller.c,172 :: 		strcpy(dd_onScreenNotificationText, text);
	PUSH	W10
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_dd_onScreenNotificationText), W10
	CALL	_strcpy
;dd_graphic_controller.c,173 :: 		dd_printMessage(dd_onScreenNotificationText);
	MOV	#lo_addr(_dd_onScreenNotificationText), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,174 :: 		dd_GraphicController_setOnScreenNotification();
	CALL	_dd_GraphicController_setOnScreenNotification
;dd_graphic_controller.c,175 :: 		}
L_end_dd_GraphicController_fixNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fixNotification

_dd_GraphicController_clearPrompt:

;dd_graphic_controller.c,177 :: 		void dd_GraphicController_clearPrompt(){
;dd_graphic_controller.c,178 :: 		dd_GraphicController_unsetNotificationFlag();
	CALL	_dd_GraphicController_unsetNotificationFlag
;dd_graphic_controller.c,179 :: 		dd_GraphicController_unsetOnScreenNotification();
	CALL	_dd_GraphicController_unsetOnScreenNotification
;dd_graphic_controller.c,180 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,181 :: 		}
L_end_dd_GraphicController_clearPrompt:
	RETURN
; end of _dd_GraphicController_clearPrompt

_dd_GraphicController_fireTimedNotification:

;dd_graphic_controller.c,186 :: 		void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type) {
;dd_graphic_controller.c,187 :: 		dd_notificationTimeoutCounter = dd_GraphicController_getTmrCounterLimit(time);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W11
	CALL	_dd_GraphicController_getTmrCounterLimit
	POP	W11
	POP	W12
	ZE	W0, W0
	MOV	W0, _dd_notificationTimeoutCounter
;dd_graphic_controller.c,188 :: 		dd_GraphicController_setNotificationFlag();
	CALL	_dd_GraphicController_setNotificationFlag
;dd_graphic_controller.c,189 :: 		dd_GraphicController_fireNotification(text, type);
	MOV	W11, W10
	MOV.B	W12, W11
	CALL	_dd_GraphicController_fireNotification
;dd_graphic_controller.c,190 :: 		}
L_end_dd_GraphicController_fireTimedNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fireTimedNotification

_dd_GraphicController_handleNotification:

;dd_graphic_controller.c,193 :: 		void dd_GraphicController_handleNotification(void) {
;dd_graphic_controller.c,194 :: 		if (dd_notificationTimeoutCounter > 0) {
	PUSH	W10
	MOV	_dd_notificationTimeoutCounter, W0
	CP	W0, #0
	BRA GTU	L__dd_GraphicController_handleNotification78
	GOTO	L_dd_GraphicController_handleNotification2
L__dd_GraphicController_handleNotification78:
;dd_graphic_controller.c,195 :: 		dd_notificationTimeoutCounter--;
	MOV	#1, W1
	MOV	#lo_addr(_dd_notificationTimeoutCounter), W0
	SUBR	W1, [W0], [W0]
;dd_graphic_controller.c,196 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,197 :: 		dd_printMessage(dd_notificationText);
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,198 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,199 :: 		if (dd_notificationTimeoutCounter == 0) {
	MOV	_dd_notificationTimeoutCounter, W0
	CP	W0, #0
	BRA Z	L__dd_GraphicController_handleNotification79
	GOTO	L_dd_GraphicController_handleNotification3
L__dd_GraphicController_handleNotification79:
;dd_graphic_controller.c,200 :: 		if ((d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE) && dHardReset_hasResetOccurred()
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA NZ	L__dd_GraphicController_handleNotification80
	GOTO	L__dd_GraphicController_handleNotification44
L__dd_GraphicController_handleNotification80:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA NZ	L__dd_GraphicController_handleNotification81
	GOTO	L__dd_GraphicController_handleNotification43
L__dd_GraphicController_handleNotification81:
	GOTO	L_dd_GraphicController_handleNotification8
L__dd_GraphicController_handleNotification44:
L__dd_GraphicController_handleNotification43:
	CALL	_dHardReset_hasResetOccurred
	CP0	W0
	BRA NZ	L__dd_GraphicController_handleNotification82
	GOTO	L__dd_GraphicController_handleNotification47
L__dd_GraphicController_handleNotification82:
;dd_graphic_controller.c,201 :: 		&& dAcc_hasResetOccurred() && dAutocross_hasResetOccurred() ){
	CALL	_dAcc_hasResetOccurred
	CP0	W0
	BRA NZ	L__dd_GraphicController_handleNotification83
	GOTO	L__dd_GraphicController_handleNotification46
L__dd_GraphicController_handleNotification83:
	CALL	_dAutocross_hasResetOccurred
	CP0	W0
	BRA NZ	L__dd_GraphicController_handleNotification84
	GOTO	L__dd_GraphicController_handleNotification45
L__dd_GraphicController_handleNotification84:
L__dd_GraphicController_handleNotification41:
;dd_graphic_controller.c,202 :: 		dd_GraphicController_fixNotification("READY");
	MOV	#lo_addr(?lstr1_dd_graphic_controller), W10
	CALL	_dd_GraphicController_fixNotification
;dd_graphic_controller.c,203 :: 		dAcc_clearReset();
	CALL	_dAcc_clearReset
;dd_graphic_controller.c,204 :: 		dAutocross_clearReset();
	CALL	_dAutocross_clearReset
;dd_graphic_controller.c,205 :: 		dd_GraphicController_setOnScreenNotification();
	CALL	_dd_GraphicController_setOnScreenNotification
;dd_graphic_controller.c,206 :: 		}else
	GOTO	L_dd_GraphicController_handleNotification9
L_dd_GraphicController_handleNotification8:
;dd_graphic_controller.c,200 :: 		if ((d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE) && dHardReset_hasResetOccurred()
L__dd_GraphicController_handleNotification47:
;dd_graphic_controller.c,201 :: 		&& dAcc_hasResetOccurred() && dAutocross_hasResetOccurred() ){
L__dd_GraphicController_handleNotification46:
L__dd_GraphicController_handleNotification45:
;dd_graphic_controller.c,207 :: 		dd_GraphicController_clearNotification();
	CALL	_dd_GraphicController_clearNotification
L_dd_GraphicController_handleNotification9:
;dd_graphic_controller.c,208 :: 		dd_notificationFlag = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,209 :: 		}
L_dd_GraphicController_handleNotification3:
;dd_graphic_controller.c,210 :: 		}
L_dd_GraphicController_handleNotification2:
;dd_graphic_controller.c,211 :: 		}
L_end_dd_GraphicController_handleNotification:
	POP	W10
	RETURN
; end of _dd_GraphicController_handleNotification

_dd_GraphicController_forceFullFrameUpdate:

;dd_graphic_controller.c,213 :: 		void dd_GraphicController_forceFullFrameUpdate(void) {
;dd_graphic_controller.c,214 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,215 :: 		}
L_end_dd_GraphicController_forceFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceFullFrameUpdate

_dd_GraphicController_releaseFullFrameUpdate:

;dd_graphic_controller.c,217 :: 		void dd_GraphicController_releaseFullFrameUpdate(void) {
;dd_graphic_controller.c,218 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,219 :: 		}
L_end_dd_GraphicController_releaseFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_releaseFullFrameUpdate

_dd_GraphicController_forceNextFrameUpdate:

;dd_graphic_controller.c,221 :: 		void dd_GraphicController_forceNextFrameUpdate(void) {
;dd_graphic_controller.c,222 :: 		dd_isNextFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isNextFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,223 :: 		}
L_end_dd_GraphicController_forceNextFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceNextFrameUpdate

_dd_GraphicController_isFrameUpdateForced:

;dd_graphic_controller.c,225 :: 		char dd_GraphicController_isFrameUpdateForced(void) {
;dd_graphic_controller.c,226 :: 		return dd_isFrameUpdateForced;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,227 :: 		}
L_end_dd_GraphicController_isFrameUpdateForced:
	RETURN
; end of _dd_GraphicController_isFrameUpdateForced

_dd_GraphicController_queueColorInversion:

;dd_graphic_controller.c,229 :: 		void dd_GraphicController_queueColorInversion(void) {
;dd_graphic_controller.c,230 :: 		dd_isColorInversionQueued = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,231 :: 		}
L_end_dd_GraphicController_queueColorInversion:
	RETURN
; end of _dd_GraphicController_queueColorInversion

_dd_GraphicController_isColorInversionQueued:

;dd_graphic_controller.c,233 :: 		char dd_GraphicController_isColorInversionQueued(void) {
;dd_graphic_controller.c,234 :: 		return dd_isColorInversionQueued;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,235 :: 		}
L_end_dd_GraphicController_isColorInversionQueued:
	RETURN
; end of _dd_GraphicController_isColorInversionQueued

_dd_printLogoAnimation:
	LNK	#24

;dd_graphic_controller.c,237 :: 		void dd_printLogoAnimation() {
;dd_graphic_controller.c,238 :: 		char page = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;dd_graphic_controller.c,239 :: 		int i =0, j=0, k=0;
;dd_graphic_controller.c,240 :: 		signed char new_y = 0;
;dd_graphic_controller.c,241 :: 		signed char old_y = 0;
;dd_graphic_controller.c,242 :: 		int y_center = 19;
	MOV	#19, W0
	MOV	W0, [W14+8]
;dd_graphic_controller.c,244 :: 		signed char new_y_border = 0;
;dd_graphic_controller.c,246 :: 		eGlcd_LoadImage(DYNAMIS_LOGO);
	MOV	#lo_addr(dd_graphic_controller_DYNAMIS_LOGO), W10
	CALL	_eGlcd_loadImage
;dd_graphic_controller.c,250 :: 		for (k=5; k<=60; k++){
	MOV	#5, W0
	MOV	W0, [W14+4]
L_dd_printLogoAnimation10:
	MOV	#60, W1
	ADD	W14, #4, W0
	CP	W1, [W0]
	BRA GE	L__dd_printLogoAnimation92
	GOTO	L_dd_printLogoAnimation11
L__dd_printLogoAnimation92:
;dd_graphic_controller.c,251 :: 		resetTimer32();
	CALL	_resetTimer32
;dd_graphic_controller.c,252 :: 		cos_angle = cos(0.10466*k);
	MOV	[W14+4], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#22523, W2
	MOV	#15830, W3
	CALL	__Mul_FP
	MOV.D	W0, W10
	CALL	_cos
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;dd_graphic_controller.c,253 :: 		new_y_border = round((cos_angle*17));
	MOV	#0, W2
	MOV	#16776, W3
	CALL	__Mul_FP
	MOV.D	W0, W10
	CALL	_round
	MOV.B	W0, [W14+10]
;dd_graphic_controller.c,254 :: 		if (new_y_border<0) new_y_border = -new_y_border;
	CP.B	W0, #0
	BRA LT	L__dd_printLogoAnimation93
	GOTO	L_dd_printLogoAnimation13
L__dd_printLogoAnimation93:
	MOV.B	[W14+10], W1
	ADD	W14, #10, W0
	SUBR.B	W1, #0, [W0]
L_dd_printLogoAnimation13:
;dd_graphic_controller.c,255 :: 		for (i=0; i<=17-new_y_border; i++)
; i start address is: 16 (W8)
	CLR	W8
; i end address is: 16 (W8)
L_dd_printLogoAnimation14:
; i start address is: 16 (W8)
	ADD	W14, #10, W0
	SE	[W0], W0
	SUBR	W0, #17, W0
	CP	W8, W0
	BRA LE	L__dd_printLogoAnimation94
	GOTO	L_dd_printLogoAnimation15
L__dd_printLogoAnimation94:
;dd_graphic_controller.c,257 :: 		for (j=0; j<8; j++)
; j start address is: 6 (W3)
	CLR	W3
; j end address is: 6 (W3)
; i end address is: 16 (W8)
	MOV	W3, W2
L_dd_printLogoAnimation17:
; j start address is: 4 (W2)
; i start address is: 16 (W8)
	CP	W2, #8
	BRA LT	L__dd_printLogoAnimation95
	GOTO	L_dd_printLogoAnimation18
L__dd_printLogoAnimation95:
;dd_graphic_controller.c,259 :: 		frameBuff[j*64+i] = 0xFF;
	SL	W2, #6, W0
	ADD	W0, W8, W1
	MOV	#lo_addr(_frameBuff), W0
	ADD	W1, [W0], W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,260 :: 		frameBuff[j*64+i+y_center+new_y_border] = 0xFF;
	SL	W2, #6, W0
	ADD	W0, W8, W1
	ADD	W14, #8, W0
	ADD	W1, [W0], W1
	ADD	W14, #10, W0
	SE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_frameBuff), W0
	ADD	W1, [W0], W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,257 :: 		for (j=0; j<8; j++)
; j start address is: 6 (W3)
	ADD	W2, #1, W3
; j end address is: 4 (W2)
;dd_graphic_controller.c,261 :: 		}
; j end address is: 6 (W3)
	MOV	W3, W2
	GOTO	L_dd_printLogoAnimation17
L_dd_printLogoAnimation18:
;dd_graphic_controller.c,255 :: 		for (i=0; i<=17-new_y_border; i++)
	INC	W8
;dd_graphic_controller.c,262 :: 		}
; i end address is: 16 (W8)
	GOTO	L_dd_printLogoAnimation14
L_dd_printLogoAnimation15:
;dd_graphic_controller.c,263 :: 		for (new_y=-new_y_border; new_y<=new_y_border; new_y++)
	MOV.B	[W14+10], W1
	ADD	W14, #6, W0
	SUBR.B	W1, #0, [W0]
L_dd_printLogoAnimation20:
	MOV.B	[W14+6], W1
	ADD	W14, #10, W0
	CP.B	W1, [W0]
	BRA LE	L__dd_printLogoAnimation96
	GOTO	L_dd_printLogoAnimation21
L__dd_printLogoAnimation96:
;dd_graphic_controller.c,265 :: 		old_y = round(new_y/cos_angle);
	ADD	W14, #6, W2
	SE	[W2], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	MOV.D	W0, W10
	CALL	_round
; old_y start address is: 12 (W6)
	MOV.B	W0, W6
;dd_graphic_controller.c,266 :: 		for (page = 0; page<8; page++)
; page start address is: 14 (W7)
	CLR	W7
; page end address is: 14 (W7)
	MOV.B	W7, W4
L_dd_printLogoAnimation23:
; page start address is: 8 (W4)
; old_y start address is: 12 (W6)
; old_y end address is: 12 (W6)
	CP.B	W4, #8
	BRA LTU	L__dd_printLogoAnimation97
	GOTO	L_dd_printLogoAnimation24
L__dd_printLogoAnimation97:
; old_y end address is: 12 (W6)
;dd_graphic_controller.c,268 :: 		i = page*2*64+old_y+y_center;
; old_y start address is: 12 (W6)
	ZE	W4, W0
	SL	W0, #1, W0
	SL	W0, #6, W1
	SE	W6, W0
	ADD	W1, W0, W1
	ADD	W14, #8, W0
	ADD	W1, [W0], W3
;dd_graphic_controller.c,269 :: 		j = page*64+new_y+y_center;
	ZE	W4, W0
	SL	W0, #6, W1
	ADD	W14, #6, W0
	SE	[W0], W0
	ADD	W1, W0, W1
	ADD	W14, #8, W0
	ADD	W1, [W0], W1
;dd_graphic_controller.c,270 :: 		frameBuff[j] = DYNAMIS_LOGO[i];
	MOV	#lo_addr(_frameBuff), W0
	ADD	W1, [W0], W2
	MOV	#lo_addr(dd_graphic_controller_DYNAMIS_LOGO), W0
	ADD	W0, W3, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	MOV.B	W0, [W2]
;dd_graphic_controller.c,266 :: 		for (page = 0; page<8; page++)
; page start address is: 14 (W7)
	ADD.B	W4, #1, W7
; page end address is: 8 (W4)
;dd_graphic_controller.c,271 :: 		}
; old_y end address is: 12 (W6)
; page end address is: 14 (W7)
	MOV.B	W7, W4
	GOTO	L_dd_printLogoAnimation23
L_dd_printLogoAnimation24:
;dd_graphic_controller.c,263 :: 		for (new_y=-new_y_border; new_y<=new_y_border; new_y++)
	MOV.B	[W14+6], W1
	ADD	W14, #6, W0
	ADD.B	W1, #1, [W0]
;dd_graphic_controller.c,272 :: 		}
	GOTO	L_dd_printLogoAnimation20
L_dd_printLogoAnimation21:
;dd_graphic_controller.c,273 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,274 :: 		Delay_Cyc(floor(pow(k*8,2)/30000+new_y_border/10), k*1000);
	MOV	[W14+4], W1
	MOV	#1000, W0
	MUL.SS	W1, W0, W0
	MOV	W0, [W14+22]
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W12
	MOV	#16384, W13
	MOV.D	W0, W10
	CALL	_pow
	MOV	#24576, W2
	MOV	#18154, W3
	CALL	__Div_FP
	MOV	W0, [W14+18]
	MOV	W1, [W14+20]
	ADD	W14, #10, W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+18], W2
	MOV	[W14+20], W3
	CALL	__AddSub_FP
	MOV.D	W0, W10
	CALL	_floor
	CALL	__Float2Longint
	MOV	[W14+22], W2
	MOV	W2, W11
	MOV	W0, W10
	CALL	_Delay_Cyc
;dd_graphic_controller.c,250 :: 		for (k=5; k<=60; k++){
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #1, [W0]
;dd_graphic_controller.c,275 :: 		}
	GOTO	L_dd_printLogoAnimation10
L_dd_printLogoAnimation11:
;dd_graphic_controller.c,276 :: 		}
L_end_dd_printLogoAnimation:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_printLogoAnimation

_dd_GraphicController_getRefreshTimerValue:

;dd_graphic_controller.c,278 :: 		unsigned int dd_GraphicController_getRefreshTimerValue(void){
;dd_graphic_controller.c,279 :: 		return dd_refreshTimer;
	MOV	_dd_refreshTimer, W0
;dd_graphic_controller.c,280 :: 		}
L_end_dd_GraphicController_getRefreshTimerValue:
	RETURN
; end of _dd_GraphicController_getRefreshTimerValue

_dd_GraphicController_resetRefreshTimerValue:

;dd_graphic_controller.c,282 :: 		void dd_GraphicController_resetRefreshTimerValue(void){
;dd_graphic_controller.c,283 :: 		dd_refreshTimer = 0;
	CLR	W0
	MOV	W0, _dd_refreshTimer
;dd_graphic_controller.c,284 :: 		}
L_end_dd_GraphicController_resetRefreshTimerValue:
	RETURN
; end of _dd_GraphicController_resetRefreshTimerValue

_dd_GraphicController_onTimerInterrupt:

;dd_graphic_controller.c,286 :: 		void dd_GraphicController_onTimerInterrupt(void){
;dd_graphic_controller.c,288 :: 		dd_refreshTimer++;
	PUSH	W10
	MOV	#1, W1
	MOV	#lo_addr(_dd_refreshTimer), W0
	ADD	W1, [W0], [W0]
;dd_graphic_controller.c,290 :: 		if(dd_onStartup)
	MOV	#lo_addr(_dd_onStartup), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt101
	GOTO	L_dd_GraphicController_onTimerInterrupt26
L__dd_GraphicController_onTimerInterrupt101:
;dd_graphic_controller.c,292 :: 		dd_tmr1Counter++;
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_tmr1Counter), W0
	ADD.B	W1, [W0], [W0]
;dd_graphic_controller.c,293 :: 		if(dd_tmr1Counter  >= dd_onStartupCounterLimit)
	MOV	#lo_addr(_dd_tmr1Counter), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_onStartupCounterLimit), W0
	CP.B	W1, [W0]
	BRA GEU	L__dd_GraphicController_onTimerInterrupt102
	GOTO	L_dd_GraphicController_onTimerInterrupt27
L__dd_GraphicController_onTimerInterrupt102:
;dd_graphic_controller.c,295 :: 		dd_onStartup = 0;
	MOV	#lo_addr(_dd_onStartup), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,296 :: 		dd_tmr1Counter = 0;
	MOV	#lo_addr(_dd_tmr1Counter), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,297 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,298 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,299 :: 		}
L_dd_GraphicController_onTimerInterrupt27:
;dd_graphic_controller.c,300 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt28
L_dd_GraphicController_onTimerInterrupt26:
;dd_graphic_controller.c,302 :: 		if(dd_isInterfaceChangedFromLastFrame)
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt103
	GOTO	L_dd_GraphicController_onTimerInterrupt29
L__dd_GraphicController_onTimerInterrupt103:
;dd_graphic_controller.c,304 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,305 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,306 :: 		dd_printMessage(dd_currentInterfaceTitle);
	MOV	#lo_addr(_dd_currentInterfaceTitle), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,307 :: 		dd_isInterfaceChangedFromLastFrame = 0;
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,308 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,309 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt30
L_dd_GraphicController_onTimerInterrupt29:
;dd_graphic_controller.c,310 :: 		else if (dd_onInterfaceChange)
	MOV	#lo_addr(_dd_onInterfaceChange), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt104
	GOTO	L_dd_GraphicController_onTimerInterrupt31
L__dd_GraphicController_onTimerInterrupt104:
;dd_graphic_controller.c,318 :: 		dd_tmr1Counter++;
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_tmr1Counter), W0
	ADD.B	W1, [W0], [W0]
;dd_graphic_controller.c,319 :: 		if(dd_tmr1Counter  >= dd_onInterfaceChangeCounterLimit)
	MOV	#lo_addr(_dd_tmr1Counter), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_onInterfaceChangeCounterLimit), W0
	CP.B	W1, [W0]
	BRA GEU	L__dd_GraphicController_onTimerInterrupt105
	GOTO	L_dd_GraphicController_onTimerInterrupt32
L__dd_GraphicController_onTimerInterrupt105:
;dd_graphic_controller.c,321 :: 		dd_onInterfaceChange = 0;
	MOV	#lo_addr(_dd_onInterfaceChange), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,322 :: 		dd_tmr1Counter = 0;
	MOV	#lo_addr(_dd_tmr1Counter), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,323 :: 		eGlcd_fill(WHITE);
	MOV.B	#_WHITE, W10
	CALL	_eGlcd_fill
;dd_graphic_controller.c,324 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,325 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,326 :: 		if (d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA NZ	L__dd_GraphicController_onTimerInterrupt106
	GOTO	L__dd_GraphicController_onTimerInterrupt50
L__dd_GraphicController_onTimerInterrupt106:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA NZ	L__dd_GraphicController_onTimerInterrupt107
	GOTO	L__dd_GraphicController_onTimerInterrupt49
L__dd_GraphicController_onTimerInterrupt107:
	GOTO	L_dd_GraphicController_onTimerInterrupt35
L__dd_GraphicController_onTimerInterrupt50:
L__dd_GraphicController_onTimerInterrupt49:
;dd_graphic_controller.c,327 :: 		dd_GraphicController_fixNotification("READY");
	MOV	#lo_addr(?lstr2_dd_graphic_controller), W10
	CALL	_dd_GraphicController_fixNotification
;dd_graphic_controller.c,328 :: 		}
L_dd_GraphicController_onTimerInterrupt35:
;dd_graphic_controller.c,329 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,330 :: 		}
L_dd_GraphicController_onTimerInterrupt32:
;dd_graphic_controller.c,331 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt36
L_dd_GraphicController_onTimerInterrupt31:
;dd_graphic_controller.c,334 :: 		if (dd_notificationFlag) {
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt108
	GOTO	L_dd_GraphicController_onTimerInterrupt37
L__dd_GraphicController_onTimerInterrupt108:
;dd_graphic_controller.c,335 :: 		dd_GraphicController_handleNotification();
	CALL	_dd_GraphicController_handleNotification
;dd_graphic_controller.c,336 :: 		}else if (dd_GraphicController_getOnScreenNotification()){
	GOTO	L_dd_GraphicController_onTimerInterrupt38
L_dd_GraphicController_onTimerInterrupt37:
	CALL	dd_graphic_controller_dd_GraphicController_getOnScreenNotification
	CP0.B	W0
	BRA NZ	L__dd_GraphicController_onTimerInterrupt109
	GOTO	L_dd_GraphicController_onTimerInterrupt39
L__dd_GraphicController_onTimerInterrupt109:
;dd_graphic_controller.c,337 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,338 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,339 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,340 :: 		dd_printMessage(dd_onScreenNotificationText);
	MOV	#lo_addr(_dd_onScreenNotificationText), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,341 :: 		}else{
	GOTO	L_dd_GraphicController_onTimerInterrupt40
L_dd_GraphicController_onTimerInterrupt39:
;dd_graphic_controller.c,342 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,343 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,344 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,345 :: 		}
L_dd_GraphicController_onTimerInterrupt40:
L_dd_GraphicController_onTimerInterrupt38:
;dd_graphic_controller.c,346 :: 		}
L_dd_GraphicController_onTimerInterrupt36:
L_dd_GraphicController_onTimerInterrupt30:
;dd_graphic_controller.c,347 :: 		}
L_dd_GraphicController_onTimerInterrupt28:
;dd_graphic_controller.c,349 :: 		clearTimer1();
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,361 :: 		}
L_end_dd_GraphicController_onTimerInterrupt:
	POP	W10
	RETURN
; end of _dd_GraphicController_onTimerInterrupt
