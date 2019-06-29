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

#define DRS_MAX_OPEN_TICKS	200
#define TIMER_MAX_VAL		0xFFFFFFFF

//	stan DRSa (otwarty -> 1, zamkniety -> 0)
uint8_t DRS_state = 0;

// flaga problemu z canem gdy nie otrzyma ramki w odpowiednim czasie
uint8_t CAN_frame_timeout_flag = 0;

//	czy DRS jest umozliwiony (jesli dojdzie do awarii, czyli przepelnienia czasu otworzenia DRSa wylacz mozliwosc ponownego wlaczenia)
//(dostepny -> 1, niedostepny -> 0)
uint8_t DRS_available = 1;

//	stan licznika timera
volatile uint64_t timer_counter = 0;

//	stan licznika timera przy uruchomieniu DRS
volatile uint64_t DRS_timer_count = 0;

// trigger wysylania ramki o stanie DRS'a
volatile uint8_t DRS_state_msg_trig = 0;

/*
Przerwanie timer 1{
timer_counter++;
if(timertimer_counter - DRS_MAX_OPEN_TICKS > DRS_timer_count ){
// wyjebka DRSa
DRS_available = 0;
CrsClose();
}
}
*/
ISR(TIMER0_COMP_vect)
{
	static uint64_t DRS_state_msg_next_tick = 100;
	TCNT0 = 0;
	timer_counter++;
	
	// old timer_counter % 100 == 0
	// trigger wysylania ramki can ze statusem drsu dla aima
	if(timer_counter >= DRS_state_msg_next_tick )
	{
		DRS_state_msg_next_tick += 100;
		DRS_state_msg_trig = 1;
	}
	
	// jesli uplynie czas odświeżenia wiadomości CAN to zamknij DRS
	if(timer_counter - DRS_MAX_OPEN_TICKS > DRS_timer_count ){
		// wyjebka DRSa
		//DRS_available = 0;
		CAN_frame_timeout_flag = 1;
		DrsClose();
	}
}

/*
Przerwanie timer 2{
can_send_message(&msg)		//	ze stanem DRSa
}

*/

void DrsPwmInit();
void DrsOpen();
void DrsClose();

void LedInit();
void LedThread();
void TickTimerInit();

void CanThread();

int main(void)
{
	// preskaler zegara cpu na 1
	asm("ldi r16,0x80");
	asm("sts 0x61,r16"); //CLKPR
	asm("sts 0x61,r16"); // CLKPR
	
	LedInit();
	DrsPwmInit();
	TickTimerInit();

	can_init(BITRATE_1_MBPS);
	can_set_filter(1, &filtersetup);
	
	can_t msg;

	msg.id = 0x22;
	msg.flags.rtr = 0;
	//msg.flags.extended = 0;

	msg.length = 4;
	msg.data[0] = 0x01;
	msg.data[1] = 0x02;
	msg.data[2] = 0x03;
	msg.data[3] = 0x04;

	//can_send_message(&msg);

	// odblokowane przerwania dla CANa
	sei();

	can_t rxmsg;

	while(1)
	{
		CanThread();
		LedThread();
	}
}

#define WGM1setting 0b1110 // fast PWM, Top ICR1
#define PRESCALER_1	0b001
#define ICR1_TOP 48048 // 16 000 000 / 48 048 = 333 Hz

#define OCR1A_CLOSE 3300 // minimum 3300, skrajna pozycja
#define OCR1A_OPEN 17700 // max 17700, skrajna pozycja

#define OCR1B_CLOSE 17700
#define OCR1B_OPEN 3300

void DrsPwmInit()
{
	DDRB |= (1<<DDB5)|(1<<DDB6); //  do ko�ca nie wiem czy to konieczne
	
	TCCR1A = (0b11 & WGM1setting)|(1<<COM1A1)|(1<<COM1B1);
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
	if( DRS_state == 1 ) return; // juz otwarte wiec nic nie rob
	OCR1A = OCR1A_OPEN;
	OCR1B = OCR1B_OPEN;
	DRS_state = 1;
}

void DrsClose()
{
	if( DRS_state == 0 ) return; // juz zamkniete wiec nic nie rob
	OCR1A = OCR1A_CLOSE;
	OCR1B = OCR1B_CLOSE;
	DRS_state = 0;
}

void LedInit()
{
	DDRB |= 1<<DDB0 | 1<<DDB2 | 1<<DDB3;
	PORTB = ~((~PORTB) | (1<<DDB0 | 1<<DDB2 | 1<<DDB3)); // wyzerowanie odpowiednich bit�w
}

void LedThread( uint8_t num )
{
	// DDB0 status DRS
	if(DRS_state == 1) PORTB |= 1<<DDB0;
	else PORTB = ~((~PORTB)|(1<<DDB0));
	// DDB2 can frame problem
	if(CAN_frame_timeout_flag == 1) PORTB |= 1<<DDB2;
	else PORTB = ~((~PORTB)|(1<<DDB2));
}

void TickTimerInit(){
	// fcpu 16 MHz
	// preskaler 64
	// comp 249
	// 16 000 000 / (64 * (249+1)) = 16000 ---> 1ms
	TCCR0A = 1<<CS1 | 1 << CS0;
	TCNT0 = 0;
	OCR0A = 249;
	TIFR0 = 0b11; // clearing interrupt flags
	TIMSK0 = 1<<OCIE0A;
}



#define FRAME_DRS_SWITCH_ID   0x01
#define FRAME_DRS_SWITCH_BYTE 7
#define FRAME_DRS_SWITCH_BIT  3

#define FRAME_BRAKE_ID   0x01
#define FRAME_BRAKE_BYTE 7
#define FRAME_BRAKE_BIT  0

#define FRAME_DRS_STATUS_ID   0x00
#define FRAME_DRS_STATUS_BYTE 0 // nie można zmienić, tylko informacyjny
#define FRAME_DRS_STATUS_BIT  0

void CanThread()
{
	static can_t rx_message; // received message structure
	static can_t tx_message;
	if(can_get_message(&rx_message))
	{
		// ramka odebrana hamulca
		if( rx_message.id == FRAME_DRS_SWITCH_ID && rx_message.length == 8)
		{
			if((rx_message.data[FRAME_DRS_SWITCH_BYTE]>>FRAME_DRS_SWITCH_BIT)&0x01)
			{
				// sygna� otwarcia Drsa
				// timestamp
				if(DRS_available){
					DrsOpen();
					DRS_timer_count = timer_counter;
				}
			}
			else
			{
				// sygna� zamkniecia Drsa
				// timestamp nie ustawiany, drs zamknie się automatycznie w przerwaniu po ustalonym czasie
				DrsClose();
				DRS_timer_count = timer_counter;
			}
		}
		if( rx_message.id == FRAME_BRAKE_ID )
		{
			if((rx_message.data[FRAME_BRAKE_BYTE]>>FRAME_BRAKE_BIT)&0x01 == 1)
			{
				DRS_available = 0; // drs not available
				DrsClose();
			}
			else
			{
				// drs available after braking stop
				DRS_available = 1;
			}
		}
		
	}
	if(DRS_state_msg_trig == 1)
	{
		DRS_state_msg_trig = 0;
		
		tx_message.id = FRAME_DRS_STATUS_ID; // 13
		tx_message.flags.rtr = 0;
		tx_message.length = 1;
		tx_message.data[0] = (DRS_state&0x01)<<FRAME_DRS_STATUS_BIT;
		can_send_message(&tx_message);
	}
}