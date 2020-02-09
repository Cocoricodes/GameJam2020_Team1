ArrayList<Temperature> TemperatureEnemie = new ArrayList<Temperature>();
ArrayList<Oxygene> OxygeneEnemie = new ArrayList<Oxygene>();
int tempMax = 100;
int oxyMax = 100;
int level = 1;
float t1;
int a;
int dollars = 0;
Table table = new Table();
import processing.sound.*;
//SoundFile collisionSound = new SoundFile(this, "son\\collision.mp3");
void setup() 
{
  size(800, 600);
  t1 = millis();
  int a = 20;
  TemperatureEnemie.add(new Temperature(int(random(0, 800)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/mechant chaleur.png"));
  OxygeneEnemie.add(new Oxygene(int(random(0, 800)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/O2 (1).png"));

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
  if(tempMax<=0){ TemperatureEnemie = new ArrayList<Temperature>(); }
  if(oxyMax<=0){ OxygeneEnemie = new ArrayList<Oxygene>(); }
  background(25);
  text("T:"+TemperatureEnemie.size()+" total:"+tempMax+" O:"+ OxygeneEnemie.size()+" total:"+oxyMax + " a:"+a, 400, 300);
  for (int i = 0; i < TemperatureEnemie.size(); i++) {
    println("X:"+TemperatureEnemie.get(i).posX()+" Y:"+TemperatureEnemie.get(i).posY());
    TemperatureEnemie.get(i).enemiUpdate();
    if (TemperatureEnemie.get(i).barreToucher())
    {
      println("z");
      //degat barre temp
      a = int(random(15, 25));
      if (int(random(1, 4))==3 && tempMax>0) {
        TemperatureEnemie.add(new Temperature(int(random(0, 800)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/mechant chaleur.png"));
      }
    }
    TemperatureEnemie.get(i).show();
  }
  for (int i = 0; i < OxygeneEnemie.size(); i++) {
    println("X:"+OxygeneEnemie.get(i).posX()+" Y:"+OxygeneEnemie.get(i).posY());
    OxygeneEnemie.get(i).enemiUpdate();
    if (OxygeneEnemie.get(i).barreToucher())
    {
      println("z2");
      //degat barre oxy
      a = int(random(15, 25));
      if (int(random(1, 4))==3 && oxyMax>0) {
        OxygeneEnemie.add(new Oxygene(int(random(0, 800)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/O2 (1).png"));
      }
    }
    OxygeneEnemie.get(i).show();
  }
  if (millis() >t1 + 10000 && int(random(1, 2))== 2) {
    a = int(random(15, 25));
    if (int(random(1, 2))== 2)
    {
      if (tempMax>0) {
        TemperatureEnemie.add(new Temperature(int(random(0, 800)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/mechant chaleur.png"));
      } else {
        if (oxyMax>0) {
          OxygeneEnemie.add(new Oxygene(int(random(0, 800)), int(random(0, 20)), int((random(1, 3)*20+5*level)/20), 1, a, a, 1, "Images/O2 (1).png"));
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
  String xph;
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
    xph=photo;
  }

  void enemiUpdate() {
    y  += v;
    image(skin, x, y, c1, c2);
    print("s:"+xph+";x"+x+";y:"+y+";c1:"+c1+";c2:"+c2);
  }

  boolean barreToucher() {
    boolean InbarreToucher = false;
    if (y>=(height/2+50)) {
      InbarreToucher = true ;
    }
    if (InbarreToucher == true && ((type==1 && tempMax>0)|| type==2 && oxyMax>0)) {
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
    image(skin, x, y, c1, c2);
    return InbarreToucher;
  }
  void show(){image(skin, x, y, c1, c2);}
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
