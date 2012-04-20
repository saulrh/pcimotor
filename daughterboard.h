/* written by saul reynolds-haertle 2012. license is generic
 * permissive open-source until i decide on one in particular,
 * probably aroudn the time it goes up on github. */


#ifndef F_CPU
#define F_CPU 32000000
#endif

void twi_init(void);
void clock_init(void);
void io_init(void);
void TWIE_SlaveProcessData(void);
int main(void);
