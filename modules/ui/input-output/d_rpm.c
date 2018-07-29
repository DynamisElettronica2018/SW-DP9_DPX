/******************************************************************************/
//                                    R P M                                   //
//                                    D P X                                   //
/******************************************************************************/

#include "d_rpm.h"
#include "../../../libs/debug.h"
#include "../../../libs/basic.h"
#include "../../../libs/i2c_expander.h"
#include "../ui/display/dd_indicators.h"
#include "../d_operating_modes.h"
#include "d_ledStripe.h"
#include <math.h>

unsigned int dRpm = 0;
char dRpm_ledStripeOutputEnable = FALSE;

void dRpm_init() {
}

float dRpm_getDisplayValue(void) {
    return (dRpm / 10) / 100.0;
}

void dRpm_set(unsigned int rpm) {
     dd_Indicator_setIntValueP(&ind_rpm.base, rpm);
     if (rpm < RPM_STRIPE_OFFSET){
         dRpm = RPM_STRIPE_OFFSET;
     } else if ( rpm > RPM_STRIPE_MAX){
         dRpm = RPM_STRIPE_MAX;
     } else {
         dRpm = rpm;
     }
}

char dRpm_canUpdateLedStripe(void) {
    return dRpm_ledStripeOutputEnable;
}

void dRpm_disableLedStripeOutput(void) {
    dRpm_ledStripeOutputEnable = FALSE;
}

void dRpm_enableLedStripeOutput(void) {
    dRpm_ledStripeOutputEnable = TRUE;
}

void dRpm_updateLedStripe(void) {
    unsigned char dLedStripeState;
    if (dRpm > RPM_STRIPE_OFFSET) {
        dLedStripeState = (dRpm - RPM_STRIPE_OFFSET) / RPM_STRIPE_STEP;
    } else {
        dLedStripeState = 0;
    }
    switch (dLedStripeState) {
        case 0:
            dLedStripe_clear();
            break;
        case 1:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 2:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 3:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 4:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 5:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 6:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_5);
            break;
    }
}