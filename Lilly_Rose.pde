PImage play;
PImage level;
//PImage etoile1;
//PImage etoile2;
PImage etoile3;
PImage Win;
PImage recharge;
PImage bouton;

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
}
void draw() {
 background(100);
 test();
}


void test (){
 image(play, 200, 200, 200, 200);
 fill (#FFFFFF);
 textSize (50);
 text ("Space Oxyders",300, 100);
 fill (#FFFFFF);
 textSize (26);
 text("règles du jeu:\n\nRépartir la chaleur sur le paddle pour éviter que sa couche\nde chrome cède sous l'effet de l'occidation\ndue à l'oxygène ambiant.", 0, 430);
 if (colision(mouseX, mouseY,50, 50, 400, 300, 300, 300)){
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
 background();
 image(etoile3, 200, 200, 200, 200);
 image(Win, 300, 100, 100, 100);
 image(play,800, 600, 200, 200);
 text(dollars);
 image(recharge,500,400,200, 100);
 }

  
  

  
