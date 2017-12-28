float   unit;
int     rows, cols;

void setup(){
  size(200,200,P3D);
  unit = 32;   cols = 5; rows = cols+2;
}
void draw(){
  background(0);
  noStroke();
  ortho();
  //translate(width/2,height/2);
  rotateX(-radians(45));//+frameCount));
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
  return random(10)*unit;
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0, 0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
