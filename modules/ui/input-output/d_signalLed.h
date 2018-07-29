/******************************************************************************/
//                             S I G N A L L E D . H                          //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DPX_SIGNALLED_H
#define DPX_SIGNALLED_H

#include "../../libs/basic.h"
#include "../../libs/dsPIC.h"

#define DSIGNAL_0_Pin RF5_bit
#define DSIGNAL_1_Pin RF4_bit
#define DSIGNAL_2_Pin RG1_bit

#define DSIGNAL_0_Direction TRISF5_bit
#define DSIGNAL_1_Direction TRISF4_bit
#define DSIGNAL_2_Direction TRISG1_bit

#define DSIGNAL_LED_0   0
#define DSIGNAL_LED_1   1
#define DSIGNAL_LED_2   2

#define DSIGNAL_LED_ON  1
#define DSIGNAL_LED_OFF 0

#define DSIGNAL_LED_GREEN   DSIGNAL_LED_0
#define DSIGNAL_LED_RED     DSIGNAL_LED_1
#define DSIGNAL_LED_BLUE    DSIGNAL_LED_2

void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);

#endif //DPX_SIGNALLED_H