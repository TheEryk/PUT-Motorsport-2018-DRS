/*
 * May 2018
 *
 * Mieszko Mazurek <mimaz@gmx.com>
 *
 * Poznan University of Technology
 */

sreg = 0x3f
rzer = 1

#include <avr/io.h>
#include <avr/interrupt.h>

ref_bits = (1<<REFS0)
conv_bits = (1<<ADSC)|(1<<ADEN)|(1<<ADPS0)|(1<<ADPS1)|(1<<ADPS2)|(1<<ADIE)

    .section .bss
    
    ; must be aligned to 16 when measuring eight or more channels
    .p2align 4
values:
    .word   0   ; adc 0
    .word   0   ; adc 1
    .word   0   ; adc 2
    .word   0   ; adc 3
    .word   0   ; adc 4
    .word   0   ; adc 5
values_end:

    .section .data

loaddr:
    .byte   lo8(values)     ; low 8 bits of value address
                            ; high 8 bits are fixed because of alignement

    .section .text
    
initialize:
    ; just start first conversion and let interrupt handler
    ; take control over continous process
    ldi     r18,    ref_bits
    sts     ADMUX,  r18

    ldi     r18,    conv_bits
    sts     ADCSRA, r18
    ret

    .global adc_read
adc_read:
    ldi     r26,    lo8(values)
    ldi     r27,    hi8(values)
    lsl     r24

    ; no need to add high 8 bits!
    add     r26,    r24

    ; disable interrupt while getting data
    cli
    ld      r24,    X+
    ld      r25,    X+
    sei
    ret

    .global ADC_vect
ADC_vect:
    push    r16
    push    r26
    push    r27
    in      r16,    sreg
    push    r16

    ; load current address to X and get ADC value
    lds     r26,    loaddr
    ldi     r27,    hi8(values)

    lds     r16,    ADCL
    st      X+,     r16
    lds     r16,    ADCH
    st      X+,     r16

    ; check if there's at least one more channel to read
    ; start from first one if not
    cpi     r26,    lo8(values_end)
    brlo    .continue

    ldi     r26,    lo8(values)
    ldi     r16,    ref_bits

    rjmp    .startadc

.continue:
    lds     r16,    ADMUX
    inc     r16

.startadc:
    sts     ADMUX,  r16

    ; store new value address
    sts     loaddr, r26

    ; start new conversion
    ldi     r16,    conv_bits
    sts     ADCSRA, r16

    pop     r16
    out     sreg,   r16
    pop     r27
    pop     r26
    pop     r16
    reti

    .section .ctors
    .p2align 1
    .word gs(initialize)
