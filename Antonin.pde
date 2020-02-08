int paddle ;
int Life ;
int x=10; 
int y=50 ; 
int w=20;
int h=150 ;
PImage img100;
PImage img80;
PImage img60;
PImage img40;
PImage img20;
PImage img0;
int vie=5;
Barriere b;
class Barriere {
  float barriereY, barrierel, barriereL;
  color barriereColor;
  Barriere ( float posY, float largeur, float longueur, color bColor) {
    barriereY = posY;
    barrierel = largeur;
    barriereL = longueur;
    barriereColor = bColor;
  }
}


void setup() {
  size (1000, 800);
  background(255);
  img100=loadImage ("bar100.png");
  img80 = loadImage("bar80.png");
  img60 = loadImage("bar60.png");
  img40 = loadImage("bar40.png");
  img20 = loadImage("bar20.png");
  img0 = loadImage("bar0.png");
}

boolean colision(int xObjet1, int yObjet1, int wObjet1, int hObjet1, int xObjet2, int yObjet2, int wObjet2, int hObjet2){
  if( xObjet1 + wObjet1 > xObjet2 && xObjet2 + wObjet2 > xObjet1){
     if( yObjet1 + hObjet1 > yObjet2 && yObjet2 + hObjet2 > yObjet1){
       return true;
     }
   }
  return false;
}

void draw() {

  image(img100, 0, 0);
  if (vie== 4) {
    image(img80, 0, 0);
  }
  if (vie== 3) {
    image(img60, 0, 0);
  }
  if (vie==2) {
    image(img40, 0, 0);
  }

  if (vie==1) {
    image(img20, 0, 0);
  }
  if (vie==0) {
    image(img0, 0, 0);
  }
}



