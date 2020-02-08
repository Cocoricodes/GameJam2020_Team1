Barre ba;

void setup() {
  size(100,800);
  ba = new Barre(15 , 150);
}

void draw() {
  background(255);
  ba.barreInitOrShow();
}

class Bloc {
  float blocX, blocY;
  int blocVie;
  PImage blocImage;
  Bloc ( float bX, float bY, int bVie ) {
    blocX = bX;
    blocY = bY;
    blocVie = bVie;
  }
  void blocShow() {
    if(blocVie > 5) { blocVie = 5; }
    if(blocVie < 0) { blocVie = 0; }
    blocImage = loadImage("data/bloc-"+blocVie+".jpg"); 
    image(blocImage, blocX, blocY);
    //blocImage.resize(100,50);
  }
  
  void blocUpdatePosX(float posX) { blocX = posX; }
  
  void blocPerdreVie() { blocVie -= 1; }
}

class Barre {
  float barreNombre, barreY;
  ArrayList<Bloc> blocs = new ArrayList<Bloc>();
  boolean isInitialised = false;
  Barre( float bNombre, float bY ) {
    barreNombre=bNombre;
    barreY=bY;
  }
  
  void barreInitOrShow() {
    if(isInitialised == false) {
      for(int i=0; i<barreNombre; i++) {
        blocs.add(new Bloc(20+i*500,height/2,4));
      }
      isInitialised = true;
    } else {
      if(blocs.size() == 0) {
        isInitialised = false;
      } else {
        for(int i=0; i<barreNombre; i++) {
          Bloc bl = blocs.get(i);
          bl.blocShow();
          bl.blocUpdatePosX(  (mouseX + i * ( bl.blocImage.width ) - ( barreNombre*bl.blocImage.width )/2 ) );
          println("Updated");
        }
      }
    }
  }
}
