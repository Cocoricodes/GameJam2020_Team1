PImage play;

void setup () {
  size (1000, 800);
  play = loadImage("boutonplay.PNG"); 
}
void draw () {
 background(100);
 test();
 
}


void test (){
 image(play, 400, 300, 300, 300);
 if (colision(mousex1
}
  
  
boolean colision(int xObjet1, int yObjet1, int wObjet1, int hObjet1, int xObjet2, int yObjet2, int wObjet2, int hObjet2){
  if( xObjet1 + wObjet1 > xObjet2 && xObjet2 + wObjet2 > xObjet1){
     if( yObjet1 + hObjet1 > yObjet2 && yObjet2 + hObjet2 > yObjet1){
       return true;
     }
   }
  return false;
}
  


