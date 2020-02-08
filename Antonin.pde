int paddle ;
int Life ;
int x=10; 
int y=50 ; 
int w=20;
int h=150 ;
PImage img100;
PImage img80;
int vie=5;


void setup() {
  size (1000, 800);
  background(255);
  img100=loadImage ("bar100.png");
  img80 = loadImage("bar80.png");
}

void draw() {

  image(img100, 0, 0);
}
void barreToucher() {
  boolean barreToucher = false;
  if (y<550) {
    barreToucher = true ;
  }
  if (barreToucher ) {
    vie= vie-1;
  }
  if (vie== 4) {
    image(img80, 0, 0);
  }
    if (vie== 3){
    image(img80, 0, 0);
  }
    if (vie==2){
    image(img80, 0, 0);
  }
  
    if (vie==1){
    image(img100, 0, 0);
  }
}    
