/*
 * DRS_AT90CAN.c
 *
 * Created: 2019-05-27 22:01:50
 *  Author: Tomek
 */ 


#include <avr/io.h>

#define F_CPU 16000000UL
#include "can.h"
#include <util/delay.h>
#include <avr/interrupt.h>

const can_filter_t filtersetup = {0,0,{0}};

void DrsInit();
void DrsOpen();
void DrsClose();

void LedInit();

int main(void)
{
	// preskaler zegara cpu na 1
	asm("ldi r16,0x80");
	asm("sts 0x61,r16"); //CLKPR
	asm("sts 0x61,r16"); // CLKPR
	
	LedInit();
	DrsInit();

	can_init(BITRATE_500_KBPS);
	can_set_filter(1, &filtersetup);
	
/*can_t msg;

msg.id = 0x1;
msg.flags.rtr = 0;
//msg.flags.extended = 0;

msg.length = 4;
msg.data[0] = 0x01;
msg.data[1] = 0x02;
msg.data[2] = 0x03;
msg.data[3] = 0x04;

//can_send_message(&msg);*/

// odblokowane przerwania dla CANa
sei();

can_t rxmsg;

    while(1)
    {
        //TODO:: Please write your application code 
		if(can_check_message())
		{
			// przykladowa obsluga Cana
			// ramka o ID = 40, dlugoœci danych 1 bajt,
			// jesli ten bajt == 0xff to otwórz drs
			// jesli ten bajt == 0x01 to zamknij drs
			if(can_get_message(&rxmsg))
			{
				if(rxmsg.id == 40 && rxmsg.length == 1 && rxmsg.data[0] == 0xff)
				{
					DrsOpen();
				}
				if(rxmsg.id == 40 && rxmsg.length == 1 && rxmsg.data[0] == 0x01)
				{
					DrsClose();
				}
			}
		}
		//
    }
}

#define WGM1setting 0b1110 // fast PWM, Top ICR1
#define PRESCALER_1	0b001
#define ICR1_TOP 19999 // 16 000 000 / 40 000 = 400 Hz kurde przy 40000 200 Hz

#define OCR1A_CLOSE 3300 // minimum 3300, skrajna pozycja
#define OCR1A_OPEN 17700 // max 17700, skrajna pozycja

#define OCR1B_CLOSE 17700
#define OCR1B_OPEN 3300

void DrsInit()
{
	DDRB |= (1<<DDB5)|(1<<DDB6); //  do koñca nie wiem czy to konieczne
	
	TCCR1A = (0b11 & WGM1setting)|(1<<COM1A1);
	TCCR1B = 0b11000 & (WGM1setting << 3);
	TCCR1C = 0;
	TIMSK1 = 0;
	
	TCNT1 = 0;
	ICR1 = ICR1_TOP;
	OCR1A = OCR1A_CLOSE;
	OCR1B = OCR1B_CLOSE;
	
	// start
	TCCR1B |= PRESCALER_1;
}

void DrsOpen()
{
	OCR1A = OCR1A_OPEN;
	OCR1B = OCR1B_OPEN;
}

void DrsClose()
{
	OCR1A = OCR1A_CLOSE;
	OCR1B = OCR1B_CLOSE;
}

void LedInit()
{
	DDRB |= 1<<DDB0 | 1<<DDB2 | 1<<DDB3;
	PORTB = ~((~PORTB) | (1<<DDB0 | 1<<DDB2 | 1<<DDB3)); // wyzerowanie odpowiednich bitów
}