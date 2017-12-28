Puppet puppet;
boolean doLights, doXart, doYart, doZart, doSpinY, doSpinZ, doInvert;

void setup(){
  size(400,400,P3D);
  puppet = new Puppet();
}
void draw(){
  puppet.update();
  background(0);
  //ortho();
  //lights();
  translate(width/2,height/2);
  if(doLights)doLights();
  rotateX(-radians(15));
  rotateY(radians(45));//
  if(doSpinY)rotateY(radians(1*frameCount*0.5));
  if(doInvert)rotateZ(PI);
  if(doSpinZ)rotateZ(radians(frameCount*0.1));
  //doLights();
  noStroke();
  puppet.draw();
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
void keyPressed(){
  
  if(key=='l'){doLights=!doLights;}
  if(key=='q'){doXart=!doXart;}
  if(key=='w'){doYart=!doYart;}
  if(key=='e'){doZart=!doZart;}
  if(key=='r'){puppet.reset();}
  if(key=='a'){doSpinY=!doSpinY;}
  if(key=='s'){doSpinZ=!doSpinZ;}
  if(key=='d'){doInvert=!doInvert;}
  
}

