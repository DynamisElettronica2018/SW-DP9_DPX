#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/buzzer.c"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/buzzer.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/basic.h"
#line 17 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/basic.h"
#line 186 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/dspic.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/music.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/dspic.h"
#line 11 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/../../../libs/music.h"
char Music_hasToMakeSound(void);

void Music_tick(void);

void Music_setSongTime(unsigned int time);

void Music_playSong(unsigned char song[], unsigned int songLength);

void Music_playSongNextNote(void);

void Music_playNote(unsigned char note, unsigned char duration);

float Music_getActualNoteDuration(unsigned char duration);

float Music_getNoteFrequency(unsigned char note);
#line 20 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/ui/input-output/buzzer.h"
void Buzzer_init(void);

void Buzzer_tick(void);

void Buzzer_bip(void);
#line 8 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/buzzer.c"
unsigned int buzzer_ticks = 0, buzzer_bipTicks;

 void timer4_interrupt() iv IVT_ADDR_T4INTERRUPT ics ICS_AUTO {
  IFS1bits.T4IF  = 0 ;
 Buzzer_tick();
#line 20 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/modules/ui/input-output/buzzer.c"
}

void Buzzer_init(void) {
  TRISD0_bit  =  0 ;
  RD0_bit  = 0;
 setTimer( 3 ,  0.0005 );
 setInterruptPriority( 3 ,  5 );
 buzzer_bipTicks = (int) ( 0.1  /  0.0005 );
}

void Buzzer_tick(void) {
 if (buzzer_ticks > 0) {
 buzzer_ticks -= 1;
  RD0_bit  = ! RD0_bit ;
 }
}

void Buzzer_bip(void) {
 buzzer_ticks = buzzer_bipTicks;
}
