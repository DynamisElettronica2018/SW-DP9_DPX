//
// Created by Aaron Russo on 20/06/16.
//

#include "d_ledStripe.h"

unsigned char dLedStripe_colorSelector = DLS_RED;
unsigned char dLedStripe_redStripe = 0, dLedStripe_greenStripe = 0, dLedStripe_blueStripe = 0;
unsigned char dRedPersistenceCounter = 0;

void dLedStripe_init(void) {
    DLS_0_Direction = OUTPUT;
    DLS_1_Direction = OUTPUT;
    DLS_2_Direction = OUTPUT;
    DLS_3_Direction = OUTPUT;
    DLS_4_Direction = OUTPUT;
    DLS_5_Direction = OUTPUT;
    DLS_RED_Direction = OUTPUT;
    DLS_GREEN_Direction = OUTPUT;
    DLS_BLUE_Direction = OUTPUT;
    dLedStripe_clear();
}

void dLedStripe_debugByte(unsigned char debugByte) {
    unsigned char i;
    for (i = DLS_LED_COUNT; i > 0; i -= 1) {
        if (debugByte & 1) {
            dLedStripe_setLedColorAtPosition(DLS_RED, i - 1);
        } else {
            dLedStripe_setLedColorAtPosition(DLS_BLACK, i - 1);
        }
        debugByte = debugByte >> 1;
    }
}

void dLedStripe_clear(void) {
    unsigned char i = 0;
    for (i = 0; i < DLS_LED_COUNT; i += 1) {
        dLedStripe_setLedColorAtPosition(DLS_BLACK, i);
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
    for (i = 0; i < DLS_LED_COUNT; i += 1) {
        dLedStripe_setLedColorAtPosition(colors[i], i);
    }
}

void dLedStripe_switchLedColorAtPosition(unsigned char color, unsigned char led) {
    unsigned char currentColor;
    currentColor = dLedStripe_getLedColorAtPosition(led);
    if (color == currentColor) {
        dLedStripe_setLedColorAtPosition(DLS_BLACK, led);
    } else {
        dLedStripe_setLedColorAtPosition(color, led);
    }
}

unsigned char dLedStripe_getLedColorAtPosition(unsigned char led) {
    unsigned char finalColor;
    finalColor = 0;
    if ((dLedStripe_redStripe >> led) & 1) {
        finalColor = finalColor | DLS_RED;
    }
    if ((dLedStripe_greenStripe >> led) & 1) {
        finalColor = finalColor | DLS_GREEN;
    }
    if ((dLedStripe_blueStripe >> led) & 1) {
        finalColor = finalColor | DLS_BLUE;
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
        case DLS_RED:
            dLedStripe_hardSetLedStripe(dLedStripe_redStripe);
            dLedStripe_hardSetColor(dLedStripe_colorSelector);
            dRedPersistenceCounter += 1;
            if (dRedPersistenceCounter == DLS_RED_PERSISTENCE) {
                dLedStripe_colorSelector = DLS_GREEN;
                dRedPersistenceCounter = 0;
            }
            break;
        case DLS_GREEN:
            dLedStripe_hardSetLedStripe(dLedStripe_greenStripe);
            dLedStripe_hardSetColor(dLedStripe_colorSelector);
            dLedStripe_colorSelector = DLS_BLUE;
            break;
        case DLS_BLUE:
            dLedStripe_hardSetLedStripe(dLedStripe_blueStripe);
            dLedStripe_hardSetColor(dLedStripe_colorSelector);
            dLedStripe_colorSelector = DLS_RED;
            break;
    }
}

void dLedStripe_hardSetLedStripe(unsigned char stripe) {
    unsigned char i;
    for (i = 0; i < DLS_LED_COUNT; i += 1) {
        if (stripe & 1) {
            dLedStripe_hardSetLedPin(i);
        } else {
            dLedStripe_hardUnsetLedPin(i);
        }
        stripe = stripe >> 1;
    }
}

void dLedStripe_hardClearColors(void) {
    DLS_RED_Pin = DLS_COLOR_OFF;
    DLS_BLUE_Pin = DLS_COLOR_OFF;
    DLS_GREEN_Pin = DLS_COLOR_OFF;
}

void dLedStripe_hardSetColor(unsigned char color) {
    switch (color) {
        case DLS_RED:
            DLS_RED_Pin = DLS_COLOR_ON;
            break;
        case DLS_GREEN:
            DLS_GREEN_Pin = DLS_COLOR_ON;
            break;
        case DLS_BLUE:
            DLS_BLUE_Pin = DLS_COLOR_ON;
            break;
    }
}

void dLedStripe_hardSetLedPin(unsigned char led) {
    switch (led) {
        case DLS_LED_0:
            DLS_0_Pin = DLS_LED_ON;
            break;
        case DLS_LED_1:
            DLS_1_Pin = DLS_LED_ON;
            break;
        case DLS_LED_2:
            DLS_2_Pin = DLS_LED_ON;
            break;
        case DLS_LED_3:
            DLS_3_Pin = DLS_LED_ON;
            break;
        case DLS_LED_4:
            DLS_4_Pin = DLS_LED_ON;
            break;
        case DLS_LED_5:
            DLS_5_Pin = DLS_LED_ON;
            break;
    }
}

void dLedStripe_hardUnsetLedPin(unsigned char led) {
    switch (led) {
        case DLS_LED_0:
            DLS_0_Pin = DLS_LED_OFF;
            break;
        case DLS_LED_1:
            DLS_1_Pin = DLS_LED_OFF;
            break;
        case DLS_LED_2:
            DLS_2_Pin = DLS_LED_OFF;
            break;
        case DLS_LED_3:
            DLS_3_Pin = DLS_LED_OFF;
            break;
        case DLS_LED_4:
            DLS_4_Pin = DLS_LED_OFF;
            break;
        case DLS_LED_5:
            DLS_5_Pin = DLS_LED_OFF;
            break;
    }
}