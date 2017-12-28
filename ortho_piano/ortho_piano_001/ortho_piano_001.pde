Piano piano;
boolean doLights, doSpinY, doSpinZ, doOrtho;

void setup(){
  size(400,400,P3D);
  piano = new Piano();
}
void draw(){
  background(196);
  if(doOrtho)
  ortho();
  else perspective();
  translate(width/2,height/2);
  
  rotateX(-radians(15));
  rotateY(radians(45));
  if(doSpinY)rotateY(radians(1*frameCount*0.5));
  if(doSpinZ)rotateZ(radians(frameCount*0.1));
  
  if(doLights)doLights();
  piano.draw();
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
void keyPressed(){
  if(key=='l'){doLights=!doLights;}
  if(key=='y'){doSpinY=!doSpinY;}
  if(key=='z'){doSpinZ=!doSpinZ;}
  if(key=='o'){doOrtho=!doOrtho;}
}
