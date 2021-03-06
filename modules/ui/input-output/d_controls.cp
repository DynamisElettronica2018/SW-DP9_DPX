#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/d_controls.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_controls.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/can.h"
#line 52 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/can.h"
void Can_init(void);

unsigned int Can_read(unsigned long int *id, char* dataBuffer, unsigned int *dataLength, unsigned int *inFlags);

void Can_writeByte(unsigned long int id, unsigned char dataOut);

void Can_writeInt(unsigned long int id, int dataOut);

void Can_addIntToWritePacket(int dataOut);

void Can_addByteToWritePacket(unsigned char dataOut);

void Can_write(unsigned long int id);

void Can_setWritePriority(unsigned int txPriority);

void Can_resetWritePacket(void);

unsigned int Can_getWriteFlags(void);

unsigned char Can_B0hasBeenReceived(void);

unsigned char Can_B1hasBeenReceived(void);

void Can_clearB0Flag(void);

void Can_clearB1Flag(void);

void Can_clearInterrupt(void);

void Can_initInterrupt(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_graphic_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_indicators.h"
#line 20 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_indicators.h"
typedef enum {

 EBB, TH2O, OIL_PRESS, TPS, VBAT, RPM, ADC1, TRACTION_CONTROL,
 CLUTCH_POSITION, OIL_TEMP_IN, OIL_TEMP_OUT, CLUTCH_FEEDBACK, DRS,
 EFI_STATUS, TRIM1, TRIM2, EFI_CRASH_COUNTER, TH2O_SX_IN, TH2O_SX_OUT,
 TH2O_DX_IN, TH2O_DX_OUT, EBB_STATE, EFI_SLIP, LAUNCH_CONTROL,
 FUEL_PRESS, EBB_MOTOR_CURRENT, GCU_TEMP, FB_CODE, FB_VAL,

 S_DASH_TOP_L, S_DASH_TOP_R, S_DASH_BOTTOM_L, S_DASH_BOTTOM_R,
 S_BYPASS_GEARS, S_INVERT_COLORS,

 EBB_BOARD, GCU_BOARD, SW_BOARD, DCU_BOARD,
 DAU_FL_BOARD, DAU_FR_BOARD, DAU_R_BOARD,

 FUEL_PUMP, H2O_PUMP, H2O_FANS, CLUTCH, DRS_CURR,
 GEAR_MOTOR
} Indicator_ID;




typedef struct {
 int first;
 int second;
} IntCouple;
#line 70 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_indicators.h"
typedef struct Indicator {
 Indicator_ID id;
 char* name;
 char* description;
 unsigned char nameLength;
 unsigned char descriptionLength;
 unsigned pendingPrintUpdate : 2,
 isVisible : 1,
 parseValueLabel : 1,
 valueType : 3;
 unsigned char labelLength;
 char label[ 10 ];
} Indicator ;


typedef struct {
 Indicator base;
 char* value;
} StringIndicator;

typedef struct {
 Indicator base;
 int value;
} IntegerIndicator;

typedef struct {
 Indicator base;
 float value;
} FloatIndicator;

typedef struct {
 Indicator base;
 unsigned char value;
} BooleanIndicator;

typedef struct {
 Indicator base;
 IntCouple value;
} IntCoupleIndicator;




extern Indicator** dd_currentIndicators;
extern unsigned char dd_currentIndicatorsCount;









unsigned char dd_getIndicatorIndex(Indicator_ID id);

unsigned char dd_getIndicatorIndexFromCollection(Indicator_ID id, Indicator** collection, unsigned char collection_count);

char dd_Indicator_isRequestingUpdate(unsigned char indicatorIndex);
char dd_Indicator_isRequestingFullUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestFullPrintUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestPrintUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestPrintUpdateP(Indicator* ind);
void dd_Indicator_clearPrintUpdateRequest(unsigned char indicatorIndex);

void dd_Indicator_setAsVisible(unsigned char indicatorIndex);

void dd_Indicator_hide(unsigned char indicatorIndex);

void dd_Indicator_setStringValue(Indicator_ID id, char *value);

void dd_Indicator_setIntValue(Indicator_ID id, int value);

void dd_Indicator_setFloatValue(Indicator_ID id, float value);

void dd_Indicator_setBoolValue(Indicator_ID id, char value);

void dd_Indicator_setIntCoupleValue(Indicator_ID id, IntCouple value);

void dd_Indicator_setStringValueP(Indicator* ind, char *value);

void dd_Indicator_setIntValueP(Indicator* ind, int value);

void dd_Indicator_setFloatValueP(Indicator* ind, float value);

void dd_Indicator_setBoolValueP(Indicator* ind, char value);

void dd_Indicator_setIntCoupleValueP(Indicator* ind, int first_value, int second_value);

void dd_Indicator_switchBoolValueP(Indicator* ind);

void dd_Indicator_switchBoolValue(Indicator_ID id);

void dd_Indicator_parseValueLabel(unsigned char indicatorIndex);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_interfaces.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/../../../libs/basic.h"
#line 17 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 18 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
} Interface;
#line 41 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_print[ 3 ])(void);
#line 49 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_init[ 3 ])(void);
#line 66 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR,
 PROMPT
} NotificationType;
#line 76 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 4 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 21 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_graphic_controller.h"
extern Indicator** dd_currentIndicators;

