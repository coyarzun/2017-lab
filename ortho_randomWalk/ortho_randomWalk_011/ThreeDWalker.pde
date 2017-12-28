class ThreeDeeWalker{
  
  ThreeDeeWalker(){
  }
  void update(){
  }
  void draw(){
    noStroke();
    pushMatrix();
    box(unit*12);
    popMatrix();
  }
}
