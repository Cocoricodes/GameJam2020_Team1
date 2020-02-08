int vie=5;
int x=10; 
int y=50 ; 
int w=20;
int h=150 ;
int wblocimage = 100;
int hblocimage = 15;
PImage img100;
PImage img80;
PImage img60;
PImage img40;
PImage img20;
PImage img0;



PImage abime1;
PImage abime2;
PImage bcpabime1;
PImage bcpabime2;
PImage barredestroy;

//img théodore
PImage skin; 
//var Théodore
int tempMax = 100;
int oxyMax = 100;
Barriere b;
//bool Théodore




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
  background(255);// chargement barre de vie 
  img100=loadImage ("bar100.png");
  img80 = loadImage("bar80.png");
  img60 = loadImage("bar60.png");
  img40 = loadImage("bar40.png");
  img20 = loadImage("bar20.png");
  img0 = loadImage("bar0.png");
  
  abime1 = loadImage("abime1.jpg");
  abime2 = loadImage ("abime2.jpg");
  bcpabime1= loadImage("bcpabime1.jpg");
  bcpabime2= loadImage("bcpabime2.jpg");
  
  

  skin=loadImage (photo);
}
//collision
boolean colision(int xbX, int ybY, int wBloc, int wblocimage, int posX, int yObjet2, int wObjet2, int hObjet2) {
  if ( xbX + wBloc > xObjet2 && xObjet2 + wObjet2 > xbX) {
    if ( ybY + wblocimage > yObjet2 && yObjet2 + hObjet2 > ybY) {
      vie =vie-1;
      return true;
    }
  }
  return false;
}
//dessin barre de vie 
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




void enemiUpdate() {
  y  += v;
  image(skin, x, y, c1, c2);
}

void ReactionBarre() {
} 






//collision//

boolean barreToucher() {
  enemiUpdate();
  boolean InbarreToucher = false;
  if (y>=(height/2+50)) {
    InbarreToucher = true ;
  }
  if (InbarreToucher == true) {
    x = int(random(0, 1000));/*en haut*/
    y = int(random(0, 20));/*en haut*/
    if (barreToucheOxy == true) {
      if(barreToucheOxyv == neuve ){
      dollars = dollars+1;
    }
      if(barreToucheOxy == abime1);{
      dollars=dollars+0.80;}
      if(barreToucheOxy == abime2);{
      dollars=dollars+0.60;}
      if(barreToucheOxy == bcpabime1);{
      dollars=dollars+0.40;}
      if(barreToucheOxy == bcpabime2);{
      dollars=dollars+0.20;}
    
    }

    if ( barreToucheTemp = true) {
      image (abime1, 150, 50);
       vie =vie-1;
    }{
    tempMax--;
  } 
  else  {
    oxyMax--;
    
  }
}


void posennemi (){
 InbarreToucher = true ;
 posX(posennemi)
 
 
 }



  return InbarreToucher;
}
