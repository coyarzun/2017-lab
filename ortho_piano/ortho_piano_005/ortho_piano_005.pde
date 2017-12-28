float   unit = 8;
Piano piano;
boolean doLights, doSpinY, doSpinZ, doOrtho;

void setup(){
  size(400,400,P3D);
  //piano = new Piano();
  piano = new Piano(int(random(88)));
}
void draw(){
  if(frameCount%10==0)piano = new Piano(int(random(88)));
  background(0);
  if(doOrtho)
  ortho();
  else perspective();
  translate(width/2,height/2);
  
  rotateX(-radians(45));
  rotateY(radians(45));
  
  if(doLights)doLights();
  if(doSpinY)rotateY(radians(1*frameCount*0.5));
  if(doSpinZ)rotateZ(radians(frameCount*0.1));
  
  
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
