float   unit;

void setup(){
  size(200,200,P3D);
  unit = 32;  
}
void draw(){
  noStroke();
  ortho();
  translate(width/2,height/2);

  rotateX(-radians(45));//+frameCount));
  rotateY(radians(45));
  //lights();
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
  pushMatrix();
  translate(0,-unit,0);
  box(unit);
  popMatrix();
  pushMatrix();
  translate(0,0,unit);
  box(unit);
  popMatrix();
  pushMatrix();
  translate(-unit,0,0);
  box(unit);
  popMatrix();
}
