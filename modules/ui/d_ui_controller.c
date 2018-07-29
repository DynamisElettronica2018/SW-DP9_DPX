/******************************************************************************/
//                             U I  C O N T R O L L E R                       //
//                                    D P X                                   //
/******************************************************************************/

#include "d_ui_controller.h"
#include "input-output/d_signalLed.h"
#include "../libs/dsPIC.h"
#include "display/dd_graphic_controller.h"
#include "display/dd_menu.h"
#include "display/dd_boardDebug.h"
#include "input-output/d_controls.h"
#include "input-output/buzzer.h"
#include "input-output/d_paddle.h"
#include "d_sensors.h"
#include "input-output/d_rpm.h"
#include "../libs/debug.h"
#include "d_acceleration.h"
#include "d_dcu.h"
#include "d_autocross.h"
#include "d_traction_control.h"
#include "d_ebb.h"
#include "d_ledStripe.h"
#include "buttons.h"

#define TIMER_2_PERIOD 0.001 //seconds

OperatingMode d_currentOperatingMode = CRUISE_MODE;
void d_UI_setOperatingMode(OperatingMode mode);

void d_UIController_init() {
    Can_init();
    dDCU_init();
    dPaddle_init();
    Buzzer_init();
    Buttons_init();
    dSignalLed_init();
    dRpm_init();
    dLedStripe_init();
    d_traction_control_init();
    dAcc_init();
    dAutocross_init();
    dd_GraphicController_init();
    setInterruptPriority(TIMER2_DEVICE, MEDIUM_PRIORITY);
    setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
    d_UI_setOperatingMode(CRUISE_MODE);
}

void d_UI_setOperatingMode(OperatingMode mode) {
     d_OperatingMode_close[d_currentOperatingMode]();
     d_currentOperatingMode = mode;
     d_OperatingMode_init[mode]();
}

OperatingMode d_UI_getOperatingMode(){
     return d_currentOperatingMode;
}

void printf(char* string);

onTimer1Interrupt{
    dd_GraphicController_onTimerInterrupt();
}