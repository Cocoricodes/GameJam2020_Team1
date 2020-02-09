PImage play;
PImage level;
//PImage etoile1;
//PImage etoile2;
PImage etoile3;
PImage Win;
PImage recharge;
PImage bouton;
PImage argent;
PImage logo;

void setup () {
  size (800, 600);
  play = loadImage("boutonplay.PNG");
  level= loadImage("backgound(1).JPG");
 // etoile1= loadImage("_ 1étoile.jpg");
 // etoile2 =loadImage("2 étoile.png");
  etoile3 = loadImage("3 étoile.png");
  Win = loadImage("Win game.png");
  recharge=loadImage("coucheneuve.jpg");
  bouton =loadImage("bouton+.PNG");
  logo=loadImage("https://github.com/Cocoricodes/GameJam2020_Team1/blob/master/Images/LOGO%20game.png?raw=true","png");
  argent=loadImage("https://github.com/Cocoricodes/GameJam2020_Team1/blob/master/Images/dollar.png?raw=true","png");
}
void draw() {
 background(100);
 test();
}


void test (){
 image(play, 200, 200, 200, 200);
 fill (#FFFFFF);
 image (logo,400,300,100,100);
 fill (#FFFFFF);
 textSize (26);
 text("règles du jeu:\n\nRépartir la chaleur sur le paddle pour éviter que sa couche\nde chrome cède sous l'effet de l'occidation\ndue à l'oxygène ambiant.", 0, 430);
 if (colision(mouseX, mouseY,50, 50, 200, 200, 200, 200)){
   image(level,0,0,800,600);
   // lancement du niveau 1
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


void next() {
  if (vie <1) {
    background (0);
    textSize(100);
    text("GAME OVER", 400, 300);
   }else{
     if (t1 >1 && vie >0){
      
   }
 }
}
  
  
  
void ecranFinDeNiveau (){
 //for (int i= 0; i<10; i++)
 // {
 //   table[i].getInt("level");
 //  table[i].getInt("etoile");
 // }
 background(100);
 image(etoile3, 300, -50, 300, 300);
 image(Win, 200, 10, 400, 400);
 image(play,700, 500, 100, 100);
 textSize(100);
 text(dollars,450,400);
 image(recharge,50,280,200, 100);
 image(bouton,270,480,100,100);
 image(argent,350,325,100,100);
 if (colision(mouseX,mouseY,50,50,700,500,100,100)){
   image(level,0,0,800,600);
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
void mouseClicked(){
   if (colision(mouseX,mouseY,50,50,270,480,100,100)&&(dollars>12)){
   dollars -=12;
   }   
}
//pour ajouter une couche de chrome
  
