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

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Includes
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <string.h>
/* #include <avr/sleep.h> */

#include "avr_compiler.h"
#include "clksys/clksys_driver.h"
#include "twi/twi_slave_driver.h"
#include "watchdog/wdt_driver.h"
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
uint8_t digital_send_buf[0xff];
uint8_t digital_send_idx;
uint8_t digital_send_len;

/////////////////////////////
// private functions
uint8_t led_check_value(led_t*);
void init_digout(void);
void do_digout(void);

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// TWI
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

#define SLAVE_ADDRESS 0x55
#define BAUDRATE 5000
#define TWI_BAUDSETTING TWI_BAUD(F_CPU, BAUDRATE)

TWI_Slave_t twiSlave;            /* TWI slave module. */

void init_twi(void)
{
    /* /\* make sure our I2C pins are set to input *\/ */
    /* PORTC.DIRCLR = PIN_SDA_2 | PIN_SCL_2; */

    /* set the i2c pins to use internal pullup resistors */
    PORTCFG.MPCMASK = PIN_SDA_2 | PIN_SCL_2;
    PORTC.PIN0CTRL = (PORTC.PIN0CTRL & ~PORT_OPC_gm) | PORT_OPC_PULLUP_gc;
    PORTCFG.MPCMASK = 0x00;
    
    /* set our callback */
    TWI_SlaveInitializeDriver(&twiSlave, &TWIC, TWIC_SlaveProcessData);

    /* low-priority interrupt */
    TWI_SlaveInitializeModule(&twiSlave, SLAVE_ADDRESS, TWI_SLAVE_INTLVL_LO_gc);

    /* enable low-priority interrupts */
    PMIC.CTRL |= PMIC_LOLVLEN_bm;
}

ISR(TWIC_TWIS_vect)
{
    TWI_SlaveInterruptHandler(&twiSlave);
}

