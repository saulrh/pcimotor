//I2C Interface:

//--------------------------------------------------
//stop
//0x00
#define I2C_CMD_STOP 0x00

/*Emergency stop. _Immediately_ cuts power to all sensors and motors.*/

//--------------------------------------------------
//reset
//0x01
#define I2C_CMD_RESET 0x01

/*Clears out state, including motor, sensor, and controller
configurations. If the previous instruction was not a stop or a pause,
this instruction will execute a pause before executing so that the
system doesn't go haywire when its controllers are reset.*/

//--------------------------------------------------
//pause
#define I2C_CMD_PAUSE 0x02

/*Stops the motors and the sensors, but holds on to the system's state,
including motor, sensor, and controller configurations. Note that this
command will take some time to be executed, as it will use the
controllers to bring the motors to a stop safely and it will take the
time to cleanly shut down sensors and other peripherals.*/

//--------------------------------------------------
//go
//0x03 BB
#define I2C_CMD_GO 0x03
/*Instructs the motor controller to run. The two bytes (16-bit int)
specify a timeout - if the controller hasn't received an update within
this many ticks of clock0 (default 10kHz), it will assume that the
master has died and will pause (this will behave the same as if a 0x01
is sent). For example, sending 0x03 0x10 0x00 will run the motor for
.4 seconds without further orders.

Note that the motor controller will not do _anything at all_ with the
motors unless this command is sent, that it will _immediately_ stop
the motors if the timer runs out, and the maximum timeout is just over
six seconds. This is intentional.*/

//--------------------------------------------------
//set motor sensor channel
//0x10 B
#define I2C_CMD_GO 0x10
/*A sensor input comes in from either the analog or digital ports ports
on the input headers. Write your own function and hook it in, or
modify one of the ones provided for convenience.

The input byte is broken down into two sections. The highest-order
(most significant) bit is used to select which motor channel to use -
0 is channel A, 1 is channel B. The second highest bit is used to turn
on or off the PID controller; when off, the channel simply uses the
target as a duty cycle. If the second bit is 1, then the PID
controller is started and the lowest-order bits specify one of the 16
sensor functions.

As some examples:

0x00 will set motor A to duty cycle control
0x41 will set motor A to use sensor 1 to get measurements for the PID
0x55 will set motor B to use sensor 5 to get measurements for the PID

Note that the controller will do the smart thing based on the the
given sensor's output type. If the chosen sensor reports velocity,
then the controller will interpret the target as a velocity and pay
attention to the fact that it's controlling a first-order system; if
the chosen sensor reports position, then the controller will interpret
the target as a position and know that it's controlling a second-order
controller.*/

//--------------------------------------------------
//set controller target
//0x20 BBBBBBBB
#define I2C_CMD_SET_CONTROLLER_TARGET 0x20
/*Set the controller's target value. It's a 64-bit float.

To transfer the value, push the bytes of the target, starting with the
lowest-order (least significant) byte and going to the highest-order
(most significant, ending with the sign) byte.*/

//--------------------------------------------------
//set controller P
//0x21 BBBBBBBB
#define I2C_CMD_SET_CONTROLLER_P 0x21
/*Set the controller's proportional constant. It's a 64-bit float.

To transfer the value, push the bytes of the target, starting with the
lowest-order (least significant) byte and going to the highest-order
(most significant, ending with the sign) byte.*/

//--------------------------------------------------
//set controller I
//0x22 BBBBBBBB
#define I2C_CMD_SET_CONTROLLER_I 0x22
/*Set the controller's integral constant. It's a 64-bit float.

To transfer the value, push the bytes of the target, starting with the
lowest-order (least significant) byte and going to the highest-order
(most significant, ending with the sign) byte.*/

//--------------------------------------------------
//set controller D
//0x23 BBBBBBBB
#define I2C_CMD_SET_CONTROLLER_D 0x23
/*Set the controller's derivative constant. It's a 64-bit float.

To transfer the value, push the bytes of the target, starting with the
lowest-order (least significant) byte and going to the highest-order
(most significant, ending with the sign) byte.*/

//--------------------------------------------------
//get firmware version
//0x40
#define I2C_CMD_GET_FIRMWARE_VERSION 0x40
/*This will return the firmware version in two bytes as a 16-bit int.*/

//--------------------------------------------------
//get messages
//0x41
#define I2C_CMD_GET_MESSAGES 0x41
/*This will return any messages on the controller.*/
