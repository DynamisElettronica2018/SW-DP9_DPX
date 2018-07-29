#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/d_ledStripe.c"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_ledstripe.h"
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
#line 77 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/d_ledstripe.h"
void dLedStripe_init(void);

void dLedStripe_debugByte(unsigned char debugByte);

void dLedStripe_clear(void);

void dLedStripe_setLedColorAtPosition(unsigned char color, unsigned char led);

void dLedStripe_setLedStripe(unsigned char colors[]);

void dLedStripe_switchLedColorAtPosition(unsigned char color, unsigned char led);

unsigned char dLedStripe_getLedColorAtPosition(unsigned char led);

void dLedStripe_setLedFromByteStripe(unsigned char *stripe, unsigned char led, unsigned char on);

void dLedStripe_updateFrame(void);

void dLedStripe_hardSetLedStripe(unsigned char stripe);

void dLedStripe_hardClearColors(void);

void dLedStripe_hardSetColor(unsigned char color);

void dLedStripe_hardSetLedPin(unsigned char led);

void dLedStripe_hardUnsetLedPin(unsigned char led);
#line 7 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/d_ledStripe.c"
unsigned char dLedStripe_colorSelector =  0b00000001 ;
unsigned char dLedStripe_redStripe = 0, dLedStripe_greenStripe = 0, dLedStripe_blueStripe = 0;
unsigned char dRedPersistenceCounter = 0;

void dLedStripe_init(void) {
  TRISD2_bit  =  0 ;
  TRISD3_bit  =  0 ;
  TRISD4_bit  =  0 ;
  TRISD5_bit  =  0 ;
  TRISD6_bit  =  0 ;
  TRISD7_bit  =  0 ;
  TRISG12_bit  =  0 ;
  TRISG0_bit  =  0 ;
  TRISG14_bit  =  0 ;
 dLedStripe_clear();
}

void dLedStripe_debugByte(unsigned char debugByte) {
 unsigned char i;
 for (i =  6 ; i > 0; i -= 1) {
 if (debugByte & 1) {
 dLedStripe_setLedColorAtPosition( 0b00000001 , i - 1);
 } else {
 dLedStripe_setLedColorAtPosition( 0b00000000 , i - 1);
 }
 debugByte = debugByte >> 1;
 }
}

void dLedStripe_clear(void) {
 unsigned char i = 0;
 for (i = 0; i <  6 ; i += 1) {
 dLedStripe_setLedColorAtPosition( 0b00000000 , i);
 }
}

void dLedStripe_setLedColorAtPosition(unsigned char color, unsigned char led) {
 dLedStripe_setLedFromByteStripe(&dLedStripe_redStripe, led, color & 1);
 color = color >> 1;
 dLedStripe_setLedFromByteStripe(&dLedStripe_greenStripe, led, color & 1);
 color = color >> 1;
 dLedStripe_setLedFromByteStripe(&dLedStripe_blueStripe, led, color & 1);
}

void dLedStripe_setLedStripe(unsigned char colors[]) {
 unsigned char i;
 for (i = 0; i <  6 ; i += 1) {
 dLedStripe_setLedColorAtPosition(colors[i], i);
 }
}

void dLedStripe_switchLedColorAtPosition(unsigned char color, unsigned char led) {
 unsigned char currentColor;
 currentColor = dLedStripe_getLedColorAtPosition(led);
 if (color == currentColor) {
 dLedStripe_setLedColorAtPosition( 0b00000000 , led);
 } else {
 dLedStripe_setLedColorAtPosition(color, led);
 }
}

unsigned char dLedStripe_getLedColorAtPosition(unsigned char led) {
 unsigned char finalColor;
 finalColor = 0;
 if ((dLedStripe_redStripe >> led) & 1) {
 finalColor = finalColor |  0b00000001 ;
 }
 if ((dLedStripe_greenStripe >> led) & 1) {
 finalColor = finalColor |  0b00000010 ;
 }
 if ((dLedStripe_blueStripe >> led) & 1) {
 finalColor = finalColor |  0b00000100 ;
 }
 return finalColor;
}

void dLedStripe_setLedFromByteStripe(unsigned char *stripe, unsigned char led, unsigned char on) {
 if (on) {
 *stripe = *stripe | (1 << led);
 } else {
 *stripe = *stripe & (~(1 << led));
 }
}

void dLedStripe_updateFrame(void) {
 dLedStripe_hardClearColors();
 switch (dLedStripe_colorSelector) {
 case  0b00000001 :
 dLedStripe_hardSetLedStripe(dLedStripe_redStripe);
 dLedStripe_hardSetColor(dLedStripe_colorSelector);
 dRedPersistenceCounter += 1;
 if (dRedPersistenceCounter ==  7 ) {
 dLedStripe_colorSelector =  0b00000010 ;
 dRedPersistenceCounter = 0;
 }
 break;
 case  0b00000010 :
 dLedStripe_hardSetLedStripe(dLedStripe_greenStripe);
 dLedStripe_hardSetColor(dLedStripe_colorSelector);
 dLedStripe_colorSelector =  0b00000100 ;
 break;
 case  0b00000100 :
 dLedStripe_hardSetLedStripe(dLedStripe_blueStripe);
 dLedStripe_hardSetColor(dLedStripe_colorSelector);
 dLedStripe_colorSelector =  0b00000001 ;
 break;
 }
}

void dLedStripe_hardSetLedStripe(unsigned char stripe) {
 unsigned char i;
 for (i = 0; i <  6 ; i += 1) {
 if (stripe & 1) {
 dLedStripe_hardSetLedPin(i);
 } else {
 dLedStripe_hardUnsetLedPin(i);
 }
 stripe = stripe >> 1;
 }
}

void dLedStripe_hardClearColors(void) {
  LATG12_bit  =  1 ;
  RG14_bit  =  1 ;
  RG0_bit  =  1 ;
}

void dLedStripe_hardSetColor(unsigned char color) {
 switch (color) {
 case  0b00000001 :
  LATG12_bit  =  0 ;
 break;
 case  0b00000010 :
  RG0_bit  =  0 ;
 break;
 case  0b00000100 :
  RG14_bit  =  0 ;
 break;
 }
}

void dLedStripe_hardSetLedPin(unsigned char led) {
 switch (led) {
 case  0 :
  RD2_bit  =  1 ;
 break;
 case  1 :
  RD3_bit  =  1 ;
 break;
 case  2 :
  RD4_bit  =  1 ;
 break;
 case  3 :
  RD5_bit  =  1 ;
 break;
 case  4 :
  RD6_bit  =  1 ;
 break;
 case  5 :
  RD7_bit  =  1 ;
 break;
 }
}

void dLedStripe_hardUnsetLedPin(unsigned char led) {
 switch (led) {
 case  0 :
  RD2_bit  =  0 ;
 break;
 case  1 :
  RD3_bit  =  0 ;
 break;
 case  2 :
  RD4_bit  =  0 ;
 break;
 case  3 :
  RD5_bit  =  0 ;
 break;
 case  4 :
  RD6_bit  =  0 ;
 break;
 case  5 :
  RD7_bit  =  0 ;
 break;
 }
}
