/* written by saul reynolds-haertle 2012. license is generic
 * permissive open-source until i decide on one in particular,
 * probably aroudn the time it goes up on github. */


/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Includes
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
/* #include <avr/sleep.h> */

#include "avr_compiler.h"
#include "clksys_driver.h"
#include "twi_slave_driver.h"
#include "daughterboard.h"

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Defines
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Declarations
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

uint8_t twi_last_read = 0x00;

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// TWI
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

#define SLAVE_ADDRESS 0x55
#define BAUDRATE 100000
#define TWI_BAUDSETTING (TWI_BAUD(F_CPU, BAUDRATE))

TWI_Slave_t twiSlave;            /* TWI slave module. */

void twi_init(void)
{
    /* make sure our I2C pins are set to input */
    PORTE.DIRCLR = PIN_SDA_1 | PIN_SCL_1;

    /* set them to use internal pullup resistors */
    PORTCFG.MPCMASK = PIN_SDA_1 | PIN_SCL_1;
    PORTE.PIN0CTRL = (PORTE.PIN0CTRL & ~PORT_OPC_gm) | PORT_OPC_WIREDANDPULL_gc;
    PORTCFG.MPCMASK = 0x00;
    
    /* set our callback */
    TWI_SlaveInitializeDriver(&twiSlave, &TWIE, TWIE_SlaveProcessData);
    /* low-priority interrupt */
    TWI_SlaveInitializeModule(&twiSlave, SLAVE_ADDRESS, TWI_SLAVE_INTLVL_LO_gc);

    /* enable low-priority interrupts */
    PMIC.CTRL |= PMIC_LOLVLEN_bm;
}

ISR(TWIE_TWIS_vect)
{
    TWI_SlaveInterruptHandler(&twiSlave);
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Clock
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void clock_init(void)
{
    /* medium-priority interrupt */
    TCC0.INTCTRLA = (TCC0.INTCTRLA & ~TC0_OVFINTLVL_gm) | TC_OVFINTLVL_MED_gc;
    
    /* low-level interrupt routine in PMIC */
    PMIC.CTRL |= PMIC_MEDLVLEN_bm;

    /* start the 32MHz ring oscillator ticking */
    /* ticks at 32MHz */
    CLKSYS_Enable(OSC_RC32MEN_bm);
    
    /* set the clock prescaler to divide by 2 */
    /* ticks at 16MHz */
    CLKSYS_Prescalers_Config(CLK_PSADIV_1_gc, CLK_PSBCDIV_1_2_gc);

    /* divide main clock source by 8 */
    /* ticks at 2MHz */
    TCC0.CTRLA = (TCC0.CTRLA & ~TC0_CLKSEL_gm) | TC_CLKSEL_DIV8_gc;

    /* count to 31250 before looping. */
    /* ticks at 64Hz */
    TCC0.PER = 31250;

    /* now we wait until the 32MHz oscillator is stable */
    do {} while (CLKSYS_IsReady(OSC_RC32MRDY_bm) == 0);
    /* and select it */
    CLKSYS_Main_ClockSource_Select(CLK_SCLKSEL_RC32M_gc);
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Util functions
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void io_init(void)
{
    PORTA.DIRSET = 0xFF;
    PORTB.DIRSET = 0xFF;
    PORTC.DIRSET = 0xFF;
    PORTD.DIRSET = 0xFF;
    PORTE.DIRSET = 0xFF;
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Entry points
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void TWIE_SlaveProcessData(void)
{
    /* number of received bytes is in twiSlave.bytesReceived */
    /* data is in twiSlave.receivedData[] */
    /* can return data by setting twiSlave.sendData[] */

    /* to make sure things work: write back the bytes, inverted */
    uint8_t bufIndex = twiSlave.bytesReceived;
    twiSlave.sendData[bufIndex] = (~twiSlave.receivedData[bufIndex]);
}

/* Clock 0 interrupt */
ISR(TCC0_OVF_vect)
{
    /* toggle all the LEDs */
    PORTA.OUTTGL = PIN5_bm | PIN6_bm | PIN7_bm; /* toggle PA5, PA6, PA7 */
    PORTC.OUTTGL = PIN3_bm | PIN4_bm;           /* toggle PC3, PC4 */
    PORTE.OUTTGL = PIN1_bm | PIN3_bm;           /* toggle PE3 */
}

/* main function */
int main(void)
{
    /* ============================== */
    /* initialization =============== */
    /* ============================== */
    /* enable IO ports */
    io_init();

    /* enable TWI as slave */
    twi_init();

    /* enable clocks */
    clock_init();
    
    /* enable interrupts - things start ticking now */
    sei();

    /* PORTE.OUTSET = PIN0_bm | PIN1_bm; */
    
    /* ============================== */
    /* main loop ==================== */
    /* ============================== */
    for(;;)
    {
    }
}



