/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#include <avr/io.h>

#include "system.h"
#include "sensors.h"
#include "canloop.h"

__attribute__((constructor))
static void zworainit(void)
{
    gpio_out(1);
    gpio_low(1);
    gpio_in(0);
    gpio_high(0);
}

static void update_card(void)
{
    if (gpio_read(0) != 0)
        card = card_front;
    else
        card = card_rear;
}

int main(void)
{
    hwcan_init();

#ifdef DEBUG
    display_init();
#endif

    DDRF = 0x00;
    PORTF = 0x00;

    uint32_t count = 0;
    uint32_t nexttime = 0;

    while (1)
    {
        while (systime() < nexttime)
            __asm("sleep");

        nexttime += CANLOOP_SLICE_MS;

        update_card();

        switch (card)
        {
        case card_front:
            front_loop(count);
            break;

        case card_rear:
            rear_loop(count);
            break;
        }

        count++;

#ifdef DEBUG
        if (count % 10 == 0)
        {
            display_clear();

            printf("%04hu <> %04hu", 
                   read_speed(wheel_left, wheel_raw),
                   read_speed(wheel_right, wheel_raw));

            printf("\n%04hu <> %04hu |%04hd", 
                   read_speed(wheel_left, wheel_kmh), 
                   read_speed(wheel_right, wheel_kmh), 
                   read_position_angle());

            printf("\n%04hu ^^ %04hu #%02hd", 
                   read_damper(damper_left),
                   read_damper(damper_right),
                   read_traction_switch());

            printf("\n%04hu !! %04hu", 
                   read_break_pressure(break_front),
                   read_break_pressure(break_back));

            display_sync();
        }
#endif
    }
}
