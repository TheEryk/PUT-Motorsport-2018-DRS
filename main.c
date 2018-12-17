/*
 * main.c
 *
 *  Created on: 3 lis 2018
 *      Author: soko2
 */
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "LCD/lcd44780.h"

#define KEY_PIN1 (1<<PD2)
#define KEY_DOWN1 ! (PIND & KEY_PIN1)

#define KEY_PIN2 (1<<PD3)
#define KEY_DOWN2 ! (PIND & KEY_PIN2)

char t1[] = "OCR1A= ";

void init(void)
{
	lcd_init();/* Funkcja inicjalizuje wyœwietlacz*/
	lcd_cls(); // czysci ekjran
}

void selfTest( void )
{
	lcd_cls(); // czysci ekran
	lcd_locate(0,0);
	lcd_str("PUT Motorsport DRS"); //wyœwietlenie napisu
	_delay_ms(2000);
	lcd_cls(); // czysci ekjran
}

int main (void)
{
	DDRC |= (1<<PC1); //LCD
	PORTC |= (1<<PC1); //LCD

	DDRD &= ~(KEY_PIN1 | KEY_PIN2); //PD2 i PD3 jako wejœcia
	PORTD |= (KEY_PIN1)|(KEY_PIN2); //podci¹gniêcie do potencja³u

	DDRB   |=(1<<PB1)|(1<<PB2); //PB1 i PB2 jako wyjœcia
	TCCR1A |=(1<<COM1A1)|(1<<COM1B1)|(1<<WGM10)|(1<<WGM12); //ustawienie FastPWM
	TCCR1B |=(1<<CS20)|(1<<CS21); //preskaler 32
	// 254- pocz¹tek
	// 55- koniec
	// 150 stopni obrót
	init();
	selfTest();
    while (1)
    {
    	LCD_LOCATE(0,0); // pozycja na lcd
    	lcd_puts(t1);
    	LCD_LOCATE(1,1); // pozycja na lcd
    	lcd_puts("DOWN");
    	if (KEY_DOWN1)
    	{
    		OCR1A=254;
    	}
    	if (KEY_DOWN2)
    	{
    		OCR1A=190;
    	}
    }
}


