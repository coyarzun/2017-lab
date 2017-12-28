float   unit;
int cols, rows, zcols;
int wichView;
boolean doSpin;

void setup(){
  size(800,400,P3D);
  unit = 16; 
  cols = 32; rows = 32; zcols = 32;
}
void draw(){
  background(0);
  translate(width/2,height/2);
  doView();
  doGrid();
}
void doView(){
  if(wichView==0){
    ortho();
    rotateY(radians(+(doSpin?frameCount:0)));
  }else if(wichView==1){
    perspective();
    rotateY(radians(+(doSpin?frameCount:0)));
  }else if(wichView==2){
    ortho();
    rotateX(-radians(45));//+frameCount));
    rotateY(radians(45+(doSpin?frameCount:0)));
  }else{
    perspective();
    rotateX(-radians(45));//
    rotateY(radians(45+(doSpin?frameCount:0)));
  }
}
void doGrid(){
  pushMatrix();
  translate(-cols*unit/2,-rows*unit/2,-zcols*unit/2);
  stroke(0,255,0);
  strokeWeight(2);
  beginShape(POINTS);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      for(int k=0; k<cols; k++){
        vertex(i*unit, j*unit, k*unit);
      } 
    }
  }
  endShape();
  popMatrix();
}
void keyPressed(){
  if(key=='v'){wichView++;wichView%=4;}
  if(key=='s'){doSpin=!doSpin;}
}
void xdraw(){
  noStroke();
  ortho();
  translate(width/2,height/2);

  rotateX(-radians(45));//+frameCount));
  rotateY(radians(45));
  //lights();
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
  pushMatrix();
  translate(0,-unit,0);
  box(unit);
  popMatrix();
  pushMatrix();
  translate(0,0,unit);
  box(unit);
  popMatrix();
  pushMatrix();
  translate(-unit,0,0);
  box(unit);
  popMatrix();
}
