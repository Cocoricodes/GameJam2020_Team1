ArrayList<Temperature> TemperatureEnemie = new ArrayList<Temperature>();
ArrayList<Oxygene> OxygeneEnemie = new ArrayList<Oxygene>();
void setup() 
{
  //Code setup
}

void draw() 
{
  for (
  
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
      y = 0;/*en haut*/
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
