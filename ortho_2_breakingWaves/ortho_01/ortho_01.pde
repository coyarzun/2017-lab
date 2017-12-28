void setup(){
  size(200,200,P3D);
}
void draw(){
  noStroke();
  ortho();
  translate(width/2,height/2);
  rotateX(-radians(45));
  rotateY(radians(45));
  lights();
  box(50);
}
