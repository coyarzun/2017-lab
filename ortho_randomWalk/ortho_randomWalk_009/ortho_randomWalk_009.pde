float   unit;
int cols, rows, zcols;
int wichView, colorMood;
boolean doSpin, doScaleUnit;

void setup(){
  size(800,400,P3D);
  cols = 32; rows = 32; zcols = 32;
}
void draw(){
  if(doScaleUnit)unit = 16;else unit = 8;
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
  strokeWeight(2);
  beginShape(POINTS);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      for(int k=0; k<cols; k++){
        if(colorMood==0)
          stroke(255);
        else if(colorMood==1){
          stroke(0,255,0);
        }else{
          stroke(map(i,0,cols,0,255), map(j,0,rows,0,255), map(k,0,zcols,0,255));
        }
        vertex(i*unit, j*unit, k*unit);
      } 
    }
  }
  endShape();
  popMatrix();
}

void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}

void keyPressed(){
  if(key=='v'){wichView++;wichView%=4;}
  if(key=='s'){doSpin=!doSpin;}
  if(key=='z'){doScaleUnit=!doScaleUnit;}
  if(key=='c'){colorMood++;colorMood%=3;}
}
