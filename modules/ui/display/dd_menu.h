/******************************************************************************/
//                                 M E N U . H                                //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DP8_DISPLAY_CONTROLLER_DD_MENU_H
#define DP8_DISPLAY_CONTROLLER_DD_MENU_H

#include "dd_indicators.h"

/** Interface methods as described in dd_interfaces.h
*        \name Interface methods
*/
//!@{
void dd_Menu_init();
void dd_printMenu();
//!@}
unsigned char dd_Menu_selectedLine();

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);

/** \anchor navigation_methods
*        \brief Used for navigating inside menus.
*        \name Navigation methods
*/
//!@{
void dd_Menu_moveSelection(signed char movements);

void dd_Menu_selectDown(void);
void dd_Menu_selectUp(void);

#endif //DP8_DISPLAY_CONTROLLER_DD_MENU_H