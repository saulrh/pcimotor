/* pcimotor - a modular motor controller */
/* Copyright (C) 2012  Saul Reynolds-Haertle */

/* This program is free software; you can redistribute it and/or */
/* modify it under the terms of the GNU General Public License */
/* as published by the Free Software Foundation; either version 2 */
/* of the License, or (at your option) any later version. */

/* This program is distributed in the hope that it will be useful, */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the */
/* GNU General Public License for more details. */
 
/* You should have received a copy of the GNU General Public License */
/* along with this program; if not, write to the Free Software */
/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA. */



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

/////////////////////////////
// private variables
uint8_t twi_last_read = 0x00;

/////////////////////////////
// private functions
uint8_t led_check_value(led_t*);

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
    /* theoretically, at least. I haven't figured everything out yet. */

    /* to make sure things work: write back the bytes, inverted */
    uint8_t bufIndex = twiSlave.bytesReceived;
    twiSlave.sendData[bufIndex] = (~twiSlave.receivedData[bufIndex]);
    /* twiSlave.sendData[bufIndex] = 0x55; */

    led_orders.behavior = LED_BEHAVIOR_TIMED;
    led_orders.time = 2500;
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
    /* ticks at 10kHz */
    TCC0.PER = 200;

    /* now we wait until the 32MHz oscillator is stable */
    do {} while (CLKSYS_IsReady(OSC_RC32MRDY_bm) == 0);
    /* and select it */
    CLKSYS_Main_ClockSource_Select(CLK_SCLKSEL_RC32M_gc);
}

/* Clock 0 interrupt */
/* Clock 0 ticks at 10kHz */
ISR(TCC0_OVF_vect)
{
    do_leds();
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
/// LEDs
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_leds(void)
{
    PORTA.DIRSET = PIN_LED_POWER | PIN_LED_ORDERS | PIN_LED_ERROR_1;
    PORTC.DIRSET = PIN_LED_MOT_A | PIN_LED_MOT_B;
    PORTE.DIRSET = PIN_LED_ERROR_2;

    led_power.behavior = LED_BEHAVIOR_ON;
}

uint8_t led_check_value(led_t* led)
{
    switch (led->behavior)
    {
    case LED_BEHAVIOR_ON:
        return true;
        break;
    case LED_BEHAVIOR_OFF:
        return false;
        break;
    case LED_BEHAVIOR_TIMED:
        if (led->time > 0)
        {
            led->time--;
            return true;
        }
        break;
    }
    return false;
}

void do_leds(void)
{
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_POWER) | (led_check_value(&led_power) ? PIN_LED_POWER : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_ORDERS) | (led_check_value(&led_orders) ? PIN_LED_ORDERS : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_ERROR_1) | (led_check_value(&led_error1) ? PIN_LED_ERROR_1 : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_ERROR_2) | (led_check_value(&led_error2) ? PIN_LED_ERROR_2 : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_MOT_A) | (led_check_value(&led_motb) ? PIN_LED_MOT_A : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_MOT_B) | (led_check_value(&led_mota) ? PIN_LED_MOT_B : 0);
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
