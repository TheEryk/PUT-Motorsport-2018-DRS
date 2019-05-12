/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 * Piotr Kwiatkowski <kwiat1998@wp.pl>
 * Michal Jeske
 *
 * Poznan University of Technology
 */

#include <avr/io.h>
#include <avr/interrupt.h>

#include "system.h"
#include "sensors.h"

enum card_type card = card_front;

#define INVALID_SPEED (~((uint16_t) 0))

#define SPEED_TIMER(n) \
    static volatile uint8_t ovflag##n = SPEED_OVF_SKIP; \
    __attribute__((interrupt)) \
    static void TIMER##n##_OVF_vect(void) \
    { \
        ovflag##n = SPEED_OVF_SKIP; \
    } \
    __attribute__((interrupt)) \
    static void TIMER##n##_CAPT_vect(void) \
    { \
        if (SPEED_OVF_SKIP > 1) \
        { \
            if (ovflag##n != 0) \
                ovflag##n--; \
        } \
        else \
        { \
            if (ovflag##n != 0) \
                ovflag##n = 0; \
        } \
        TCNT##n = 0; \
    } \
    static uint16_t read_speed_reg_##n(void) \
    { \
        if (ovflag##n != 0) \
            return 0; \
        return ICR##n; \
    }

SPEED_TIMER(1);
SPEED_TIMER(3);

#define PRESCALER 64

static uint16_t conv_speed_raw(uint16_t tim)
{
    return (uint32_t) 16000000 / ((uint32_t) tim * PRESCALER);
}

static uint16_t conv_speed_kmh(uint16_t tim)
{
    return (uint32_t) 16000000 * 5 / ((uint32_t) tim * 18 * PRESCALER);
}

static int8_t conv_position_angle(uint16_t raw)
{
    return (int16_t)(raw >> 3) - 65;
}

__attribute__((constructor))
static void init(void)
{
    /*
     * default mode
     * divider 1024
     * event on rising edge
     * enable input capture interrupt
     *
     * timer 1 - left wheel
     * timer 3 - right wheel
     */
    TCCR1A = 0;
    TCCR1B = _BV(CS10) | _BV(CS11) | _BV(ICES1);
    TIMSK1 = _BV(ICIE1) | _BV(TOIE1);

    TCCR3A = 0;
    TCCR3B = _BV(CS30) | _BV(CS31) | _BV(ICES3);
    TIMSK3 = _BV(ICIE3) | _BV(TOIE3);


    /*
     * init buttons
     */
    DDRC = 0x00;
}

static uint16_t get_speed(enum wheel_type type,
                          enum wheel_unit unit)
{
    uint16_t value = 0;

    switch (type)
    {
    case wheel_left:
        value = read_speed_reg_1();
        break;

    case wheel_right:
        value = read_speed_reg_3();
        break;
    }

    if (value == 0)
        return 0;

    switch (unit)
    {
    case wheel_raw:
        value = conv_speed_raw(value);
        break;

    case wheel_kmh:
        value = conv_speed_kmh(value);
        break;
    }

    return value;
}

#if SPEED_SMOOTH_LV > 0

static uint16_t speeds[2][2];

uint16_t read_speed(enum wheel_type type,
                    enum wheel_unit unit)
{
    const uint8_t lv = SPEED_SMOOTH_LV;

    uint16_t *ptr = &speeds[type][unit];
    uint16_t val = get_speed(type, unit);

    return *ptr = (((uint32_t) *ptr << lv) - *ptr + val) >> lv;
}

#else

uint16_t read_speed(enum wheel_type type,
                    enum wheel_unit unit)
{
    return get_speed(type, unit);
}

#endif

uint16_t read_position_raw(void)
{
    return adc_read(5);
}

int8_t read_position_angle(void)
{
    return conv_position_angle(read_position_raw());
}

uint8_t read_traction_switch(void)
{
    uint16_t adc = 1023 - adc_read(0);
    uint16_t step = 45;
    uint8_t value = 1;

    while (adc > step)
    {
        step += 90;
        value++;
    }

    return value;
}

uint8_t read_buttons(void)
{
    return (~PINC >> 2) & 0x1F;
}

uint16_t read_damper(enum damper_type type)
{
    uint16_t value = 0;

    switch (type)
    {
    case damper_left:
        switch (card)
        {
        case card_front:
            value = adc_read(4);
            break;

        case card_rear:
            value = adc_read(0);
            break;
        }
        break;

    case damper_right:
        switch (card)
        {
        case card_front:
            value = adc_read(3);
            break;

        case card_rear:
            value = adc_read(1);
            break;
        }
        break;

    default:
        value = 0;
    }

    return value;
}

uint16_t read_break_pressure(enum break_type type)
{
    uint16_t value;

    switch (type)
    {
    case break_front:
        value = adc_read(2);
        break;

    case break_back:
        value = adc_read(5);
        break;

    default:
        value = 0;
    }

    return value;
}
