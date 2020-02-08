float t1;

void setup() {
t1 = millis();


}
  
  

  void draw(){
if(millis() >t1 + 10000 && int(random(1,2))== 2){
if(int(random(1,2))== 2)
{if(tempMax>0){
TemperatureEnemie.add(new Temperature(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\mechant chaleur.png"));}
else {
  if(oxyMax>0){
    OxygeneEnemie.add(new Oxygene(int(random(0,1000)), int(random(0,20)), int(random(1,3)), 1, a, a, 1, "Images\\O2 (1).png"));
  } 
 }
}
    
  
//code chronometre
 
 int tempsDeJeu=millis();
void setup(){
size(500,500);

}
  
  

  void draw(){
  background(25);
  textSize(35);
  text(millis()/1000,10,50);
  fill(#708090);
  textSize(35);
  text(oxyMax+tempMax,10,50);
  
 }




