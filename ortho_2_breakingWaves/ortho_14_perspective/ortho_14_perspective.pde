float   unit;
int     rows, cols;

void setup(){
  size(400,400,P3D);
  unit = 8;   cols = 5*2*2*2; rows = 1*(cols+2);
}
void draw(){
  background(0);
  noStroke();
  //ortho();
  //translate(width/2,height/2);
  rotateX(-radians(45+frameCount));
  rotateY(radians(45));

  doLights();
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      translate(i*unit-j*unit,0,i*unit+j*unit);
      box(unit,someV(i,j),unit);
      popMatrix();
    }
  }
}
float someV(int i, int j){
  return abs(sin(i*TWO_PI/cols+radians(2*frameCount))*cos(j*TWO_PI/rows+radians(frameCount)))*unit;
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0, 0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
