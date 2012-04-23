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
#include "clksys/clksys_driver.h"
#include "twi/twi_slave_driver.h"
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
#define TWI_BAUDSETTING TWI_BAUD(F_CPU, BAUDRATE)

TWI_Slave_t twiSlave;            /* TWI slave module. */

void init_twi(void)
{
    /* make sure our I2C pins are set to input */
    PORTC.DIRCLR = PIN_SDA_2 | PIN_SCL_2;

    /* set them to use internal pullup resistors */
    PORTCFG.MPCMASK = PIN_SDA_2 | PIN_SCL_2;
    PORTC.PIN0CTRL = (PORTC.PIN0CTRL & ~PORT_OPC_gm) | PORT_OPC_PULLUP_gc;
    PORTCFG.MPCMASK = 0x00;
    
    /* set our callback */
    TWI_SlaveInitializeDriver(&twiSlave, &TWIC, TWIE_SlaveProcessData);

    /* low-priority interrupt */
    TWI_SlaveInitializeModule(&twiSlave, SLAVE_ADDRESS, TWI_SLAVE_INTLVL_LO_gc);

    /* enable low-priority interrupts */
    PMIC.CTRL |= PMIC_LOLVLEN_bm;
}

ISR(TWIC_TWIS_vect)
{
    TWI_SlaveInterruptHandler(&twiSlave);
}

void TWIE_SlaveProcessData(void)
{
    /* number of received bytes is in twiSlave.bytesReceived */
    /* data is in twiSlave.receivedData[] */
    /* can return data by setting twiSlave.sendData[] */


    /* to make sure things work: write back the bytes, inverted */
    uint8_t bufIndex = twiSlave.bytesReceived;
    twiSlave.sendData[bufIndex] = (~twiSlave.receivedData[bufIndex]);
    /* twiSlave.sendData[bufIndex] = 0x55; */

    PORTA.OUTCLR = PIN_LED_POWER | PIN_LED_ORDERS | PIN_LED_ERROR_1;
    PORTC.OUTCLR = PIN_LED_MOT_A | PIN_LED_MOT_B;
    PORTE.OUTCLR = PIN_LED_ERROR_2;

    /* bit ordering reflects physical LED layout right to left */
    if (twiSlave.receivedData[bufIndex] & (1 << 5)) PORTA.OUTSET = PIN_LED_POWER;
    if (twiSlave.receivedData[bufIndex] & (1 << 4)) PORTA.OUTSET = PIN_LED_ORDERS;
    if (twiSlave.receivedData[bufIndex] & (1 << 3)) PORTA.OUTSET = PIN_LED_ERROR_1;

    if (twiSlave.receivedData[bufIndex] & (1 << 2)) PORTE.OUTSET = PIN_LED_ERROR_2;

    if (twiSlave.receivedData[bufIndex] & (1 << 1)) PORTC.OUTSET = PIN_LED_MOT_A;
    if (twiSlave.receivedData[bufIndex] & (1 << 0)) PORTC.OUTSET = PIN_LED_MOT_B;
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Clock
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_clock(void)
{
    /* medium-priority interrupt */
    TCC0.INTCTRLA = (TCC0.INTCTRLA & ~TC0_OVFINTLVL_gm) | TC_OVFINTLVL_MED_gc;
    
    /* enable mid-priority interrupts */
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

    /* count to 200 before looping. */
    /* ticks at 1kHz */
    TCC0.PER = 200;

    /* now we wait until the 32MHz oscillator is stable */
    do {} while (CLKSYS_IsReady(OSC_RC32MRDY_bm) == 0);
    /* and select it */
    CLKSYS_Main_ClockSource_Select(CLK_SCLKSEL_RC32M_gc);
}

/* Clock 0 interrupt */
ISR(TCC0_OVF_vect)
{
    do_sensors();
    do_motors();
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Sensors
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_sensors(void)
{
}

void do_sensors(void)
{
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Motors
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_motors(void)
{
    /* enable motors */
    /* PORTD.DIRSET |= PIN_MOT_CONTROL_EN_1 | PIN_MOT_CONTROL_EN2; */
    /* PORTD.OUTSET  = PIN_MOT_CONTROL_EN_1 | PIN_MOT_CONTROL_EN2; */
}

void do_motors(void)
{
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Util functions
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Other
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_leds(void)
{
    PORTA.DIRSET = PIN_LED_POWER | PIN_LED_ORDERS | PIN_LED_ERROR_1;
    PORTC.DIRSET = PIN_LED_MOT_A | PIN_LED_MOT_B;
    PORTE.DIRSET = PIN_LED_ERROR_2;
}

/* main function */
int main(void)
{

    /* ============================== */
    /* initialization =============== */
    /* ============================== */

    /* set up LED pins */
    init_leds();

    /* set up I2C as slave */
    init_twi();

    /* set up our clocks */
    init_clock();
    
    /* set up sensors */
    init_sensors();

    /* set up motors */
    init_motors();
    
    /* enable interrupts - things start ticking now */
    sei();

    /* ============================== */
    /* main loop ==================== */
    /* ============================== */
    for(;;)
    {
    }
}
