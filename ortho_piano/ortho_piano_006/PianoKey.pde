class PianoKey{
  int     index;
  boolean isBlack;
  
  PianoKey(int i, boolean b){
    index = i;
    isBlack = b;
  }
  void draw(){
    pushMatrix();
    if(!isBlack){
      fill(255);
      translate(0,0,unit*2);
      box(unit*.9,unit*.8,unit*4);
    }else{
      fill(0);
      translate(0,-unit*.6/2,unit*.6*2);
      box(unit*.6,unit*.6,unit*.6*4);
    }
    popMatrix();
  }
}