extern unsigned char dd_currentIndicatorsCount;

extern char dd_currentInterfaceTitle[ 20 ];
#line 30 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_init(void);
#line 38 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title);

Interface dd_GraphicController_getInterface(void);

unsigned int dd_GraphicController_getRefreshTimerValue(void);

void dd_GraphicController_resetRefreshTimerValue(void);

void dd_GraphicController_unsetOnScreenNotification (void);

int dd_GraphicController_getNotificationFlag(void);
#line 61 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_clearPrompt(void);

void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type);

void dd_GraphicController_fixNotification(char *text);

void dd_GraphicController_forceFullFrameUpdate(void);

void dd_GraphicController_forceNextFrameUpdate(void);

char dd_GraphicController_isFrameUpdateForced(void);

void dd_GraphicController_releaseFullFrameUpdate(void);

void dd_GraphicController_invertColors(void);

char dd_GraphicController_areColorsInverted(void);

void dd_GraphicController_queueColorInversion(void);

char dd_GraphicController_isColorInversionQueued(void);

void dd_GraphicController_onTimerInterrupt(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_start.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/basic.h"
#line 12 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_start.h"
void dStart_switchOn(void);

void dStart_switchOff(void);

char dStart_isSwitchedOn(void);

void dStart_sendStartMessage(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_global_defines.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_dcu.h"
#line 12 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_dcu.h"
void dDCU_init();

void dDCU_switchAcquisition(void);

void dDCU_startAcquisition(void);

void dDCU_stopAcquisition(void);

void dDCU_isAcquiringSet(void);

char dDCU_isAcquiring(void);

void dDCU_sentAcquiringSignal(void);

void dDCU_handleMessage(unsigned int acquisitionState);

void dDCU_tick(void);

void dDCU_isAcquiringSet(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_hardreset.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/eeprom.h"










void EEPROM_writeInt(unsigned int address, unsigned int value);

unsigned int EEPROM_readInt(unsigned int address);

void EEPROM_writeArray(unsigned int address, unsigned int *values);

void EEPROM_readArray(unsigned int address, unsigned int *values);
#line 19 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_hardreset.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_acceleration.h"
#line 14 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_acceleration.h"
void dAcc_init(void);

unsigned int dAcc_hasResetOccurred(void);

void dAcc_clearReset(void);

void dAcc_restartAcc(void);

unsigned int dAcc_hasGCUConfirmed (void);

void dAcc_requestAction();

char dAcc_isAutoAccelerationActive(void);

char dAcc_isReleasingClutch(void);

void dAcc_feedbackGCU(unsigned int value);

void dAcc_stopAutoAccelerationFromSW(void);

void dAcc_stopAutoAcceleration(void);

char dAcc_isTimeToGo(void);

char dAcc_isInSteady(void);

void dAcc_startClutchRelease(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_ebb.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_indicators.h"
#line 24 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../ui/display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 30 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../ui/display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 40 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../ui/display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/basic.h"
#line 186 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/dspic.h"
void setAllPinAsDigital(void);

void setInterruptPriority(unsigned char device, unsigned char priority);

void setExternalInterrupt(unsigned char device, char edge);

void switchExternalInterruptEdge(unsigned char);

char getExternalInterruptEdge(unsigned char);

void clearExternalInterrupt(unsigned char);

void setTimer(unsigned char device, double timePeriod);

void clearTimer(unsigned char device);

void turnOnTimer(unsigned char device);

void turnOffTimer(unsigned char device);

unsigned int getTimerPeriod(double timePeriod, unsigned char prescalerIndex);

unsigned char getTimerPrescaler(double timePeriod);

double getExactTimerPrescaler(double timePeriod);

void setupAnalogSampling(void);

void turnOnAnalogModule();

void turnOffAnalogModule();

void startSampling(void);

unsigned int getAnalogValue(void);

void setAnalogPIN(unsigned char pin);

void unsetAnalogPIN(unsigned char pin);

void setAnalogInterrupt(void);

void unsetAnalogInterrupt(void);

void clearAnalogInterrupt(void);


void setAutomaticSampling(void);

void unsetAutomaticSampling(void);


void setAnalogVoltageReference(unsigned char mode);

void setAnalogDataOutputFormat(unsigned char adof);

int getMinimumAnalogClockConversion(void);
#line 32 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 37 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_ebb.h"
void dEbb_init(void);

void dEbb_setPositionZero(void);

void dEbb_move(signed char movements);

void dEbb_setEbbValueFromCAN(unsigned int value);

void dEbb_propagateEbbChange(void);

void dEbb_tick(void);

void dEbb_calibrationState(unsigned int value);

void dEbb_error(unsigned int value);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_gears.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_can.h"
#line 32 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_gears.h"
void dGear_init(void);

void dGear_requestGearUp();
void dGear_requestGearDown();

char dGear_isNeutralSet();


void dGear_propagate(unsigned int gearCommand);

unsigned char dGear_getCurrentGearLetter(void);

void dGear_set(unsigned char gear);

unsigned char dGear_get(void);

void dGear_up(void);

void dGear_down(void);

char dGear_canGearUp(void);

char dGear_canGearDown(void);

char dGear_isShiftingCheckBypassed(void);

void dGear_enableShiftCheck(void);

void dGear_disableShiftCheck(void);

void d_setGearMotorState(int motorState);

unsigned char d_getGearMotorState(void);

char d_canSetGear(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_ui_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_operating_modes.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_controls.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_indicators.h"
#line 45 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_operating_modes.h"
typedef enum {
 BOARD_DEBUG_MODE,
 SETTINGS_MODE,
 DEBUG_MODE,
 CRUISE_MODE,
 ACC_MODE,
 AUTOCROSS_MODE
} OperatingMode;




extern FloatIndicator ind_oil_temp_in;
extern FloatIndicator ind_th2o;
extern IntegerIndicator ind_tps;
extern IntegerIndicator ind_traction_control;
extern FloatIndicator ind_oil_press;
extern FloatIndicator ind_vbat;
extern IntegerIndicator ind_rpm;
extern IntegerIndicator ind_clutch_pos;
extern IntegerIndicator ind_clutch_fb;
extern IntegerIndicator ind_adc1_read;
extern IntegerIndicator ind_drs;
extern BooleanIndicator ind_efi_status;
extern IntegerIndicator ind_efi_crash_counter;
extern FloatIndicator ind_th2o_sx_in;
extern FloatIndicator ind_th2o_sx_out;
extern FloatIndicator ind_th2o_dx_in;
extern FloatIndicator ind_th2o_dx_out;
extern IntegerIndicator ind_fb_code;
extern IntegerIndicator ind_fb_value;
extern IntegerIndicator ind_ebb;
extern FloatIndicator ind_oil_temp_out;
extern IntegerIndicator ind_efi_slip;
extern IntegerIndicator ind_launch_control;
extern FloatIndicator ind_fuel_press;
extern FloatIndicator ind_ebb_motor_curr;





extern IntCoupleIndicator ind_ebb_board;
extern IntCoupleIndicator ind_dcu_board;
extern IntCoupleIndicator ind_dau_fl_board;
extern IntCoupleIndicator ind_dau_fr_board;
extern IntCoupleIndicator ind_dau_r_board;
extern IntegerIndicator ind_sw_board;
extern IntegerIndicator ind_gcu_temp;




extern IntegerIndicator ind_fuel_pump;
extern IntegerIndicator ind_H2O_pump;
extern IntegerIndicator ind_H2O_fans;
extern IntegerIndicator ind_clutch;
extern IntegerIndicator ind_drs_curr;
extern IntegerIndicator ind_gear_motor;
#line 110 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_init[ 6 ])(void);
#line 113 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_close[ 6 ])(void);


void d_UI_BoardDebugModeInit();
void d_UI_SettingsModeInit();
void d_UI_DebugModeInit();
void d_UI_CruiseModeInit();
void d_UI_AccModeInit();
void d_UI_AutocrossModeInit();

void d_UI_onSettingsChange(signed char movements);
#line 154 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_operating_modes.h"
void d_UI_CruiseModeClose();
void d_UI_AccModeClose();
void d_UI_DebugModeClose();
void d_UI_SettingsModeClose();
void d_UI_BoardDebugModeClose();
void d_UI_AutocrossModeClose();
#line 15 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_ui_controller.h"
void d_UIController_init();

OperatingMode d_UI_getOperatingMode(void);

int d_UI_OperatingModeChanged(void);

void d_UI_setOperatingMode(OperatingMode mode);

OperatingMode d_selectorPositionToMode(signed char position);

OperatingMode d_UI_getOperatingMode(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_operating_modes.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/debug.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/../modules/ui/display/dd_global_defines.h"
#line 9 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/debug.h"
extern char dstr[100];

void Debug_UART_Init();
void Debug_Timer4_Init();
void Debug_UART_Write(char* text);
void Debug_UART_WriteChar(char c);
void printf(char* string);
void initTimer32(void);
void resetTimer32(void);
double getExecTime(void);
void stopTimer32();
void startTimer32();
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_autocross.h"








void dAutocross_init(void);

unsigned int dAutocross_hasResetOccurred(void);

void dAutocross_clearReset(void);

void dAutocross_restartAutocross(void);

unsigned int dAutocross_hasGCUConfirmed (void);

void dAutocross_requestAction();

char dAutocross_isAutoAccelerationActive(void);

char dAutocross_isReleasingClutch(void);

void dAutocross_feedbackGCU(unsigned int value);

void dAutocross_stopAutocrossFromSW(void);

void dAutocross_stopAutocross(void);

char dAutocross_isTimeToGo(void);

char dAutocross_isActive(void);

void dAutocross_startClutchRelease(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_drs.h"
#line 13 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_drs.h"
void d_drs_propagateChange(void);

char d_drs_isOpen(void);

void d_drs_setValueFromCAN(unsigned int value);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/buttons.h"
#line 48 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/buttons.h"
void button_onR1Down(void);

void button_onR2Down(void);

void button_onR3Down(void);

void button_onL1Down(void);

void button_onL2Down(void);

void button_onL3Down(void);

void button_onBRDown(void);

void button_onBLDown(void);

void button_onCDown(void);

void Buttons_init(void);

void Buttons_protractPress(unsigned char button, unsigned int milliseconds);

void Buttons_tick(void);

char Buttons_isPressureProtracted(void);

void Buttons_clearPressureProtraction(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_menu.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_indicators.h"
#line 16 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_menu.h"
void dd_Menu_init();
void dd_printMenu();

unsigned char dd_Menu_selectedLine();

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);
#line 34 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/display/dd_menu.h"
void dd_Menu_moveSelection(signed char movements);

void dd_Menu_selectDown(void);
void dd_Menu_selectUp(void);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/d_traction_control.h"










void d_traction_control_decrease(void);

void d_traction_control_increase(void);

void d_traction_control_init(void);

void d_traction_control_setOldValue(void);

void d_traction_control_setValueFromCAN(unsigned int value);

void d_traction_control_propagateValue(signed char value);
#line 31 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/d_controls.c"
void  button_onBRDown () {

 if (dGear_canGearUp() || dGear_isNeutralSet()) {
 Can_writeInt( 0b01000000000 ,  400 );
 } else {

 }
}

void  button_onBLDown () {

 if (dGear_canGearDown() || dGear_isNeutralSet()) {
 Can_writeInt( 0b01000000000 ,  200 );
 } else {

 }
}

void  button_onCDown () {
 if (getExternalInterruptEdge( 8 ) ==  1 ) {
 dSignalLed_set( 2 );
 dStart_switchOn();
 switchExternalInterruptEdge( 8 );
 } else {
 dSignalLed_unset( 2 );
 dStart_switchOff();
 switchExternalInterruptEdge( 8 );
 }
}

void  button_onL3Down () {
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


void  button_onR3Down () {
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

void  button_onL2Down () {
 if (!dGear_isNeutralSet()) {
 if (dGear_get() == 1) {
 Can_writeInt( 0b01000000000 ,  50 );
 } else if (dGear_get() == 2) {
 Can_writeInt( 0b01000000000 ,  100 );
 }
 }
}

void  button_onR1Down () {
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


void  button_onR2Down () {
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

void  button_onL1Down () {
 OperatingMode currentOperatingMode;
 currentOperatingMode = d_UI_getOperatingMode();
 switch(currentOperatingMode){
 case DEBUG_MODE:
 dDCU_switchAcquisition();
 case SETTINGS_MODE:
 d_UI_onSettingsChange( 1 );
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
