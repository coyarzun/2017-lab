TrailParticle[] trail;
boolean doLights;

void setup(){
  size(400,400,P3D);
  trail= new TrailParticle[2];
  trail[0]= new TrailParticle(new PVector(0,0,0));
  trail[1]= new TrailParticle(new PVector(0,0,0));
}
void draw(){
  trail[0].update();
  trail[1].update();
  
  background(0);
  translate(width/2,height/2);
  
  rotateX(radians(45+30));
  translate(0,-trail[0].pos.y-height/4,0);
  
  pushMatrix();
  
  rotateZ(radians(frameCount));
  if(doLights)doLights();
  popMatrix();
  
  trail[0].draw();
  trail[1].draw();
}
void keyPressed(){
  if(key=='l'){doLights=!doLights;}
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}

