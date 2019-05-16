/*
 * main.c
 *
 *  Created on: 3 lis 2018
 *      Author: soko2
 */
#include <avr/io.h>
#ifndef F_CPU
	#define F_CPU 16000000UL
	//#define F_CPU 20000000UL // odkomentowac jesli fuse jest ustawiony by dzielic sygnal z kwarcu przez 8
#endif
#include <util/delay.h>
#include <avr/interrupt.h>


#define KEY_PIN1 (1<<PIND2)
#define KEY_DOWN1 ! (PIND & KEY_PIN1)

#define KEY_PIN2 (1<<PIND3)
#define KEY_DOWN2 ! (PIND & KEY_PIN2)


int main (void)
{
	DDRD &= ~(KEY_PIN1 | KEY_PIN2); //PD2 i PD3 jako wejœcia
	PORTD = (KEY_PIN1)|(KEY_PIN2); //podci¹gniêcie do potencja³u
	
	SFIOR &= ~(1<<PUD); // zerowanie bitu PUD aby podciagniecie faktycznie dzialalo

	DDRB   =(1<<PINB1)|(1<<PINB2); //PB1 i PB2 jako wyjœcia
	TCNT1 = 0;
	TCCR1A =(1<<COM1A1)|(1<<COM1B1)|(1<<WGM10); //ustawienie FastPWM w trybie 8-mio bitowym
	TCCR1B =(1<<WGM12)|(1<<CS10)|(1<<CS11); //preskaler 64
	TIMSK = 0; // wylaczenie przerwan
	// 254- pocz¹tek
	// 55- koniec
	// 150 stopni obrót
	OCR1A = 254; // wartoœæ pocz¹tkowa
    while (1)
    {
    	if (KEY_DOWN1)
    	{
    		OCR1A=254;
    	}
    	if (KEY_DOWN2)
    	{
    		OCR1A=190;
    	}
		_delay_ms(10);
    }
}


