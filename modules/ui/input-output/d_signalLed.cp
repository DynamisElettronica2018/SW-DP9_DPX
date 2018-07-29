#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/d_signalLed.c"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/basic.h"
#line 17 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
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
#line 32 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 12 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/d_signalLed.c"
void dSignalLed_init(void) {
  TRISF5_bit  =  0 ;
  TRISF4_bit  =  0 ;
  TRISG1_bit  =  0 ;
 dSignalLed_set( 1 );
 dSignalLed_set( 2 );
 dSignalLed_set( 0 );
 delay_ms(100);
 dSignalLed_unset( 1 );
 dSignalLed_unset( 2 );
 dSignalLed_unset( 0 );
}

void dSignalLed_switch(unsigned char led) {
 switch (led) {
 case  0 :
  RF5_bit  = ! RF5_bit ;
 break;
 case  1 :
  RF4_bit  = ! RF4_bit ;
 break;
 case  2 :
  RG1_bit  = ! RG1_bit ;
 break;
 }
}

void dSignalLed_set(unsigned char led) {
 switch (led) {
 case  0 :
  RF5_bit  =  1 ;
 break;
 case  1 :
  RF4_bit  =  1 ;
 break;
 case  2 :
  RG1_bit  =  1 ;
 break;
 }
}

void dSignalLed_unset(unsigned char led) {
 switch (led) {
 case  0 :
  RF5_bit  =  0 ;
 break;
 case  1 :
  RF4_bit  =  0 ;
 break;
 case  2 :
  RG1_bit  =  0 ;
 break;
 }
}
