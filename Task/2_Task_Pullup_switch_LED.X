
// PIC16F877A Configuration Bit Settings

// 'C' source line config statements

// CONFIG
#pragma config FOSC = EXTRC     // Oscillator Selection bits (RC oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>
#define _XTAL_FREQ 6000000

unsigned char value;

void main()
{
    TRISC=0X0F; //0000  1111    Set TRISC Bits RC3,2,1,0 as Input
    TRISD=0X00; //0000  0000    set TRISD Bits RD7 to RD0 as output
    PORTC=0X00; //RULE: we can't able to change the bit if we configured as Input in pin configuration.
    PORTD=0X00; //Initial stage two LED will not glow.
    
    while(1)
    {
        value=PORTC;
        switch(value)
        {
            case 0X0E: PORTD=0X10; //0000   1110 - PRESS RC0 //0001 0000 RD4 ON RD3 OFF
            break;
            case 0X0D: PORTD=0X18;  //0000  1101  -PRESS RC1 //OOO1 1OOO RD4 && RD3 ON
            break;
            case 0X0B: PORTD=0X00;  //0000  1011  -PRESS RC2 //0000 0000  RD4 && RD3 OFF
            break;
                case 0X07: PORTD=0X08;  //0000  0111 -PRESS RC3 //0000 1000 RD4 OFF && RD3 ON
            break;
        }
    }
}
