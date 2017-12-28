class Piano{
  Piano(){
  }
  void draw(){
    if(doLights)noStroke();
    pushMatrix();
    box(100);
    popMatrix();
  }
}
