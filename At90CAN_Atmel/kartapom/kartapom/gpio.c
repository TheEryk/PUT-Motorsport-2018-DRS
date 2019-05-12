/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#include <avr/io.h>

#include "system.h"

#define DDR DDRA
#define PORT PORTA
#define PIN PINA

void gpio_mode(uint8_t pin, uint8_t mode)
{
    if (mode)
        DDR |= _BV(pin);
    else
        DDR &= ~_BV(pin);
}

void gpio_out(uint8_t pin)
{
    gpio_mode(pin, GPIO_OUT);
}

void gpio_in(uint8_t pin)
{
    gpio_mode(pin, GPIO_IN);
}

void gpio_write(uint8_t pin, uint8_t value)
{
    if (value)
        PORT |= _BV(pin);
    else
        PORT &= ~_BV(pin);
}

void gpio_high(uint8_t pin)
{
    gpio_write(pin, GPIO_HIGH);
}

void gpio_low(uint8_t pin)
{
    gpio_write(pin, GPIO_LOW);
}

void gpio_toggle(uint8_t pin)
{
    PORT ^= _BV(pin);
}

uint8_t gpio_value(uint8_t pin)
{
    return (PORT & _BV(pin)) != 0;
}

uint8_t gpio_read(uint8_t pin)
{
    return (PIN & _BV(pin)) != 0;
}
