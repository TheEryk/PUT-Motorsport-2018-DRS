/*
 * Feb 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#ifndef __SENSORS_H
#define __SENSORS_H

#include <inttypes.h>

#define BUTTON_BRAKE (1<<0)
#define BUTTON_G_UP (1<<1)
#define BUTTON_G_DOWN (1<<2)

enum card_type
{
    card_front,
    card_rear,
};

enum wheel_type
{
    wheel_left,
    wheel_right,
};

enum wheel_unit
{
    wheel_raw,
    wheel_kmh,
};

enum damper_type
{
    damper_left,
    damper_right,
};

enum break_type
{
    break_front,
    break_back,
};

extern enum card_type card;

uint16_t    read_speed              (enum wheel_type type,
                                     enum wheel_unit unit);

uint16_t    read_position_raw       (void);

int8_t      read_position_angle     (void);

uint8_t     read_traction_switch    (void);

uint8_t     read_buttons            (void);

uint16_t    read_damper             (enum damper_type type);

uint16_t    read_break_pressure     (enum break_type type);

#endif
