#line 1 "C:/Users/Islam/Desktop/project/New folder/MyProject.c"






void main(){
int arr[]={0,1,2,3,4,5,6,7,8,9,16,17,18,19,20,21,22,23,24,25,32,33,34,35};
#line 11 "C:/Users/Islam/Desktop/project/New folder/MyProject.c"
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
 while(1)
 {
 while(portd.b0!=1)
 {
 for( i = 23; i >=1&&portd.b0!=1;i-- ){
 portb=arr[i];
  portc.b1 =1;
  portc.b2 =0;
  portc.b3 =0;
  portc.b4 =0;
 if(i>3){
  portc.b5 =0;
  portc.b6 =1;}
 else {
  portc.b5 =1;
  portc.b6 =0;}
 delay_ms(1000);
 }
 x=1;
 for(i=15;i>=1&&x&&portd.b0!=1;i--){
 portb=arr[i];
  portc.b1 =0;
  portc.b5 =0;
  portc.b6 =0;
  portc.b4 =1;
 if(i>3){
  portc.b2 =0;
  portc.b3 =1;}
 else{
  portc.b2 =1;
  portc.b3 =0;
 }
 delay_ms(1000);
 }
 }
 while(portd.b0==1)
 {
 int sec=3;
 if(portd.b0==1&& portc.b1 ==1){
 for(sec=3;sec>0&&portd.b0==1;sec--){
 portb=arr[sec];
  portc.b5 =1;
  portc.b6 =0;
 delay_ms(1000);
 }
 portb=0;
  portc.b1 =0;
  portc.b2 =0;
  portc.b3 =1;
  portc.b4 =1;
  portc.b5 =0;
  portc.b6 =0;
 while(portd.b0==1&&portd.b1==0);
 }

 if(portd.b0==1&&portc.b1==0){
 for(sec=3;sec>0&&portd.b0==1;sec--){
 portb=arr[sec];
  portc.b2 =1;
  portc.b3 =0;
 delay_ms(1000);
 }
 portb=0;
  portc.b1 =1;
  portc.b2 =0;
  portc.b3 =0;
  portc.b4 =0;
  portc.b5 =0;
  portc.b6 =1;
 while(portd.b0==1&&portd.b1==0);
 }
 }
}
}
