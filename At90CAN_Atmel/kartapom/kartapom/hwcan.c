/*
 * Jun 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#include <avr/io.h>
#include <avr/interrupt.h>

#include <string.h>

#include "system.h"

void hwcan_init(void)
{
    CANGCON = _BV(SWRES);

    CANBT1 = 0x00;
    CANBT2 = 0x0C;
    CANBT3 = 0x36;

    CANTCON = 200 - 1;

    CANGIE = 0;
    CANIE1 = 0;
    CANIE2 = 0;

    CANPAGE = 0;
    CANCDMOB = 0;
    CANSTMOB = 0;

    CANGCON = _BV(ENASTB);
}

int8_t hwcan_send(uint8_t page, uint16_t id, uint8_t framesiz, void *framedat)
{
    CANPAGE = page << 4;

    if ((CANCDMOB & _BV(CONMOB0) && !(CANSTMOB & _BV(TXOK))))
        return -1;

    CANCDMOB = 0;
    CANSTMOB = 0;

    CANIDT4 = 0;
    CANIDT3 = 0;
    CANIDT2 = (uint8_t) id << 5;
    CANIDT1 = (uint16_t) id >> 3;

    for (uint8_t i = 0; i < framesiz; i++)
        CANMSG = ((uint8_t *) framedat)[i];

    CANCDMOB = framesiz | _BV(CONMOB0);

    return 0;
}
