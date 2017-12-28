float   unit;
int cols, rows, zcols;
int wichView, colorMood;
boolean doSpin, doScaleUnit, boxMode, doGrid;
ThreeDeeWalker walker;

void setup(){
  size(800,400,P3D);
  cols = 8*4; rows = 8*4*2; zcols = 8*4;
  walker = new ThreeDeeWalker();
}
void draw(){
  if(doScaleUnit)unit = 16;else unit = 8;
  background(0);
  camera();
  translate(width/2,height/2);
  doView();
  //if(frameCount%2==0)
  //if(random(100)>30)
  if(doGrid)doGrid();
  //else{
  if(doLights)doLights();
  walker.update();
  walker.draw();
  if(doBlink)doLights=!doLights;
  //}
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
    rotateX(-radians(45));//+(doSpin?frameCount:0)));//));//+frameCount));
    rotateY(radians(45+(doSpin?frameCount:0)));
  }else if(wichView==3){
    perspective();
    rotateX(-radians(45));//+(doSpin?frameCount:0)));//));//
    rotateY(radians(45+(doSpin?frameCount:0)));//
  }else{
    beginCamera();
    //ortho();
    camera();
    translate(width/2,height/2);
    translate(-cols*unit/2,-rows*unit/2,-zcols*unit/2);
    translate(
    walker.paths.get(walker.paths.size()-1).sx*unit,
    walker.paths.get(walker.paths.size()-1).sy*unit,
    walker.paths.get(walker.paths.size()-1).sz*unit
    );
    rotateX(walker.paths.get(walker.paths.size()-1).tx);
    rotateY(walker.paths.get(walker.paths.size()-1).ty);
    rotateZ(walker.paths.get(walker.paths.size()-1).tz);
    /*
    walker.paths.get(walker.paths.size()-1).direction.x,
    walker.paths.get(walker.paths.size()-1).direction.y,
    walker.paths.get(walker.paths.size()-1).direction.z
    */
    
    endCamera();
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
boolean doLights,doBlink;
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}

void keyPressed(){
  if(key=='v'){wichView++;wichView%=5;}
  if(key=='s'){doSpin=!doSpin;}
  if(key=='z'){doScaleUnit=!doScaleUnit;}
  if(key=='c'){colorMood++;colorMood%=3;}
  if(key=='l'){doLights=!doLights;}
  if(key=='b'){doBlink=!doBlink;}
  if(key=='x'){boxMode=!boxMode;}
  if(key=='g'){doGrid=!doGrid;}
}
