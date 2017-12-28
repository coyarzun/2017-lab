Puppet[] puppet;
PVector[] pos;
boolean doLights, doXart, doYart, doZart, doSpinY, doSpinZ, doInvert,doOrtho;

void setup(){
  //size(800,400,P3D);
  size(displayWidth,displayHeight,P3D);
  puppet = new Puppet[400];
  pos    = new PVector[puppet.length];
  for(int i=0; i<puppet.length; i++){
    puppet[i] = new Puppet();
    pos[i] = new PVector(random(-width/2,width/2),
    random(-width/2,width/2),
    random(-width/2,width/2)
    );
  }
}
void draw(){
  for(int i=0; i<puppet.length; i++){
    puppet[i].update();
  }
  background(0);
  if(doOrtho)ortho();
  else perspective();
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
  for(int i=0; i<puppet.length; i++){
    pushMatrix();
    translate(pos[i].x,pos[i].y,pos[i].z);
    puppet[i].draw();
    popMatrix();
  }
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
  if(key=='r'){for(int i=0; i<puppet.length; i++)puppet[i].reset();}
  if(key=='t'){for(int i=0; i<puppet.length; i++)puppet[i].randomize();}
  if(key=='a'){doSpinY=!doSpinY;}
  if(key=='s'){doSpinZ=!doSpinZ;}
  if(key=='d'){doInvert=!doInvert;}
  if(key=='f'){doOrtho=!doOrtho;}
  
}

