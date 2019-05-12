/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#ifndef __canloop_h
#define __canloop_h

#include <stdint.h>

#define CANLOOP_SLICE_MS 50

void front_loop(uint32_t count);
void rear_loop(uint32_t count);

#endif
