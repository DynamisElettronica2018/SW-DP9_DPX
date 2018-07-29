/******************************************************************************/
//                              S I G N A L  L E D                            //
//                                    D P X                                   //
/******************************************************************************/
//                            GREEN          BLUE         RED                 //
/******************************************************************************/
//                             DCU           EFI          DRS                 //
/******************************************************************************/

#include "d_signalLed.h"

void dSignalLed_init(void) {
    DSIGNAL_0_Direction = OUTPUT;
    DSIGNAL_1_Direction = OUTPUT;
    DSIGNAL_2_Direction = OUTPUT;
    dSignalLed_set(DSIGNAL_LED_RED);
    dSignalLed_set(DSIGNAL_LED_BLUE);
    dSignalLed_set(DSIGNAL_LED_GREEN);
    delay_ms(100);
    dSignalLed_unset(DSIGNAL_LED_RED);
    dSignalLed_unset(DSIGNAL_LED_BLUE);
    dSignalLed_unset(DSIGNAL_LED_GREEN);
}

void dSignalLed_switch(unsigned char led) {
    switch (led) {
        case DSIGNAL_LED_0:
            DSIGNAL_0_Pin = !DSIGNAL_0_Pin;
            break;
        case DSIGNAL_LED_1:
            DSIGNAL_1_Pin = !DSIGNAL_1_Pin;
            break;
        case DSIGNAL_LED_2:
            DSIGNAL_2_Pin = !DSIGNAL_2_Pin;
            break;
    }
}

void dSignalLed_set(unsigned char led) {
    switch (led) {
        case DSIGNAL_LED_0:
            DSIGNAL_0_Pin = DSIGNAL_LED_ON;
            break;
        case DSIGNAL_LED_1:
            DSIGNAL_1_Pin = DSIGNAL_LED_ON;
            break;
        case DSIGNAL_LED_2:
            DSIGNAL_2_Pin = DSIGNAL_LED_ON;
            break;
    }
}

void dSignalLed_unset(unsigned char led) {
    switch (led) {
        case DSIGNAL_LED_0:
            DSIGNAL_0_Pin = DSIGNAL_LED_OFF;
            break;
        case DSIGNAL_LED_1:
            DSIGNAL_1_Pin = DSIGNAL_LED_OFF;
            break;
        case DSIGNAL_LED_2:
            DSIGNAL_2_Pin = DSIGNAL_LED_OFF;
            break;
    }
}