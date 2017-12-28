import ddf.minim.*;
Minim minim;
AudioInput in;

boolean doOrtho, ytrans, doBlink;
float   unit;
int     rows, cols;
float[][] buffer;

void setup(){
  size(800,400,P3D);
  unit = 8;   cols = 5*2*2*2*2; rows = 1*(cols+2)/2;
  buffer = new float[cols][rows];
  minim = new Minim(this);
  in = minim.getLineIn();
}
void draw(){
  doBuffer();
  background(0);
  noStroke();
  if(doOrtho)ortho();else perspective();
  translate(0,height/2,-width/2);
  rotateX(-radians(15));
  rotateY(radians(45));

  doLights();
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      translate(i*unit-j*unit,ytrans?-j*unit:0,i*unit+j*unit);
      box(unit,someV(i,j),unit);
      popMatrix();
    }
  }
  
  if(doBlink)ytrans=!ytrans;
}
void doBuffer(){
  for(int i=0; i<cols; i++){
    buffer[i][0] = in.left.get(i);//random(1.0);
    for(int j=rows; j>1; j--){
      buffer[i][j-1] = buffer[i][j-2];
    }
  }
}
void resetBuffer(){
  for(int i=0; i<cols; i++){for(int j=0; j<rows; j++){buffer[i][j]=0;}}
}
float someV(int i, int j){
  //return abs(20*sin(i*TWO_PI/cols+radians(2*frameCount))*cos(j*TWO_PI/rows+radians(frameCount)))*unit;
  return unit*16*buffer[i][j];
}
void doLights(){
  directionalLight( 255,   0,   0, 1, 0, 0);
  directionalLight(   0, 255,   0, 0, 1, 0);
  directionalLight(   0,   0, 255, 0, 0,-1);
}
void keyPressed(){
  if(key=='b')doBlink=!doBlink;
  if(key=='y')ytrans=!ytrans;
  if(key=='o')doOrtho=!doOrtho;
  if(key=='r')resetBuffer();
}
