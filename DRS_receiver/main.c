#include <avr/io.h>
#include <avr/pgmspace.h>

#define F_CPU 16000000UL

#include "can_buffer.h"
#include "can.h"
#include "at90can.c"

int main(){
    at90can_init(BITRATE_1_MBPS);
    
	can_t frame;

    while(1){
		if(can_check_message()){
			if (can_get_message(&frame)){
				//frame -> odebrana ramka
				//frame.id
				//frame.length
				//frame.data[]
			}
		}
    }

    return 0;
}
