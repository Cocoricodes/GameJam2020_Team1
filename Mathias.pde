Barre ba;
PImage[] blocImages = new PImage[6];
PImage aluminium;

void setup() {
  size(1000,600);
  //fullScreen();
  ba = new Barre(4 , height/2+100);
  for(int i=0; i<6; i++ ){
    blocImages[i] = loadImage("data/bloc-"+i+".jpg");
    blocImages[i].resize(150,50);
  }
  aluminium = loadImage("data/aluminium.jpg");
}

void draw() {
  background(255);
  ba.barreInitOrShow();
  aluminium.resize(width, height);
  image(aluminium, 0, height/2+150);
}

class Bloc {
  float blocX, blocY, blocVitesse;
  int blocVie;
  PImage blocImage;
  Bloc ( float bX, float bY, int bVitesse, int bVie ) { blocX = bX; blocY = bY; blocVie = bVie; blocVitesse = bVitesse; }
  
  void blocShow() { 
    image(blocImages[blocVie], blocX, blocY);
  }
  
  void blocSetImage() {
    if(blocVie > 5) { blocVie = 5; }
    if(blocVie < 0) { blocVie = 0; }
    blocImage = blocImages[blocVie];
  }
  
  void blocPerdreVie() { 
    blocVie -= 1; 
  }
  
  void blocDeplacementsGauche(float blocId) {
     if( keyPressed ){
      if( keyCode == LEFT && blocX > blocId*blocImages[0].width ){
        blocX -= blocVitesse;
      }
    }
  }
  
    void blocDeplacementsDroite(float blocId) {
    if( keyPressed ) {
      println( height - (blocImages[0].width * blocId), width - blocImages[0].width );
      //delay(100);
      if(keyCode == RIGHT && !isLastBlocAtScreenRight() ) {
        blocX += blocVitesse;
      }
    }
  }
  boolean isLastBlocAtScreenRight () { return ba.blocs.get(ba.barreNombre-1).blocX+blocImages[0].width >= width; }
}

class Barre {
  int barreNombre;
  float barreY;
  ArrayList<Bloc> blocs = new ArrayList<Bloc>();
  boolean isInitialised = false;
  
  Barre( int bNombre, float bY ) { barreNombre=bNombre; barreY=bY; }
  
  void barreInitOrShow() {
    if(isInitialised == false) { 
      for(int i=0; i<barreNombre; i++) { 
        blocs.add(new Bloc( i*blocImages[0].width, barreY, 4, 5 ) ); } 
        isInitialised = true;
    } else { 
      if(blocs.size() == 0) { 
        isInitialised = false;
      } else {
        for(int i=0; i<barreNombre; i++) {
          Bloc bl = blocs.get(i);
          bl.blocSetImage();
          bl.blocShow();
          bl.blocDeplacementsGauche(i);
          bl.blocDeplacementsDroite(i);
} } } } }
