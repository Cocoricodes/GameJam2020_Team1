ArrayList<Temperature> TemperatureEnemie = new ArrayList<Temperature>();
ArrayList<Oxygene> OxygeneEnemie = new ArrayList<Oxygene>();
int tempMax = 100;
int oxyMax = 100;
int level = 1;
float t1;
int dollars = 0;
Table table = new Table();
import processing.sound.*;
SoundFile collisionSound = new SoundFile(this, "son\\collision.mp3");
void setup() 
{
  
  t1 = millis();
  int a = 20;
  TemperatureEnemie.add(new Temperature(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/chaleur (1).png"));
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

void draw() 
{

  for (int i = 0; i < TemperatureEnemie.size(); i++) {
    if (TemperatureEnemie.get(i).barreToucher())
    {
      //degat barre temp
      int a = int(random(15, 25));
      if (int(random(1, 4))==3) {
        TemperatureEnemie.add(new Temperature(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images\\chaleur (1).png"));
      }
    }
  }
  for (int i = 0; i < OxygeneEnemie.size(); i++) {
    if (OxygeneEnemie.get(i).barreToucher())
    {
      //degat barre oxy
      int a = int(random(15, 25));
      if (int(random(1, 4))==3) {
        OxygeneEnemie.add(new Oxygene(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images\\O2 (1).png"));
      }
    }
  }
  if (millis() >t1 + 10000 && int(random(1, 2))== 2) {
    int a = int(random(15, 25));
    if (int(random(1, 2))== 2)
    {
      if (tempMax>0) {
        TemperatureEnemie.add(new Temperature(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images\\chaleur (1).png"));
      } else {
        if (oxyMax>0) {
          OxygeneEnemie.add(new Oxygene(int(random(0, 1000)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images\\O2 (1).png"));
        }
      }
    }
  }
}

class Enemie
{
  float x, y, v, va, c1, c2, vie, type;
  PImage skin; 
  float posX() {return x;}
  float posY() {return y;}
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

  boolean barreToucher() {
    enemiUpdate();
    boolean InbarreToucher = false;
    if (y>=(height/2+50)) {
      InbarreToucher = true ;
    }
    if (InbarreToucher == true) {
      x = int(random(0, 1000));/*en haut*/
      y = int(random(0, 20));/*en haut*/
      posennemi(x, type);
      if (type==1)
      {
        tempMax--;
      } else
      {
        oxyMax--;
      }
    }

    return InbarreToucher;
  }
}
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

void stop() {}
