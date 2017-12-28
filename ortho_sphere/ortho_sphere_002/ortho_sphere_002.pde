int cols, rows;
float radius, dlong, dlat;

void setup(){
  size(400,400,P3D);
  cols = 72/2; rows = 2*cols;
  radius = 2*width;
  dlong = TWO_PI/float(cols);
  dlat  = TWO_PI/float(rows);
}
void draw(){
  background(0);
  translate(width/2,height/2);
  rotateX(radians(frameCount));
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*dlong);
      rotateZ(-PI+j*dlat);
      translate(radius,0,0);
      box(40);
      popMatrix();
    }
  }
}
