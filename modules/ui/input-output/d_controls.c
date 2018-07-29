/******************************************************************************/
//                                C O N T R O L S                             //
//                                    D P X                                   //
/******************************************************************************/

#include <math.h>
#include "d_controls.h"
#include "d_can.h"
#include "dd_graphic_controller.h"
#include "d_start.h"
#include "dd_global_defines.h"
#include "d_dcu.h"
#include "d_hardReset.h"
#include "d_acceleration.h"
#include "d_ebb.h"
#include "d_gears.h"
#include "d_ui_controller.h"
#include "d_operating_modes.h"
#include "debug.h"
#include "d_autocross.h"
#include "d_drs.h"
#include "dsPIC.h"
#include "buttons.h"
#include "dd_menu.h"
#include "d_traction_control.h"

#define STRANGE_BUTTON_DELAY 1

/******************************************************************************/

void button_onGearUp() {
    //dSignalLed_unset(DSIGNAL_LED_0);
    if (dGear_canGearUp() || dGear_isNeutralSet()) {
        Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_UP);
    } else {
        //dSignalLed_set(DSIGNAL_LED_0);
    }
}

void button_onGearDown() {
    //dSignalLed_unset(DSIGNAL_LED_0);
    if (dGear_canGearDown() || dGear_isNeutralSet()) {
        Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_DOWN);
    } else {
        //dSignalLed_set(DSIGNAL_LED_0);
    }
}

void button_onStart() {
    if (getExternalInterruptEdge(CenterInterrupt) == NEGATIVE_EDGE) {
        dSignalLed_set(DSIGNAL_LED_2);
        dStart_switchOn();
        switchExternalInterruptEdge(CenterInterrupt);
    } else {
        dSignalLed_unset(DSIGNAL_LED_2);
        dStart_switchOff();
        switchExternalInterruptEdge(CenterInterrupt);
    }
}

void button_onMenuLeft() {
     OperatingMode currentOperatingMode;
     currentOperatingMode = d_UI_getOperatingMode();
     switch(currentOperatingMode){
        case ACC_MODE:
            d_UI_setOperatingMode(CRUISE_MODE);
            break;
        case CRUISE_MODE:
            d_UI_setOperatingMode(DEBUG_MODE);
            break;
        case DEBUG_MODE:
            d_UI_setOperatingMode(SETTINGS_MODE);
            break;
        case SETTINGS_MODE:
            d_UI_setOperatingMode(BOARD_DEBUG_MODE);
            break;
        default:
             break;
     }
}


void button_onMenuRight() {
     OperatingMode currentOperatingMode;
     currentOperatingMode = d_UI_getOperatingMode();
     switch(currentOperatingMode){
        case BOARD_DEBUG_MODE:
            d_UI_setOperatingMode(SETTINGS_MODE);
            break;
        case SETTINGS_MODE:
            d_UI_setOperatingMode(DEBUG_MODE);
            break;
        case DEBUG_MODE:
            d_UI_setOperatingMode(CRUISE_MODE);
            break;
        case CRUISE_MODE:
            d_UI_setOperatingMode(ACC_MODE);
            break;
        default:
            break;
     }
}

void button_onNeutral() {
    if (!dGear_isNeutralSet()) {
        if (dGear_get() == 1) {
            Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_UP);
        } else if (dGear_get() == 2) {
            Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_DOWN);
        }
    }
}

void button_onMenuUp() {
     OperatingMode currentOperatingMode;
     currentOperatingMode = d_UI_getOperatingMode();
     switch(currentOperatingMode){
        case BOARD_DEBUG_MODE:
        case DEBUG_MODE:
        case SETTINGS_MODE:
            dd_Menu_selectUp();
            break;
        case CRUISE_MODE:
        case ACC_MODE:
            dHardReset_reset();
            break;
        default:
             return;
     }
}


void button_onMenuDown() {
     OperatingMode currentOperatingMode;
     currentOperatingMode = d_UI_getOperatingMode();
     switch(currentOperatingMode){
        case BOARD_DEBUG_MODE:
        case SETTINGS_MODE:
        case DEBUG_MODE:
            dd_Menu_selectDown();
            break;
        case CRUISE_MODE:
        case ACC_MODE:
            d_traction_control_increase();
            break;
        default:
            return;
     }
}

void button_onMenuOk() {
     OperatingMode currentOperatingMode;
     currentOperatingMode = d_UI_getOperatingMode();
     switch(currentOperatingMode){
        case DEBUG_MODE:
             dDCU_switchAcquisition();
        case SETTINGS_MODE:
             d_UI_onSettingsChange(RIGHT);
             break;
        case CRUISE_MODE:
             d_traction_control_decrease();
             break;
        case ACC_MODE:
             dAcc_requestAction();
             break;
        default:
            return;
     }
}

/******************************************************************************/