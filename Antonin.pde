int paddle ;
int Life ;
int x=10; 
int y=50 ; 
int w=20;
int h=150 ;



void draw(){
  
  fill(#8B7D7D);
    rect (x,y,w,h);

}
  void barreToucher(){
    boolean barreToucher = false;
    if(y<550){
      barreToucher = true ;
    }
    if(barreToucher ){
     rect (x,y,w-4,h);
    }
  }    


void setup() {
size (1000,800);}
