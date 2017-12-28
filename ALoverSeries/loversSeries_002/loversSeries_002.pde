TrailParticle trail;

void setup(){
  size(400,400,P3D);
  trail = new TrailParticle(new PVector(0,0,0));
}
void draw(){
  trail.update();
  
  background(196);
  translate(width/2,height/2);
  rotateX(radians(45));
  translate(0,-trail.pos.y,0);
  trail.draw();
}
