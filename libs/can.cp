#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/libs/can.c"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/can.h"
#line 52 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/libs/can.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw-dp9_dpx/modules/peripherals/../../libs/can.h"
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
#line 30 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/libs/can.c"
unsigned char can_dataOutBuffer[ 8 ];
unsigned int can_dataOutLength = 0;
unsigned int can_txPriority =  _CAN_TX_PRIORITY_1 ;
unsigned int can_err = 0;
unsigned int can_rerrcnt = 0;
unsigned int can_terrcnt = 0;
unsigned int can_errcnt = 0;

void Can_init() {
 unsigned int Can_Init_flags = 0;
 Can_Init_flags = _CAN_CONFIG_STD_MSG &
 _CAN_CONFIG_DBL_BUFFER_OFF &
 _CAN_CONFIG_MATCH_MSG_TYPE &
 _CAN_CONFIG_LINE_FILTER_ON &
 _CAN_CONFIG_SAMPLE_THRICE &
 _CAN_CONFIG_PHSEG2_PRG_ON;
 CAN1Initialize(2, 4, 3, 4, 2, Can_Init_flags);
 CAN1SetOperationMode(_CAN_MODE_CONFIG, 0xFF);

 CAN1SetMask(_CAN_MASK_B1,  0b11111100000 , _CAN_CONFIG_MATCH_MSG_TYPE & _CAN_CONFIG_STD_MSG);
 CAN1SetFilter(_CAN_FILTER_B1_F1,  0b01100000000 , _CAN_CONFIG_STD_MSG);
 CAN1SetFilter(_CAN_FILTER_B1_F2,  0b11100000000 , _CAN_CONFIG_STD_MSG);

 CAN1SetMask(_CAN_MASK_B2,  0b11111110000 , _CAN_CONFIG_MATCH_MSG_TYPE & _CAN_CONFIG_STD_MSG);
 CAN1SetFilter(_CAN_FILTER_B2_F1,  0b11111110000 , _CAN_CONFIG_STD_MSG);

 CAN1SetOperationMode(_CAN_MODE_NORMAL, 0xFF);

 Can_initInterrupt();
 Can_setWritePriority( _CAN_TX_PRIORITY_1 );
}

unsigned int Can_read(unsigned long int *id, char* dataBuffer, unsigned int *dataLength, unsigned int *inFlags) {
 if (Can_B0hasBeenReceived()) {
 Can_clearB0Flag();
 return CAN1Read(id, dataBuffer, dataLength, inFlags);

 }
 else if (Can_B1hasBeenReceived()) {
 Can_clearB1Flag();
 return CAN1Read(id, dataBuffer, dataLength, inFlags);

 }
}

void Can_writeByte(unsigned long int id, unsigned char dataOut) {
 Can_resetWritePacket();
 Can_addByteToWritePacket(dataOut);
 Can_write(id);
}

void Can_writeInt(unsigned long int id, int dataOut) {
 Can_resetWritePacket();
 Can_addIntToWritePacket(dataOut);
 Can_write(id);
}


void Can_addIntToWritePacket(int dataOut) {
 Can_addByteToWritePacket((unsigned char) (dataOut >> 8));
 Can_addByteToWritePacket((unsigned char) (dataOut & 0xFF));
}

void Can_addByteToWritePacket(unsigned char dataOut) {
 can_dataOutBuffer[can_dataOutLength] = dataOut;
 can_dataOutLength += 1;
}

void Can_write(unsigned long int id) {
 unsigned int sent, i = 0, j = 0;
 do {
 sent = CAN1Write(id, can_dataOutBuffer,  8 , Can_getWriteFlags());
 i += 1;
 } while ((sent == 0) && (i <  50 ));
 if (i ==  50 ) {
 can_err++;
 }
}

void Can_setWritePriority(unsigned int txPriority) {
 can_txPriority = txPriority;
}

void Can_resetWritePacket(void) {
 for (can_dataOutLength = 0; can_dataOutLength <  8 ; can_dataOutLength += 1) {
 can_dataOutBuffer[can_dataOutLength] = 0;
 }
 can_dataOutLength = 0;
}

unsigned int Can_getWriteFlags(void) {
 return  _CAN_TX_STD_FRAME & _CAN_TX_NO_RTR_FRAME  & can_txPriority;
}

unsigned char Can_B0hasBeenReceived(void) {
 return  C1INTFBITS.RXB0IF  == 1;
}

unsigned char Can_B1hasBeenReceived(void) {
 return  C1INTFBITS.RXB1IF  == 1;
}

void Can_clearB0Flag(void) {
  C1INTFBITS.RXB0IF  = 0;
}

void Can_clearB1Flag(void) {
  C1INTFBITS.RXB1IF  = 0;
}

void Can_clearInterrupt(void) {
  IFS1BITS.C1IF  = 0;
}

void Can_initInterrupt(void) {
#line 151 "C:/Users/sofia/Desktop/GIT REPO/SW-DP9_DPX/libs/can.c"
 IEC1BITS.C1IE = 1;
 C1INTEBITS.RXB0IE = 1;
 C1INTEBITS.RXB1IE = 1;

 }
