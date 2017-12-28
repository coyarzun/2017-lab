boolean doLights,doOrtho,doAlpha,doBlink;
int cols, rows;
float radius, dlong, dlat;

void setup(){
  size(800,400,P3D);
  cols = 72/2; rows = 2*cols;
  dlong = TWO_PI/float(cols);
  dlat  = TWO_PI/float(rows);
}
void draw(){
  
  radius = (2+0.05*sin(radians(frameCount)))*2*width;

  
  
  background(0);
  if(doOrtho)ortho();else perspective();
  translate(width/2,height/2);
  
  
  noStroke();
  fill(255,(doAlpha?64:255));
  rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  
  if(doLights)doLights();
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*dlong);
      rotateZ(-PI+j*dlat);
      translate(radius,0,0);
      //box(8,dlat*radius,dlong*radius);
      scale(1.0,dlat*radius,dlong*radius);
      rotateX(PI/4);
      box(1.0*sqrt(0.5));
      scale((0.5));
      //
      box(1000,0.2,0.2);
      popMatrix();
    }
  }
  if(doBlink)doLights=!doLights;
}
void keyPressed(){
  if(key=='l'){doLights=!doLights;}
  if(key=='o'){doOrtho=!doOrtho;}
  if(key=='a'){doAlpha=!doAlpha;}
  if(key=='b'){doBlink=!doBlink;}
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
