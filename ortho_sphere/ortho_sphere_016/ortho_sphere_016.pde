boolean doLights,doOrtho,doAlpha,doBlink,doPolar;
boolean doRandomPolar,doBlinkInvert,doInvert,doRadiox;
boolean doSpinX, doSpinY;
//voolean
int cols, rows;
float radiors, radius, dlong, dlat;

void setup(){
  size(800,400,P3D);
  cols = 72/2; rows = 2*cols;
  dlong = TWO_PI/float(cols);
  dlat  = TWO_PI/float(rows);
}
void draw(){
  radiors = doRadiox?width/2:0.99*(2+0.05*sin(radians(frameCount)))*2*width; 
  

  
  
  background(0);
  if(doOrtho)ortho();else perspective();
  translate(width/2,height/2);
  
  if(doLights)doLights();
  
  noStroke();
  fill(255,(doAlpha?64:255));
  if(doSpinX)rotateX(radians(frameCount));
  if(doSpinY)rotateY(radians(frameCount));
  
  
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*dlong);
      rotateZ(-PI+j*dlat);
      translate(radius,0,0);
      //box(8,dlat*radius,dlong*radius);
      radius = radiors;
      if(doPolar)radius*= (1+cos(2*i*dlong+radians(frameCount*2)));
      scale(2.0,dlat*radius,dlong*radius);
      rotateX(PI/4);
      box(1.0*sqrt(0.5));
      scale((0.5));
      //
      box(100,0.2,0.2);
      popMatrix();
    }
  }
  if(doBlink)doLights=!doLights;
  if(doRandomPolar && random(100)>90)doPolar=!doPolar;
  if(doInvert)filter(INVERT);
  if(doBlinkInvert && frameCount%3==0)doInvert=!doInvert;
}
void keyPressed(){
  if(key=='l'){doLights=!doLights;}
  if(key=='o'){doOrtho=!doOrtho;}
  if(key=='a'){doAlpha=!doAlpha;}
  if(key=='b'){doBlink=!doBlink;}
  if(key=='p'){doPolar=!doPolar;}
  if(key=='r'){doRandomPolar=!doRandomPolar;}
  if(key=='i'){doInvert=!doInvert;}
  if(key=='v'){doBlinkInvert=!doBlinkInvert;}
  if(key=='g'){doRadiox=!doRadiox;}
  if(key=='z'){doSpinY=!doSpinY;}
  if(key=='x'){doSpinX=!doSpinX;}
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0 ,0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
