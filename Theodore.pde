ArrayList<Temperature> TemperatureEnemie = new ArrayList<Temperature>();
ArrayList<Oxygene> OxygeneEnemie = new ArrayList<Oxygene>();
int tempMax = 100;
int oxyMax = 100;
Table table = new Table();
void setup() 
{
  int a = 20;
  TemperatureEnemie.add(new Temperature(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\mechant chaleur.png"));
  OxygeneEnemie.add(new Oxygene(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\O2 (1).png"));
  
  table.addColumn("level");
  table.addColumn("oxygene");
  table.addColumn("temperature");
  for (int i= 0; i<10; i++)
  {
  TableRow newRow = table.addRow();
  newRow.setInt("level", i+1);
  newRow.setInt("oxygene", 50*(i+1)+int(random(-50*(i+1)/4, 50*(i+1)/4)));
  newRow.setInt("temperature", 50*(i+1)+int(random(-50*(i+1)/4, 50*(i+1)/4)));
  
  }
}

void draw() 
{
  
  for (int i = 0; i < TemperatureEnemie.size(); i++) {
    if (TemperatureEnemie.get(i).barreToucher())
    {
      //degat barre temp
      int a = int(random(15,25));
      if (int(random(1,4))==3) {TemperatureEnemie.add(new Temperature(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\mechant chaleur.png"));}
    }
  }
  for (int i = 0; i < OxygeneEnemie.size(); i++) {
    if (OxygeneEnemie.get(i).barreToucher())
    {
      //degat barre oxy
      int a = int(random(15,25));
      if (int(random(1,4))==3) {OxygeneEnemie.add(new Oxygene(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\O2 (1).png"));}
    }
  }
}
  

class Enemie
{
  float x, y, v, va, c1, c2, vie, type;
  PImage skin; 
  Enemie(float ex, float ey, float ev, float eva, float ec1, float ec2, float evie, String photo)
  {
    x=ex;
    y=ey;
    v=ev;
    va=eva;
    ec1=c1;
    ec2=c2;
    vie=evie;
    skin=loadImage(photo);
  }
  
void enemiUpdate(){
  y  += v;
  image(skin, x, y, c1, c2);
}

  boolean barreToucher(){
    enemiUpdate();
    boolean InbarreToucher = false;
    if(y>=(height/2+50)){
      InbarreToucher = true ;
    }
    if(InbarreToucher == true){
      x = int(random(0,1000));/*en haut*/
      y = int(random(0,20));/*en haut*/
      if (type==1)
      {
        tempMax--;
      }
      else
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
