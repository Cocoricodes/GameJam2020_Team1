void setup(){
  
  //Lilly-Rose
  size (1000, 800);
  play = loadImage("boutonplay.PNG"); 
  //Mathias
  b = new Barriere(height/2+50, 100, 50, color(100)) ;
}

void draw(){
  Antonin();
  Lilly();
  Mathias();
}

void Antonin(){
  rect (0,550,2000,40);
  fill(#8B7D7D);
  rect (10,50,20,150);
}

void Lilly(){
   background(100);
   test();
}

void Mathias(){
  b.show();
}
