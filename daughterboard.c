/* written by saul reynolds-haertle 2012. license is generic
 * permissive open-source until i decide on one in particular,
 * probably aroudn the time it goes up on github. */

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
/* #include <avr/sleep.h> */

#include "avr_compiler.h"
#include "clksys_driver.h"


#ifndef F_CPU
#define F_CPU 32000000
#endif


void clock_init(void)
{
    /* medium-priority interrupt */
    TCC0.INTCTRLA = (TCC0.INTCTRLA & ~TC0_OVFINTLVL_gm) | TC_OVFINTLVL_MED_gc;
    
    /* low-level interrupt routine in PMIC */
    PMIC.CTRL |= PMIC_MEDLVLEN_bm;

    /* start the 32MHz ring oscillator ticking */
    /* ticks at 32MHz */
    CLKSYS_Enable(OSC_RC32MEN_bm);
    
    /* set the clock prescaler to divide by 1 */
    /* ticks at 32MHz */
    CLKSYS_Prescalers_Config(CLK_PSADIV_1_gc, CLK_PSBCDIV_1_1_gc);

    /* divide main clock source by 1024 */
    /* ticks at 31250Hz */
    TCC0.CTRLA = (TCC0.CTRLA & ~TC0_CLKSEL_gm) | TC_CLKSEL_DIV1024_gc;

    /* count to 31250k before looping; this should be half a second */
    /* ticks at 1Hz */
    TCC0.PER = 31250;

    /* now we wait until the 32MHz oscillator is stable */
    do {} while (CLKSYS_IsReady(OSC_RC32MRDY_bm) == 0);
    /* and select it */
    CLKSYS_Main_ClockSource_Select(CLK_SCLKSEL_RC32M_gc);
}

/* when the clock triggers, toggle all the LEDs */
ISR(TCC0_OVF_vect)
{
    PORTA.OUTTGL = 0x70;    /* toggle PA5, PA6, PA7 */
    PORTC.OUTTGL = 0x18;    /* toggle PC3, PC4 */
    PORTE.OUTTGL = 0x03;    /* toggle PE3 */
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



