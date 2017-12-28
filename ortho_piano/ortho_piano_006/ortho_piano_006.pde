float   unit = 2;
Piano[] pianos;
PVector[] pos, angles;
boolean doLights, doSpinY, doSpinZ, doOrtho;

void setup(){
  size(800,400,P3D);
  //piano = new Piano();
  pianos = new Piano[100];//
  pos    = new PVector[pianos.length];
  angles = new PVector[pianos.length];
  for(int i=0; i<pianos.length; i++){
    pianos[i] = new Piano(int(random(88)));
    pos[i]    = new PVector(random(-width/2,width/2), 
    0,//random(-width/2,width/2),
    random(-width/2,width/2));
    angles[i]  = new PVector(random(TWO_PI), 
    random(TWO_PI),
    random(TWO_PI));
  }
}
void draw(){
  //if(frameCount%10==0)piano = new Piano(int(random(88)));
  background(0);
  if(doOrtho)
  ortho();
  else perspective();
  translate(width/2,height/2);
  
  rotateX(-radians(15));
  //rotateY(radians(45));
  
  if(doLights)doLights();
  if(doSpinY)rotateY(radians(1*frameCount*0.5));
  //if(doSpinZ)rotateZ(radians(frameCount*0.1));
  
  for(int i=0; i<pianos.length; i++){
    pushMatrix();
    translate(pos[i].x, pos[i].y, pos[i].z);
    rotateX(angles[i].x);rotateY(angles[i].y);rotateZ(angles[i].z);
    pianos[i].draw();
    popMatrix();
  }
  
  translate(0,1000,0);fill(0);
  box(2000+20*sin(radians((doLights?2:4)*frameCount)));
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
