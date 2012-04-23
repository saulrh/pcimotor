/* written by saul reynolds-haertle 2012. license is generic
 * permissive open-source until i decide on one in particular,
 * probably aroudn the time it goes up on github. */

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Defines
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////
// CPU frequency

#ifndef F_CPU
#define F_CPU 32000000
#endif

/////////////////////////////////////////
// Meaningful pin names

/* port A pins */
#define PIN_ANALOG_5 PIN0_bm
#define PIN_ANALOG_3 PIN1_bm
#define PIN_DIGITAL_1 PIN2_bm
#define PIN_ANALOG_1 PIN3_bm
#define PIN_SWITCH_3 PIN4_bm
#define PIN_LED_POWER PIN5_bm
#define PIN_LED_ORDERS PIN6_bm
#define PIN_LED_ERROR_1 PIN7_bm

/* port B pins */
#define PIN_ANALOG_2 PIN0_bm
#define PIN_ANALOG_4 PIN1_bm
#define PIN_DIGITAL_4 PIN2_bm
#define PIN_ANALOG_6 PIN3_bm

/* port C pins */
#define PIN_SDA_2 PIN0_bm
#define PIN_SCL_2 PIN1_bm
#define PIN_DIGITAL_5 PIN2_bm
#define PIN_LED_MOT_A PIN3_bm
#define PIN_LED_MOT_B PIN4_bm
#define PIN_SWITCH_5 PIN5_bm
#define PIN_SWITCH_4 PIN6_bm
#define PIN_OPTIONAL_OPTO_OUT PIN7_bm

/* port D pins */
#define PIN_MOT_CONTROL_EN_1 PIN0_bm
#define PIN_MOT_CONTROL_EN_2 PIN1_bm
#define PIN_ERROR PIN2_bm
#define PIN_MOT_CONTROL_A_2 PIN4_bm
#define PIN_MOT_CONTROL_B_2 PIN3_bm
#define PIN_MOT_CONTROL_A_1 PIN5_bm
#define PIN_MOT_CONTROL_B_1 PIN6_bm
#define PIN_OPTIONAL_OPTO_IN PIN7_bm

/* port E pins */
#define PIN_SDA_1 PIN0_bm
#define PIN_SCL_1 PIN1_bm
#define PIN_DIGITAL_6 PIN2_bm
#define PIN_LED_ERROR_2 PIN3_bm

/* port R pins */
#define PIN_SWITCH_1 PIN1_bm
#define PIN_SWITCH_2 PIN2_bm


/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Type and Variable Declarations
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////
// peripheral junk

typedef enum {
    LED_BEHAVIOR_OFF = 1,
    LED_BEHAVIOR_ON = 2,
    LED_BEHAVIOR_TIMED = 3,
} led_behavior_e;




/////////////////////////////////////////
// declarations you care about

/* stores PID settings and controller state, motor and sensor
 * channels, and so on */
typedef struct {
} controller_t;

/* stores motor configuration, state, and data */
typedef struct {
} motor_t;

/* stores sensor configuration and data */
typedef struct {
} sensor_t;

/* stores LED configuration and state */
typedef struct {
    led_behavior_e behavior;
    uint16_t time;
} led_t;

typedef double (*sensorfunc)(void);

typedef struct {
    sensorfunc 
} sensor_t;

/////////////////////////////////////////
// variables you care about

/* these are for controlling LEDs. In OFF or ON mode, the LED will
 * just be on or off. In timed mode, set .time to the number of calls
 * to do_leds() to turn the specified LED on for. do_leds is by called
 * in the ISR for clock0, which ticks at 10kHz, so the default is that
 * the led will light for .time/10 milliseconds. */

led_t led_power;
led_t led_orders;
led_t led_error1;
led_t led_error2;
led_t led_mota;
led_t led_motb;

sensorfunc sensor_functions[16];




/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/// Function Declarations
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void init_twi(void);
void init_leds(void);
void init_clock(void);
void init_sensors(void);
void init_motors(void);

void do_sensors(void);
void do_motors(void);
void do_leds(void);

/////////////////////////////////////////
// util functions
void TWIE_SlaveProcessData(void);

int main(void);
