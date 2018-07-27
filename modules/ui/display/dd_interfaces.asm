
_dd_Interface_getTitleX:

;dd_interfaces.c,54 :: 		unsigned char dd_Interface_getTitleX(char *title) {
;dd_interfaces.c,55 :: 		return (unsigned char) (SCREEN_X_MIDDLE - eGlcd_getTextPixelLength(title) / 2);
	CALL	_eGlcd_getTextPixelLength
	LSR	W0, #1, W1
	MOV	#64, W0
	SUB	W0, W1, W0
;dd_interfaces.c,56 :: 		}
L_end_dd_Interface_getTitleX:
	RETURN
; end of _dd_Interface_getTitleX

_dd_Interface_getTitleY:

;dd_interfaces.c,58 :: 		unsigned char dd_Interface_getTitleY(void) {
;dd_interfaces.c,59 :: 		return PARAMETER_TOP_MARGIN + INDICATOR_MARGIN;
	MOV.B	#4, W0
;dd_interfaces.c,60 :: 		}
L_end_dd_Interface_getTitleY:
	RETURN
; end of _dd_Interface_getTitleY

_dd_Interface_drawTitleContainers:

;dd_interfaces.c,62 :: 		void dd_Interface_drawTitleContainers(void) {
;dd_interfaces.c,63 :: 		eGlcd(Glcd_Rectangle_Round_Edges(
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV.B	#22, W13
	MOV.B	#126, W12
	MOV.B	#1, W11
	MOV.B	#1, W10
	MOV	#_BLACK, W0
	PUSH	W0
	MOV	#3, W0
	PUSH	W0
	CALL	_Glcd_Rectangle_Round_Edges
	SUB	#4, W15
;dd_interfaces.c,71 :: 		}
L_end_dd_Interface_drawTitleContainers:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_Interface_drawTitleContainers

_dd_Interface_drawTitle:
	LNK	#2

;dd_interfaces.c,73 :: 		void dd_Interface_drawTitle(char *title) {
;dd_interfaces.c,74 :: 		eGlcd_setFont(INTERFACE_TITLE_FONT);
	PUSH	W11
	PUSH	W12
	PUSH	W13
	PUSH	W10
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_interfaces_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_interfaces.c,75 :: 		eGlcd_writeText(title, dd_Interface_getTitleX(title), dd_Interface_getTitleY());
	CALL	_dd_Interface_getTitleY
	MOV.B	W0, [W14+0]
	PUSH	W10
	CALL	_dd_Interface_getTitleX
	POP	W10
	MOV.B	[W14+0], W1
	MOV.B	W1, W12
	MOV.B	W0, W11
	CALL	_eGlcd_writeText
;dd_interfaces.c,76 :: 		dd_Interface_drawTitleContainers();
	CALL	_dd_Interface_drawTitleContainers
;dd_interfaces.c,77 :: 		}
L_end_dd_Interface_drawTitle:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _dd_Interface_drawTitle

_dd_printMessage:

;dd_interfaces.c,83 :: 		void dd_printMessage(char * title)
;dd_interfaces.c,85 :: 		unsigned int width = 0;
	PUSH	W11
	PUSH	W12
	PUSH	W13
;dd_interfaces.c,87 :: 		eGlcd_setFont(INTERFACE_TITLE_FONT);
	PUSH	W10
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_interfaces_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_interfaces.c,88 :: 		width = eGlcd_getTextPixelLength(title);
	PUSH	W10
	CALL	_eGlcd_getTextPixelLength
	POP	W10
;dd_interfaces.c,89 :: 		x_origin = SCREEN_X_MIDDLE-width/2;
	LSR	W0, #1, W2
	MOV.B	#64, W1
; x_origin start address is: 4 (W2)
	SUB.B	W1, W2, W2
;dd_interfaces.c,90 :: 		y_origin = SCREEN_Y_MIDDLE-INTERFACE_TITLE_FONT_HEIGHT/2;
; y_origin start address is: 6 (W3)
	MOV.B	#24, W3
;dd_interfaces.c,91 :: 		eGlcd_drawRect(x_origin-INTERFACE_TITLE_X_MARGIN, y_origin-INTERFACE_TITLE_Y_MARGIN, width+2*INTERFACE_TITLE_X_MARGIN,
	ADD	W0, #24, W1
	ZE	W2, W0
	SUB	W0, #12, W0
;dd_interfaces.c,92 :: 		INTERFACE_TITLE_FONT_HEIGHT+2*INTERFACE_TITLE_Y_MARGIN);
	PUSH.D	W2
	PUSH	W10
	MOV.B	#24, W13
;dd_interfaces.c,91 :: 		eGlcd_drawRect(x_origin-INTERFACE_TITLE_X_MARGIN, y_origin-INTERFACE_TITLE_Y_MARGIN, width+2*INTERFACE_TITLE_X_MARGIN,
	MOV.B	W1, W12
	MOV.B	#20, W11
	MOV.B	W0, W10
;dd_interfaces.c,92 :: 		INTERFACE_TITLE_FONT_HEIGHT+2*INTERFACE_TITLE_Y_MARGIN);
	CALL	_eGlcd_drawRect
	POP	W10
	POP.D	W2
;dd_interfaces.c,94 :: 		eGlcd_writeText(title, x_origin, y_origin);
	MOV.B	W3, W12
; y_origin end address is: 6 (W3)
	MOV.B	W2, W11
; x_origin end address is: 4 (W2)
	CALL	_eGlcd_writeText
;dd_interfaces.c,95 :: 		}
L_end_dd_printMessage:
	POP	W13
	POP	W12
	POP	W11
	RETURN
; end of _dd_printMessage

_dd_Interface_printMenu:

;dd_interfaces.c,97 :: 		void dd_Interface_printMenu() {
;dd_interfaces.c,98 :: 		dd_printMenu();
	CALL	_dd_printMenu
;dd_interfaces.c,99 :: 		}
L_end_dd_Interface_printMenu:
	RETURN
; end of _dd_Interface_printMenu