void TWIC_SlaveProcessData(void)
{
    /* flash the LED so the user knows communication is happening */
    led_orders->behavior = LED_BEHAVIOR_TIMED;
    led_orders->time = 1250;

    /* push results out over the digital pins for debug */
    digital_send_buf[0] = twiSlave.bytesReceived+1;
    for(int i = 0; i <= twiSlave.bytesReceived; i++)
    {
        digital_send_buf[i+1] = twiSlave.receivedData[i];
    }
    digital_send_len = twiSlave.bytesReceived+1 + 1;
    digital_send_idx = 0;

    /* set motor A duty cycle to whatever it was we got */
    motA.duty = twiSlave.receivedData[twiSlave.bytesReceived] << 8;
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Clock
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_clock(void)
{
    //////////////////////////////////////////////////////////
    /* system clock setup */

    /* start the 32MHz ring oscillator ticking */
    /* ticks at 32MHz */
    CLKSYS_Enable(OSC_RC32MEN_bm);
    
    /* set the clock prescaler to divide by 1 */
    /* ticks at 32MHz */
    CLKSYS_Prescalers_Config(CLK_PSADIV_1_gc, CLK_PSBCDIV_1_1_gc);

    /* enable mid-priority interrupts */
    PMIC.CTRL |= PMIC_MEDLVLEN_bm;
    PMIC.CTRL |= PMIC_LOLVLEN_bm;

    //////////////////////////////////////////////////////////
    /* clock 1 setup */
    /* we use clock 1 for control loops because the avr-gcc headers
     * only have the registers for PWMing TC0 */

    /* medium-priority interrupt */
    TCC1.INTCTRLA = (TCC1.INTCTRLA & ~TC1_OVFINTLVL_gm) | TC_OVFINTLVL_MED_gc;

    /* divide main clock source by 2 */
    /* ticks at 16MHz */
    TCC1.CTRLA = (TCC1.CTRLA & ~TC1_CLKSEL_gm) | TC_CLKSEL_DIV2_gc;

    /* count to 1600 before looping. */
    /* ticks at 10kHz */
    /* we use this for handling control loops */
    TCC1.PER = 1600;

    //////////////////////////////////////////////////////////
    /* clock 0 setup */
    
    TCD0.CTRLB = 0x00;

    /* low-priority interrupt */
    TCD0.INTCTRLA = (TCD0.INTCTRLA & ~TC0_OVFINTLVL_gm) | TC_OVFINTLVL_LO_gc;

    /* divide main clock source by 2 */
    /* ticks at 16MHz */
    TCD0.CTRLA = (TCD0.CTRLA & ~TC0_CLKSEL_gm) | TC_CLKSEL_DIV2_gc;

    /* count to 65536 before looping. */
    /* ticks at about 250Hz */
    /* we use its A and B comparators for motor PWM */
    TCD0.PER = 0xffff;

    /* single-slope PWM with both CCA and CCB enabled */
    TCD0.CTRLB = (TCD0.CTRLB & ~TC0_WGMODE_gm) | TC_WGMODE_SS_gc | TC0_CCAEN_bm | TC0_CCBEN_bm;

    //////////////////////////////////////////////////////////
    /* start things ticking */

    /* wait until the 32MHz oscillator is stable */
    do {nop();} while (CLKSYS_IsReady(OSC_RC32MRDY_bm) == 0);
    /* and select it */
    CLKSYS_Main_ClockSource_Select(CLK_SCLKSEL_RC32M_gc);
}

/* Clock 1 interrupt */
/* Clock 1 ticks at 10kHz */
/* use this for control loop */
ISR(TCC1_OVF_vect)
{
    do_leds();
    do_sensors();
    do_motors();
    do_digout();
}

ISR(TCD0_OVF_vect)
{
    /* Set the clock to motA duty cycle */
    TCD0.CCABUF = motA.duty;
    
    /* Set the clock to motB duty cycle */
    TCD0.CCBBUF = motB.duty;
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Sensors
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_sensors(void)
{
}

/* read sensors */
/* update PID controllers */
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
    /* enable motor pins */
    PORTD.DIRSET |= PIN_MOT_CONTROL_EN_1|PIN_MOT_CONTROL_EN_2;
    PORTD.DIRSET |= PIN_MOT_CONTROL_A_2|PIN_MOT_CONTROL_B_2;
    PORTD.DIRSET |= PIN_MOT_CONTROL_A_1|PIN_MOT_CONTROL_B_1;
    
    /* clear out motor structs */
    motA.duty = 0;
    motA.sensorchan = 0; 
    motA.closed = false;
    motA.direction = false;
    motA.cont.P = 0.0;
    motA.cont.I = 0.0;
    motA.cont.D = 0.0;
    motA.cont.e_last = 0.0;
    motA.cont.e_cur = 0.0;
    motA.cont.e_int = 0.0;
    motA.cont.target = 0.0;

    motB.duty = 0;
    motB.sensorchan = 0; 
    motB.closed = false;
    motB.direction = false;
    motB.cont.P = 0.0;
    motB.cont.I = 0.0;
    motB.cont.D = 0.0;
    motB.cont.e_last = 0.0;
    motB.cont.e_cur = 0.0;
    motB.cont.e_int = 0.0;
    motB.cont.target = 0.0;
}

/* Called by clock 1 at 100kHz */
void do_motors(void)
{
    if (motA.duty) led_mota->behavior = LED_BEHAVIOR_ON;
    else led_mota->behavior = LED_BEHAVIOR_OFF;
    if (motB.duty) led_motb->behavior = LED_BEHAVIOR_ON;
    else led_motb->behavior = LED_BEHAVIOR_OFF;

    
    /* Set the Direction for motA */
    PORTD.OUTSET = (motA.direction ? PIN_MOT_CONTROL_A_1 : PIN_MOT_CONTROL_B_1);
    PORTD.OUTCLR = (motA.direction ? PIN_MOT_CONTROL_B_1 : PIN_MOT_CONTROL_A_1);
    
    /* Set the Direction for motB */
    PORTD.OUTSET = (motB.direction ? PIN_MOT_CONTROL_A_2 : PIN_MOT_CONTROL_B_2);
    PORTD.OUTCLR = (motB.direction ? PIN_MOT_CONTROL_B_2 : PIN_MOT_CONTROL_A_2);
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

    led_power  = malloc(sizeof(led_t));
    led_orders = malloc(sizeof(led_t));
    led_error1 = malloc(sizeof(led_t));
    led_error2 = malloc(sizeof(led_t));
    led_mota   = malloc(sizeof(led_t));
    led_motb   = malloc(sizeof(led_t));
    memset(led_power  , 0, sizeof(led_t));
    memset(led_orders , 0, sizeof(led_t));
    memset(led_error1 , 0, sizeof(led_t));
    memset(led_error1 , 0, sizeof(led_t));
    memset(led_mota   , 0, sizeof(led_t));
    memset(led_motb   , 0, sizeof(led_t));

    led_power->behavior = LED_BEHAVIOR_ON;
}

uint8_t led_check_value(led_t* led)
{
    switch (led->behavior)
    {
    case LED_BEHAVIOR_OFF:
        return false;
        break;
    case LED_BEHAVIOR_TIMED:
        led->time--;
        if (led->time > 0)
        {
            return true;
        }
        else
        {
            led->behavior = LED_BEHAVIOR_OFF;
        }
        break;
    case LED_BEHAVIOR_ON:
    default:
        return true;
        break;
    }
    return false;
}

void do_leds(void)
{
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_POWER)   | (led_check_value(led_power)  ? PIN_LED_POWER   : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_ORDERS)  | (led_check_value(led_orders) ? PIN_LED_ORDERS  : 0);
    PORTA.OUT = (PORTA.OUT & ~PIN_LED_ERROR_1) | (led_check_value(led_error1) ? PIN_LED_ERROR_1 : 0);
    PORTE.OUT = (PORTE.OUT & ~PIN_LED_ERROR_2) | (led_check_value(led_error2) ? PIN_LED_ERROR_2 : 0);
    PORTC.OUT = (PORTC.OUT & ~PIN_LED_MOT_A)   | (led_check_value(led_mota)   ? PIN_LED_MOT_A   : 0);
    PORTC.OUT = (PORTC.OUT & ~PIN_LED_MOT_B)   | (led_check_value(led_motb)   ? PIN_LED_MOT_B   : 0);
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Digital output
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void do_digout(void)
{
    if ((digital_send_idx == digital_send_len) && (digital_send_len != 0))
    {
        led_error1->behavior = LED_BEHAVIOR_OFF;

        digital_send_len = 0;
        digital_send_idx = 0;
        memset(digital_send_buf, 0, 32 * sizeof(uint8_t));
        PORTA.OUTCLR = PIN_DIGITAL_1;
        PORTB.OUTCLR = PIN_DIGITAL_2;
        PORTC.OUTCLR = PIN_DIGITAL_3;
        PORTE.OUTCLR = PIN_DIGITAL_4;
        PORTA.OUTCLR = PIN_ANALOG_1;
        PORTB.OUTCLR = PIN_ANALOG_2;
        PORTA.OUTCLR = PIN_ANALOG_3;
        PORTB.OUTCLR = PIN_ANALOG_4;
    }

    if (digital_send_idx < digital_send_len)
    {
        led_error1->behavior = LED_BEHAVIOR_ON;
        
        uint8_t cur = digital_send_buf[digital_send_idx];
        PORTA.OUT = (PORTA.OUT & ~PIN_DIGITAL_1) | ((cur & (1<<0)) ? PIN_DIGITAL_1 : 0);
        PORTB.OUT = (PORTB.OUT & ~PIN_DIGITAL_2) | ((cur & (1<<1)) ? PIN_DIGITAL_2 : 0);
        PORTC.OUT = (PORTC.OUT & ~PIN_DIGITAL_3) | ((cur & (1<<2)) ? PIN_DIGITAL_3 : 0);
        PORTE.OUT = (PORTE.OUT & ~PIN_DIGITAL_4) | ((cur & (1<<3)) ? PIN_DIGITAL_4 : 0);
        PORTA.OUT = (PORTA.OUT & ~PIN_ANALOG_1)  | ((cur & (1<<4)) ? PIN_ANALOG_1  : 0);
        PORTB.OUT = (PORTB.OUT & ~PIN_ANALOG_2)  | ((cur & (1<<5)) ? PIN_ANALOG_2  : 0);
        PORTA.OUT = (PORTA.OUT & ~PIN_ANALOG_3)  | ((cur & (1<<6)) ? PIN_ANALOG_3  : 0);
        PORTB.OUT = (PORTB.OUT & ~PIN_ANALOG_4)  | ((cur & (1<<7)) ? PIN_ANALOG_4  : 0);
    
        digital_send_idx++;
    }
}

void init_digout(void)
{
    PORTA.DIRSET |= PIN_DIGITAL_1 | PIN_ANALOG_1 | PIN_ANALOG_3;
    PORTB.DIRSET |= PIN_DIGITAL_2 | PIN_ANALOG_2 | PIN_ANALOG_4;
    PORTC.DIRSET |= PIN_DIGITAL_3;
    PORTE.DIRSET |= PIN_DIGITAL_4;
    digital_send_len = 0;
    digital_send_idx = 0;
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
    
    WDT_EnableAndSetTimeout(WDT_PER_512CLK_gc);

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

    /* set up crude digital outputs */
    init_digout();

    /* Flash all the LEDs for two and a half seconds to make sure
     * they're hooked up */
    led_orders->behavior = LED_BEHAVIOR_TIMED;
    led_orders->time = 4000;
    led_error1->behavior = LED_BEHAVIOR_TIMED;
    led_error1->time = 6000;
    led_error2->behavior = LED_BEHAVIOR_TIMED;
    led_error2->time = 8000;
    led_mota->behavior = LED_BEHAVIOR_TIMED;
    led_mota->time = 10000;
    led_motb->behavior = LED_BEHAVIOR_TIMED;
    led_motb->time = 12000;

    /* motA.duty = 4000; */
    /* motA.direction = 1; */
    /* motB.duty = 16000; */
    /* motB.direction = 1; */

    /* enable interrupts - things start ticking now */
    sei();


    /* ============================== */
    /* main loop ==================== */
    /* ============================== */
    for(;;)
    {
        _delay_us(10);
        WDT_Reset();
    }
}
