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

