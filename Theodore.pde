ArrayList<Temperature> TemperatureEnemie = new ArrayList<Temperature>();
ArrayList<Oxygene> OxygeneEnemie = new ArrayList<Oxygene>();
void setup() 
{
  //Code setup
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
      //degat barre temp
      int a = int(random(15,25));
      if (int(random(1,4))==3) {OxygeneEnemie.add(new Oxygene(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\O2 (1).png"));}
    }
  }
}
  

class Enemie
{
  float x, y, v, va, c1, c2, vie;
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
    }
    
    return InbarreToucher;
  }
}
class Temperature extends Enemie
{

  Temperature(float ex, float ey, float ev, float eva, float ec1, float ec2, float evie, String photo)
  {
     super( ex, ey, ev, eva, ec1, ec2, evie, photo );
     
  }
  
}
class Oxygene extends Enemie
{

  Oxygene(float ex, float ey, float ev, float eva, float ec1, float ec2, float evie, String photo)
  {
     super( ex, ey, ev, eva, ec1, ec2, evie, photo );
     
  }
  
}
