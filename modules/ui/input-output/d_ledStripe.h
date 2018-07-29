//
// Created by Aaron Russo on 20/06/16.
//
// Dynamis Led Stripe
//

#ifndef DP8_DISPLAY_CONTROLLER_DLS_RPM_H
#define DP8_DISPLAY_CONTROLLER_DLS_RPM_H

#include "../../libs/basic.h"
#include "../../libs/dsPIC.h"

//If defined, following parameter will consider
//active a given color on low level
#define DLS_RGB_INVERTED_LOGIC
//If defined, following parameter will consider
//active a given led on low level
//#define DLS_LED_INVERTED_LOGIC

#define DLS_LED_COUNT 6

#define DLS_0_Pin RD2_bit
#define DLS_1_Pin RD3_bit
#define DLS_2_Pin RD4_bit
#define DLS_3_Pin RD5_bit
#define DLS_4_Pin RD6_bit
#define DLS_5_Pin RD7_bit
#define DLS_RED_Pin LATG12_bit
#define DLS_GREEN_Pin RG0_bit
#define DLS_BLUE_Pin RG14_bit

#define DLS_0_Direction TRISD2_bit
#define DLS_1_Direction TRISD3_bit
#define DLS_2_Direction TRISD4_bit
#define DLS_3_Direction TRISD5_bit
#define DLS_4_Direction TRISD6_bit
#define DLS_5_Direction TRISD7_bit
#define DLS_RED_Direction TRISG12_bit
#define DLS_GREEN_Direction TRISG0_bit
#define DLS_BLUE_Direction TRISG14_bit

#define DLS_LED_0 0
#define DLS_LED_1 1
#define DLS_LED_2 2
#define DLS_LED_3 3
#define DLS_LED_4 4
#define DLS_LED_5 5

#ifdef DLS_RGB_INVERTED_LOGIC
#define DLS_COLOR_ON 0
#define DLS_COLOR_OFF 1
#else
#define DLS_COLOR_ON 1
#define DLS_COLOR_OFF 0
#endif

#ifdef DLS_LED_INVERTED_LOGIC
#define DLS_LED_ON 0
#define DLS_LED_OFF 1
#else
#define DLS_LED_ON 1
#define DLS_LED_OFF 0
#endif

//Least 3 significant bit represent R G B
#define DLS_RED     0b00000001
#define DLS_GREEN   0b00000010
#define DLS_BLUE    0b00000100
#define DLS_YELLOW  0b00000011
#define DLS_CYAN    0b00000110
#define DLS_MAGENTA 0b00000101
#define DLS_BLACK   0b00000000
#define DLS_WHITE   0b00000111

#define DLS_RED_PERSISTENCE 7

void dLedStripe_init(void);

void dLedStripe_debugByte(unsigned char debugByte);

void dLedStripe_clear(void);

void dLedStripe_setLedColorAtPosition(unsigned char color, unsigned char led);

void dLedStripe_setLedStripe(unsigned char colors[]);

void dLedStripe_switchLedColorAtPosition(unsigned char color, unsigned char led);

unsigned char dLedStripe_getLedColorAtPosition(unsigned char led);

void dLedStripe_setLedFromByteStripe(unsigned char *stripe, unsigned char led, unsigned char on);

void dLedStripe_updateFrame(void);

void dLedStripe_hardSetLedStripe(unsigned char stripe);

void dLedStripe_hardClearColors(void);

void dLedStripe_hardSetColor(unsigned char color);

void dLedStripe_hardSetLedPin(unsigned char led);

void dLedStripe_hardUnsetLedPin(unsigned char led);

#endif //DP8_DISPLAY_CONTROLLER_DLS_RPM_H
