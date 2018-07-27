/******************************************************************************/
//                             S I G N A L L E D . H                          //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DPX_SIGNALLED_H
#define DPX_SIGNALLED_H

#include "../../../libs/basic.h"
#include "../../../libs/dsPIC.h"

#define DSIGNAL_0_Pin RB9_bit
#define DSIGNAL_1_Pin RB10_bit
#define DSIGNAL_2_Pin RB11_bit
#define DSIGNAL_3_Pin RB13_bit

#define DSIGNAL_0_Direction TRISB9_bit
#define DSIGNAL_1_Direction TRISB10_bit
#define DSIGNAL_2_Direction TRISB11_bit
#define DSIGNAL_3_Direction TRISB13_bit

#define DSIGNAL_LED_0   0
#define DSIGNAL_LED_1   1
#define DSIGNAL_LED_2   2
#define DSIGNAL_LED_3   3

#define DSIGNAL_LED_ON  1
#define DSIGNAL_LED_OFF 0

#define DSIGNAL_LED_BLUE          DSIGNAL_LED_0
#define DSIGNAL_LED_RED_RIGHT     DSIGNAL_LED_1
#define DSIGNAL_LED_RED_LEFT      DSIGNAL_LED_2
#define DSIGNAL_LED_GREEN         DSIGNAL_LED_3

void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);

#endif //DPX_SIGNALLED_H