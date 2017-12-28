boolean doLights,doOrtho;

void setup(){
  size(400,400,P3D);
}
void draw(){
  background(0);
  if(doOrtho)ortho();else perspective();
  translate(width/2,height/2);
  
  
  
  noStroke();
  fill(255);
  rotateX(-radians(15));
  rotateY(radians(45));
  
  if(doLights)doLights();
  
  box(100);
}
void keyPressed(){
  if(key=='l'){doLights=!doLights;}
  if(key=='o'){doOrtho=!doOrtho;}
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
