/*
 * DRS_AT90CAN.c
 *
 * Created: 07.05.2019 21:32:31
 * Author : Eryk Miśkiewicz
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

ISR(INT0_vect){
	PORTD |= 1<<DDB0;
	cli();
	OCR1AL=254;
	sei();
}

ISR(INT1_vect){
	PORTD &= 0xff & 0<<DDB0;
	cli();
	OCR1AL=190;
	sei();
}


int main(void)
{
	cli();
	DDRB |= 1<<DDB0 | 1<<DDB2 | 1<<DDB3; //Ledy na PD0 PD2 PD3 jako wyjścia;
	EICRA |= 1<<ISC21 | 1<<ISC31; // Falling edge on INT2 & INT3
	EIMSK |= 1<<INT2 | 1<<INT3; //Enable INT2 & INT3
	TCCR1A |= 1<<COM1A1 | 1<<COM1B1; //Clear OCnA/OCnB/OCnC on Compare Match (Set output to low level).
	TCCR1B |= 1<<CS11; //Prescaler 8
	sei();
	
    while (1) 
    {
		
    }
}

