Puppet puppet;

void setup(){
  size(400,400,P3D);
  puppet = new Puppet();
}
void draw(){
  puppet.update();
  background(196);
  //ortho();
  translate(width/2,height/2);
  rotateX(-radians(15));
  rotateY(radians(45+frameCount));
  //rotateZ(PI);
  puppet.draw();
}
