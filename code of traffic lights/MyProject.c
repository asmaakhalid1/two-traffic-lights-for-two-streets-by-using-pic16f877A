#define red2 portc.b1
#define yellow2 portc.b2
#define green2 portc.b3
#define red1 portc.b4
#define yellow1 portc.b5
#define green1 portc.b6
void main(){
int arr[]={0,1,2,3,4,5,6,7,8,9,16,17,18,19,20,21,22,23,24,25,32,33,34,35};
/* this nums of array make the decimal value devide into two four bits in
two decoders to display two nums in 7 seg */
int i=0;
int x=0;
               trisb=0;
               trisd=1;
               trisc=0;
               portb=0;
               portc=0;
               portd=0;
               delay_ms(1000);
       portc.b0=1;
       while(1)           //infinite loop
       {
       while(portd.b0!=1)    // while switch is open automatic mode go on
       {
       for( i = 23; i >=1&&portd.b0!=1;i-- ){
       portb=arr[i];
       red2=1;
       yellow2=0;
       green2=0;
       red1=0;
       if(i>3){
       yellow1=0;
       green1=1;}
       else {
       yellow1=1;
       green1=0;}
       delay_ms(1000);
       }
        x=1;     //to make this loop dosent work until first loop ended
       for(i=15;i>=1&&x&&portd.b0!=1;i--){
       portb=arr[i];
       red2=0;
       yellow1=0;
       green1=0;
       red1=1;
       if(i>3){
       yellow2=0;
       green2=1;}
       else{
       yellow2=1;
       green2=0;
       }
       delay_ms(1000);
       }
       }      //end of automatic mode
       while(portd.b0==1)// start of manual
       {
       int sec=3;
       if(portd.b0==1&&red2==1)/*concept of manual is checking if red is on
       in street we on yellow in the other to three sec and then we close yellow
       and open red and in the street of red we open green */
       
       {
       for(sec=3;sec>0&&portd.b0==1;sec--){
       portb=arr[sec];
       yellow1=1;
       green1=0;
       delay_ms(1000);
       }
       portb=0;
       red2=0;
       yellow2=0;
       green2=1;
       red1=1;
       yellow1=0;
       green1=0;
       while(portd.b0==1&&portd.b1==0);
       }

       if(portd.b0==1&&portc.b1==0){
       for(sec=3;sec>0&&portd.b0==1;sec--){
       portb=arr[sec];
       yellow2=1;
       green2=0;
       delay_ms(1000);
       }
       portb=0;
       red2=1;
       yellow2=0;
       green2=0;
       red1=0;
       yellow1=0;
       green1=1;
       while(portd.b0==1&&portd.b1==0); //in case manual mode is on and switch of manual is open stop looping
       }
       }
}
}