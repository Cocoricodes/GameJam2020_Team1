void enemiUpdate(){
  y  += v;
  int y;
  int x;
  enemi = loadImage("emplacement.png");
  image(enemi,x,y,/*taille*/,/*taille*/);
}
  boolean barreToucher(){
    boolean barreToucher == false;
    if(y>/* la barre */){
      barreToucher == true ;
    }
    if(barreToucher == true){
      x = /*en haut*/;
      y = /*en haut*/;
    }
  }    
