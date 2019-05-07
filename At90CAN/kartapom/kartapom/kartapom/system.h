/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#ifndef __system_h
#define __system_h

#include <inttypes.h>
#include <stdio.h>
#include "config.h"

uint32_t systime();
void delayms(uint32_t ms);

extern volatile uint16_t adc_values[];

uint16_t adc_read(uint8_t pin);


#define GPIO_OUT 1
#define GPIO_IN 0
#define GPIO_HIGH 1
#define GPIO_LOW 0

void gpio_mode(uint8_t pin, uint8_t mode);
void gpio_out(uint8_t pin);
void gpio_in(uint8_t pin);

void gpio_write(uint8_t pin, uint8_t value);
void gpio_high(uint8_t pin);
void gpio_low(uint8_t pin);
void gpio_toggle(uint8_t pin);

uint8_t gpio_value(uint8_t pin);
uint8_t gpio_read(uint8_t pin);


struct hwcan_message
{
    uint16_t id;
    uint8_t rtr;
    uint8_t dlc;

    uint8_t data[8];
};

void hwcan_init(void);
int8_t hwcan_send(uint8_t page,
                  uint16_t id, 
                  uint8_t framesiz, 
                  void *framedat);


#define DISPLAY_WIDTH 20
#define DISPLAY_HEIGHT 4

extern volatile char display_buffer
                     [DISPLAY_HEIGHT]
                     [DISPLAY_WIDTH];
extern volatile uint8_t display_y;
extern volatile uint8_t display_x;
extern FILE *const display_out;

void display_init(void);
void display_sync(void);
void display_clear(void);
void display_goto(uint8_t y, uint8_t x);
int display_putchar(char c, FILE *file);

#endif
