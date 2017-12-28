Puppet puppet;

void setup(){
  size(400,400,P3D);
  puppet = new Puppet();
}
void draw(){
  puppet.update();
  background(0);
  //ortho();
  //lights();
  translate(width/2,height/2);doLights();
  rotateX(-radians(15));
  rotateY(radians(45+1*frameCount*0.5));
  rotateZ(PI+radians(frameCount*0.1));
  //doLights();
  noStroke();
  puppet.draw();
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
