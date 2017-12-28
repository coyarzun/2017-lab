int cols, rows;
float radius, dlong, dlat;

void setup(){
  size(400,400,P3D);
  cols = 72; rows = cols/2;
  radius = 2*width;
  dlong = TWO_PI/float(cols);
  dlat  = PI/float(rows);
}
void draw(){
  background(0);
  translate(width/2,height/2);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*dlong);
      rotateX(-PI+j*dlat);
      translate(radius,0,0);
      box(80);
      popMatrix();
    }
  }
}
