/*
 * May 2018
 *
 * Piotr Kwiatkowski <kwiat1998P@wp.pl>
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#include <stdlib.h>

#include "canloop.h"
#include "sensors.h"
#include "system.h"

struct first_frame
{
    uint16_t right_speed;
    uint16_t left_speed;
    uint16_t right_dumper;
    uint16_t left_dumper;
} __attribute__((packed));

struct second_frame
{
    uint8_t right_speed;
    uint8_t left_speed;
} __attribute__((packed));

void rear_loop(uint32_t count)
{
    struct first_frame fr1;
	struct second_frame fr2;

	fr1.right_speed = read_speed(wheel_right, wheel_raw);
	fr1.left_speed = read_speed(wheel_left, wheel_raw);
	fr1.right_dumper = read_damper(damper_right);
    fr1.right_dumper = read_damper(damper_left);
	hwcan_send(0, 0x2, sizeof(fr1), &fr1);

    if (count & 1)
    {
        fr2.right_speed = read_speed(wheel_right, wheel_kmh);
        fr2.left_speed = read_speed(wheel_left, wheel_kmh);
        hwcan_send(1, 0x9, sizeof(fr2), &fr2);
    }
}

