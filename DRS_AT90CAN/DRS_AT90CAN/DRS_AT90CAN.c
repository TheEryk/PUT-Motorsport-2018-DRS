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

int main(void)
{
DDRB |= 1<<DDB0 | 1<<DDB2 | 1<<DDB3;
PORTB = 0x00;

	can_init(BITRATE_500_KBPS);
	
	/*filtersetup.flags.rtr = 0;
	filtersetup.id = 0x00;
	filtersetup.mask = 0x00;*/
	can_set_filter(1, &filtersetup);
	
can_t msg;

msg.id = 0x1;
msg.flags.rtr = 0;
//msg.flags.extended = 0;

msg.length = 4;
msg.data[0] = 0x01;
msg.data[1] = 0x02;
msg.data[2] = 0x03;
msg.data[3] = 0x04;

//can_send_message(&msg);
sei();

can_t rxmsg;

    while(1)
    {
        //TODO:: Please write your application code 
		if(can_check_message())
		{
			PORTB |= 1<<DDB3;
			if(can_get_message(&rxmsg))
			{
				if(rxmsg.length == 8)
				{
					// zapal diode jesli 7bajt jest równy 0xff
					if(rxmsg.data[6] == 0xff)
					{
						PORTB ^= 1<<DDB3;
					}
				}
			}
		}
    }
}