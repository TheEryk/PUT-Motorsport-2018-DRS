/*
 * May 2018
 *
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
    uint16_t position;
    uint8_t traction_switch;
    uint8_t buttons;
} __attribute__((packed));

struct second_frame
{
    uint16_t right_damper;
    uint16_t left_damper;
    uint16_t front_break;
    uint16_t back_break;
} __attribute__((packed));

struct third_frame
{
    uint8_t right_speed;
    uint8_t left_speed;
    int8_t position;
    uint8_t acc;
} __attribute__((packed));

void front_loop(uint32_t count)
{
    struct first_frame fr1;
    struct second_frame fr2;
    struct third_frame fr3;


    fr1.right_speed = read_speed(wheel_right, wheel_raw);
    fr1.left_speed = read_speed(wheel_left, wheel_raw);
    fr1.position = read_position_raw();
    fr1.traction_switch = read_traction_switch();
    fr1.buttons = read_buttons();

    hwcan_send(0, 0x1, sizeof(fr1), &fr1);




    
    fr2.right_damper = read_damper(damper_right);
    fr2.left_damper = read_damper(damper_left);
    fr2.front_break = read_break_pressure(break_front);
    fr2.back_break = read_break_pressure(break_back);

    hwcan_send(1, 0x6, sizeof(fr2), &fr2);




    if (count & 1)
    {
        fr3.right_speed = read_speed(wheel_right, wheel_kmh);
        fr3.left_speed = read_speed(wheel_left, wheel_kmh);
        fr3.position = read_position_angle();
        fr3.acc = (read_buttons() & BUTTON_G_UP) != 0;

        hwcan_send(2, 0x8, sizeof(fr3), &fr3);
    }
}
