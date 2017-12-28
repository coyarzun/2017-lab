TrailParticle[] trail;
boolean doLights,doOrtho;

void setup(){
  //size(800,400,P3D);
  size(displayWidth,displayHeight,P3D);
  trail= new TrailParticle[20];
  for(int i=0; i<trail.length; i++){
  trail[i]= new TrailParticle(new PVector(0,0,0));
  }
  
}
void draw(){
  for(int i=0; i<trail.length; i++){
    trail[i].update();
  }
  
  
  background(0);
  if(doOrtho)ortho();else perspective();
  translate(width/2,height/2);
  
  rotateX(radians(45+30+15));
  translate(0,-trail[0].pos.y-height/4,0);
  
  pushMatrix();
  
  rotateZ(radians(frameCount));
  if(doLights)doLights();
  popMatrix();
  
  for(int i=0; i<trail.length; i++){
  trail[i].draw();
  }
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

