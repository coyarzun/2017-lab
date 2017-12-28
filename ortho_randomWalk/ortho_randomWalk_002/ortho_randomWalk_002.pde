float   unit;
int cols, rows, zcols;

void setup(){
  size(400,400,P3D);
  unit = 8; 
  cols = 32; rows = 32; zcols = 32;
}
void draw(){
  background(0);
  doGrid();
}
void doGrid(){
  stroke(255);
  strokeWeight(2);
  beginShape(POINTS);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      for(int k=0; k<cols; k++){
        vertex(i*unit, j*unit, k*unit);
      } 
    }
  }
  endShape();
}
void xdraw(){
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
