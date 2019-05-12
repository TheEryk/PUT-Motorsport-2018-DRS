/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

#include <avr/io.h>

sreg = 0x3F
rzer = 1

    .section .bss
timems:
    .byte   0, 0, 0, 0

    .section .text

initclk:
    ldi     r18,    (1<<WGM01)|(1<<CS00)|(1<<CS01)
    sts     TCCR0A, r18

    ldi     r18,    250
    sts     OCR0A,  r18

    ldi     r18,    (1<<OCIE0A)
    sts     TIMSK0, r18
    sei
    ret

    .global systime
systime:
    lds     r22,    timems+0
    lds     r23,    timems+1
    lds     r24,    timems+2
    lds     r25,    timems+3

    lds     r0,     timems+0
    cpse    r0,     r22
    rjmp    systime
    ret

    .global delayms
    ; r22:r25 millis count
delayms:
    movw    r18,    r22
    movw    r20,    r24

    rcall   systime

    add     r18,    r22
    adc     r19,    r23
    adc     r20,    r24
    adc     r21,    r25

.sleeploop:
    sleep
    rcall   systime
    cp      r18,    r22
    cpc     r19,    r23
    cpc     r20,    r24
    cpc     r21,    r25
    brge    .sleeploop
    ret

    .global TIMER0_COMP_vect
TIMER0_COMP_vect:
    push    r16
    push    r20
    in      r20,    sreg
    push    r20

    ldi     r20,    1
    lds     r16,    timems+0
    add     r16,    r20
    sts     timems+0,   r16

    clr     r20
    lds     r16,    timems+1
    adc     r16,    r20
    sts     timems+1,   r16

    lds     r16,    timems+2
    adc     r16,    r20
    sts     timems+2,   r16

    lds     r16,    timems+3
    adc     r16,    r20
    sts     timems+3,   r16

    pop     r20
    out     sreg,   r20
    pop     r20
    pop     r16
    reti

    .section .ctors
    ; It's weird, .align 2 do not work?!
    .p2align 1
    .word gs(initclk)
