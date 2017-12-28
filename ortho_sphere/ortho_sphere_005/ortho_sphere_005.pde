boolean doLights,doOrtho,doAlpha;
int cols, rows;
float radius, dlong, dlat;

void setup(){
  size(400,400,P3D);
  cols = 72/2; rows = 2*cols;
  radius = 2*width;
  dlong = TWO_PI/float(cols);
  dlat  = TWO_PI/float(rows);
}
void draw(){
  background(0);
  if(doOrtho)ortho();else perspective();
  translate(width/2,height/2);
  
  if(doLights)doLights();
  noStroke();
  fill(255,(doAlpha?64:255));
  rotateX(radians(frameCount));
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*dlong);
      rotateZ(-PI+j*dlat);
      translate(radius,0,0);
      box(40,40,180);
      popMatrix();
    }
  }
}
void keyPressed(){
  if(key=='l'){doLights=!doLights;}
  if(key=='o'){doOrtho=!doOrtho;}
  if(key=='a'){doAlpha=!doAlpha;}
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
