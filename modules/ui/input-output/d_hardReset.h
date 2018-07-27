/******************************************************************************/
//                             H A R D R E S E T . H                          //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DPX_DISPLAY_CONTROLLER_D_HARDRESET_H
#define DPX_DISPLAY_CONTROLLER_D_HARDRESET_H

#include "../../../libs/eeprom.h"

#define HARDRESET_FLAG_ADDRESS  (EEPROM_ADDRESS_OFFSET + 0)
#define HARDRESET_COUNTER_ADDRESS   (EEPROM_ADDRESS_OFFSET + 4)
#define LAST_CAN_ID_ADDRESS (EEPROM_ADDRESS_OFFSET + 8)

#define HARDRESET_FLAG  RCONbits.SWR
#define HARD_RESET_NOTIFICATION_TIME 1000

void dHardReset_init(void);

void dHardReset_reset(void);

void dHardReset_handleReset(void);

unsigned int dHardReset_hasResetOccurred(void);

void dHardReset_unsetHardResetOccurred(void);

unsigned int dHardReset_hasResetOccurred2(void);

void dHardReset_unsetHardResetOccurred2(void);

char dHardReset_hasBeenReset(void);

void dHardReset_setFlag(void);

void dHardReset_unsetFlag(void);

unsigned int dHardReset_getCounter(void);

#endif //DPX_DISPLAY_CONTROLLER_D_HARDRESET_H