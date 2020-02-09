boolean fight = false;
boolean debut = true;
boolean finNivOk = false;

void setup() {

  //Lilly-Rose
  size (800, 600);
  play = loadImage("Images/boutonplay.PNG");
  levelimg= loadImage("Images/backgound(1).jpg");
  // etoile1= loadImage("_ 1étoile.jpg");
  // etoile2 =loadImage("2 étoile.png");
  etoile3 = loadImage("Images/3 étoile.png");
  Win = loadImage("Images/Win game.png");
  //recharge=loadImage("Images/coucheneuve.jpg");
  //bouton =loadImage("Images/bouton+.png");
  logo=loadImage("Images/LOGO game.png");
  argent=loadImage("Images/dollar.png");
  //Mathias
  ba = new Barre(2 , width/2+75);
  //Antonin
  img100=loadImage ("Images/barpv100.png");
  img80 = loadImage("Images/barpv80.png");
  img60 = loadImage("Images/barpv60.png");
  img40 = loadImage("Images/barpv40.png");
  img20 = loadImage("Images/barpv20.png");
  img0 = loadImage("Images/barpv0.png");
  abime1 = loadImage("abime1.jpg");
  abime2 = loadImage ("abime2.jpg");
  bcpabime1= loadImage("bcpabime1.jpg");
  bcpabime2= loadImage("bcpabime2.jpg");
  //Maxime
  t1 = millis();
  //Theo
  int a = 20;
  TemperatureEnemie.add(new Temperature(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/mechant chaleur.png"));
  OxygeneEnemie.add(new Oxygene(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/O2 (1).png"));

  table.addColumn("level");
  table.addColumn("oxygene");
  table.addColumn("temperature");
  table.addColumn("etoile");
  for (int i= 0; i<10; i++)
  {
    TableRow newRow = table.addRow();
    newRow.setInt("level", i+1);
    newRow.setInt("oxygene", 50*(i+1)+int(random(-50*(i+1)/4, 50*(i+1)/4)));
    newRow.setInt("temperature", 50*(i+1)+int(random(-50*(i+1)/4, 50*(i+1)/4)));
    newRow.setInt("etoile", 0);
  }
  tempMax=table.getRow(level-1).getInt("temperature");
  oxyMax=table.getRow(level-1).getInt("oxygene");
}

void draw() {
  if (debut){
    Lilly();
  }
 if (fight){
   image(levelimg,0,0,800,600);
   Mathias();
   Maxime();
   Antonin();
   Theo();
 }
 if (finNivOk){
   
 }
}

void Antonin() {
  image(img100, width-100, 30);
  if (vie== 4) {
    image(img80, width-100, 30);
  }
  if (vie== 3) {
    image(img60, width-100, 30);
  }
  if (vie==2) {
    image(img40, width-100, 30);
  }
  if (vie==1) {
    image(img20, width-100, 30);
  }
  if (vie==0) {
    image(img0, width-100, 30);
  }
}

void Lilly() {
  test();
}

void Mathias() {
  ba.barreInitOrShow();
}

//void Arthaud(){
// if vie == 5 {
//  etoiles = 3;}

//if vie == 3-4 {
//  etoiles =2;}

//if vie == 1-2 {
//  etoiles = 1}   
//}
void Theo() {
  for (int i = 0; i < OxygeneEnemie.size(); i++) {
    OxygeneEnemie.get(i).enemiUpdate();
  }
  for (int i = 0; i < TemperatureEnemie.size(); i++) {
    TemperatureEnemie.get(i).enemiUpdate();
  }
   for (int i = 0; i < OxygeneEnemie.size(); i++) {
    OxygeneEnemie.get(i).barreToucher();
  }
  for (int i = 0; i < TemperatureEnemie.size(); i++) {
    TemperatureEnemie.get(i).barreToucher();
  }
  //for (int i = 0; i < TemperatureEnemie.size(); i++) {
  //  if (TemperatureEnemie.get(i).barreToucher())
  //  {
  //    //degat barre temp
  //    int a = int(random(15, 25));
  //    if (int(random(1, 4))==3) {
  //      TemperatureEnemie.add(new Temperature(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/mechant chaleur.png"));
  //    }
  //  }
  //}
  //for (int i = 0; i < OxygeneEnemie.size(); i++) {
  //  if (OxygeneEnemie.get(i).barreToucher())
  //  {
  //    //degat barre oxy
  //    int a = int(random(15, 25));
  //    if (int(random(1, 4))==3) {
  //      OxygeneEnemie.add(new Oxygene(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/O2 (1).png"));
  //    }
  //  }
  //}

  if (millis() >t1 + 1000 ) {
    if (int(random(1, 2))== 2)
    {int a = int(random(15, 25));
      if (tempMax>0) {
        TemperatureEnemie.add(new Temperature(int(random(0, width)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/mechant chaleur.png"));
      } else {
        if (oxyMax>0) {
          OxygeneEnemie.add(new Oxygene(int(random(0, width)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/O2 (1).png"));
        }
      }
    }
    t1 = millis();
  }
}

void Maxime() {
  textSize(35);
  text("temps : "+millis()/1000, 10, 50);
  fill(#708090);
  textSize(35);
  text("enemi : "+(oxyMax+tempMax), 10, 100);
}

void MaximeChrono() {

  if (millis() >t1 + 10000 && int(random(1, 2))== 2) {
    if (int(random(1, 2))== 2)
    {int a = int(random(15, 25));
      if (tempMax>0) {
        TemperatureEnemie.add(new Temperature(int(random(0, 1000)), int(random(0, 20)), int(random(1, 3)), 1, a, a, 1, "Images/mechant chaleur.png"));
      } else {
        if (oxyMax>0) {
          OxygeneEnemie.add(new Oxygene(int(random(0, 1000)), int(random(0, 20)), int(random(1, 3)), 1, a, a, 1, "Images/O2 (1).png"));
        }
      }
    }
  }
}

//******RECUP*********//


//Lilly
PImage play;
PImage levelimg;
//PImage etoile1;
//PImage etoile2;
PImage etoile3;
PImage Win;
PImage recharge;
PImage bouton;
PImage argent;
PImage logo;
//Mathias
Barre ba;
//Maxime
int tempsDeJeu=millis();
//Theo
ArrayList<Temperature> TemperatureEnemie = new ArrayList<Temperature>();
ArrayList<Oxygene> OxygeneEnemie = new ArrayList<Oxygene>();
int tempMax = 100;
int oxyMax = 100;
int level = 1;
float t1;
int dollars = 0;
Table table = new Table();
import processing.sound.*;
//Lilly
void test (){
 background(0);
 image(play, 200, 200, 200, 200);
 fill (#FFFFFF);
 textSize (50);
 text ("titre du jeu",300, 100);
 
 fill (#FFFFFF);
 textSize (26);
 text("règles du jeu:\n\nRépartir la chaleur sur le paddle pour éviter que sa couche\nde chrome cède sous l'effet de l'occidation\ndue à l'oxygène ambiant.", 0, 430);
 if (colision(mouseX, mouseY,50, 50, 200, 200, 200, 200)){
   fight = true;
   debut = false;
 }
}
boolean colision(int xObjet1, int yObjet1, int wObjet1, int hObjet1, int xObjet2, int yObjet2, int wObjet2, int hObjet2){
  if( xObjet1 + wObjet1 > xObjet2 && xObjet2 + wObjet2 > xObjet1){
     if( yObjet1 + hObjet1 > yObjet2 && yObjet2 + hObjet2 > yObjet1){
       return true;
     }
   }
  return false;
}
//Mathias

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
    blocImage = loadImage("Images/bloc-"+blocVie+".jpg");
    blocImage.resize(150,50);
    image(blocImage, blocX, blocY);
  }
  
  void blocUpdatePosX(float posX) { blocX = posX; }
  
  void blocPerdreVie() { blocVie -= 1; }
}

class Barre {
  float barreNombre, barreY;
  ArrayList<Bloc> blocs = new ArrayList<Bloc>();
  boolean isInitialised = false;
  Barre( float bNombre, float bY ) { barreNombre=bNombre; barreY=bY; }
  
  void barreInitOrShow() {
    if(isInitialised == false) { for(int i=0; i<barreNombre; i++) { blocs.add(new Bloc(500+i*500,height/2,4)); } isInitialised = true;
    } else { if(blocs.size() == 0) { isInitialised = false;
      } else {
        for(int i=0; i<barreNombre; i++) {
          Bloc bl = blocs.get(i);
          bl.blocShow();
          bl.blocUpdatePosX(  (mouseX + i * ( bl.blocImage.width ) - ( barreNombre*bl.blocImage.width )/2 ) );
} } } } }

//Theo
class Enemie
{
  float x, y, v, va, c1, c2, vie, type;
  PImage skin; 
  float posX() {
    return x;
  }
  float posY() {
    return y;
  }
  Enemie(float ex, float ey, float ev, float eva, float ec1, float ec2, float evie, String photo)
  {
    x=ex;
    y=ey;
    v=ev;
    va=eva;
    c1=ec1;
    c2=ec2;
    vie=evie;
    skin=loadImage(photo);
  }

  void enemiUpdate() {
    y  += v;
    image(skin, x, y, c1, c2);
  }

  //barre touchée.
  class Temperature extends Enemie
  {
    Temperature(float ex, float ey, float ev, float eva, float ec1, float ec2, float evie, String photo)
    {
      super( ex, ey, ev, eva, ec1, ec2, evie, photo );
      tempMax--;
      type = 1;
    }
  }
  class Oxygene extends Enemie
  {

    Oxygene(float ex, float ey, float ev, float eva, float ec1, float ec2, float evie, String photo)
    {
      super( ex, ey, ev, eva, ec1, ec2, evie, photo );
      oxyMax--;
      type = 2;
    }
  }

  void stop() {
  }
}
