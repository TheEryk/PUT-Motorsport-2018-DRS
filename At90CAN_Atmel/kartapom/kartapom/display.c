/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#include "system.h"
#include "config.h"

static volatile char back_buffer
                     [DISPLAY_HEIGHT]
                     [DISPLAY_WIDTH];
static FILE display_file = FDEV_SETUP_STREAM
    (display_putchar, NULL, _FDEV_SETUP_WRITE);

volatile char display_buffer[DISPLAY_HEIGHT][DISPLAY_WIDTH];
volatile uint8_t display_x;
volatile uint8_t display_y;

FILE *const display_out = &display_file;

static void write4(uint8_t data, uint8_t rs)
{
    gpio_high(DISPLAY_EN_PIN);

    gpio_write(DISPLAY_RS_PIN, rs);
    gpio_write(DISPLAY_D4_PIN, data & 0x10);
    gpio_write(DISPLAY_D5_PIN, data & 0x20);
    gpio_write(DISPLAY_D6_PIN, data & 0x40);
    gpio_write(DISPLAY_D7_PIN, data & 0x80);

    gpio_low(DISPLAY_EN_PIN);
}

static void write8(uint8_t data, uint8_t rs)
{
    write4(data, rs);

    delayms(1);

    write4(data << 4, rs);
}

static void writechar(uint8_t ch)
{
    write8(ch, 1);

    delayms(1);
}

static void writeaddr(uint8_t addr)
{
    write8(0x80 | addr, 0);

    delayms(1);
}

static uint8_t realaddr(uint8_t x, uint8_t y)
{
    if ((y & 1) == 0)
            return y * 10 + x;

    return 0x40 + (y - 1) * 10 + x;
}

static void shiftup(void)
{
	for (uint8_t y = 0; y < DISPLAY_HEIGHT - 1; y++)
		for (uint8_t x = 0; x < DISPLAY_WIDTH; x++)
			display_buffer[y][x] = display_buffer[y + 1][x];

	for (uint8_t x = 0; x < DISPLAY_WIDTH; x++)
		display_buffer[DISPLAY_HEIGHT - 1][x] = ' ';
}

void display_init(void)
{
    gpio_out(DISPLAY_RS_PIN);
    gpio_out(DISPLAY_EN_PIN);
    gpio_out(DISPLAY_D4_PIN);
    gpio_out(DISPLAY_D5_PIN);
    gpio_out(DISPLAY_D6_PIN);
    gpio_out(DISPLAY_D7_PIN);

    for (uint8_t y = 0; y < DISPLAY_HEIGHT; y++)
        for (uint8_t x = 0; x < DISPLAY_WIDTH; x++)
                display_buffer[y][x] = ' ';

    for (uint8_t i = 0; i < 5; i++)
    {
        // 8-bit interface
        write4(0x30, 0);

        delayms(5);
    }

    // 4-bit interface
    write4(0x20, 0);
    delayms(5);

    // enable display with no cursor
    write8(0x0C, 0);
    delayms(5);

    // two line display and 5x7 character
    write8(0x28, 0);
    delayms(5);

    stdout = display_out;
}

void display_sync(void)
{
    uint8_t dirty = 0;

    for (uint8_t y = 0; y < DISPLAY_HEIGHT; y++)
    {
        dirty = 1;

        for (uint8_t x = 0; x < DISPLAY_WIDTH; x++)
        {
            if (display_buffer[y][x] != back_buffer[y][x])
            {
                back_buffer[y][x] = display_buffer[y][x];

                if (dirty)
                {
                    uint8_t addr = realaddr(x, y);

                    writeaddr(addr);
                    dirty = 0;
                }

                writechar(back_buffer[y][x]);
            }
            else
            {
                dirty = 1;
            }
        }
    }
}

void display_clear(void)
{
    for (uint8_t y = 0; y < DISPLAY_HEIGHT; y++)
        for (uint8_t x = 0; x < DISPLAY_WIDTH; x++)
            display_buffer[y][x] = ' ';

    display_goto(0, 0);
}

void display_goto(uint8_t y, uint8_t x)
{
	display_y = y;
	display_x = x;
}

int display_putchar(char c, FILE *file)
{
	(void) file;

	switch (c)
	{
	case '\n':
		display_x = 0;
		display_y++;
		break;

	default:
		if (display_x >= DISPLAY_WIDTH)
		{
			display_x = 0;
			display_y++;
		}

		display_buffer[display_y][display_x++] = c;
	}

	if (display_y >= DISPLAY_HEIGHT)
	{
		display_y = DISPLAY_HEIGHT - 1;

        shiftup();
	}

	return 1;
}
