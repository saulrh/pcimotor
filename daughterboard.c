/* written by saul reynolds-haertle 2012. license is generic
 * permissive open-source until i decide on one in particular,
 * probably aroudn the time it goes up on github. */

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
/* #include <avr/sleep.h> */

#include 


#ifndef F_CPU
#define F_CPU 32000000
#endif


void clock_init(void)
{
}

void io_init(void)
{
    PORTA.DIRSET = 0xFF;
    PORTB.DIRSET = 0xFF;
    PORTC.DIRSET = 0xFF;
    PORTD.DIRSET = 0xFF;
    PORTE.DIRSET = 0xFF;
}

int main(void)
{
    /* ============================== */
    /* initialization =============== */
    /* ============================== */
    io_init();
    
    /* ============================== */
    /* main loop ==================== */
    /* ============================== */
    for(;;)
    {
        PORTA.OUTSET = 0x70;    /* set PA5, PA6, PA7 high */
        PORTC.OUTSET = 0x18;    /* set PC3, PC4 high */
        PORTE.OUTSET = 0x03;    /* set PE3 high */
    }
}



