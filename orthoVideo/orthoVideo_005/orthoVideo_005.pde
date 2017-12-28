import ddf.minim.*;
import processing.video.*;
Minim minim;
AudioInput in;

boolean doOrtho, ytrans, doBlink, doCycle,doInv;
float   unit;
int     rows, cols, wlight;
float[][] buffer;


Movie[]     video;
PImage      videoInterBuffer;

void setup() {
  size(400, 400, P3D);
  unit = 3;   
  cols = 64;//5*2*2*2*2; 
  rows = 2*cols;//1*(cols+2)/2;
  buffer = new float[cols][rows];
  minim = new Minim(this);
  in = minim.getLineIn();
  
  videoInterBuffer = createImage(cols,rows,RGB);
  
  video = new Movie[urls.length];
    for(int i=0; i<video.length; i++){
    loadVideos(i);
  }
}
void loadVideos(int i){
  video[i]    = new Movie(this, urls[i]);
  video[i].loop();
}
PImage vv;
void movieEvent(Movie m) {
  m.read();
}
void draw() {
  doBuffer();
  background(0);
  noStroke();
  if (doOrtho)ortho();
  else perspective();
  translate(width/2,height/2);
  //translate(0, height/2, -width/2);
  float unitt = unit*sqrt(2);
  translate(- unitt*cols/2, - unitt*rows/2+32, -width/2);
  rotateX(-radians(90-30));
  rotateY(radians(45));
  doLights();
  pushMatrix();
  
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      pushMatrix();
      translate(i*unit-j*unit, 0, i*unit+j*unit);
      box(unit, someV(i, j), unit);
      popMatrix();
    }
  }
  popMatrix();
  //if (doBlink)ytrans=!ytrans;
  //wich++; wich%=urls.length;
}
void doBuffer() {
  videoInterBuffer.copy(video[wich],0,0,video[wich].width,video[wich].height,0,0,videoInterBuffer.width,videoInterBuffer.height);
  /*for (int i=0; i<cols; i++) {
    buffer[i][0] = in.left.get(i);//random(1.0);
    for (int j=rows; j>1; j--) {
      buffer[i][j-1] = buffer[i][j-2];
    }
  }*/
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      buffer[i][j] = map(brightness(videoInterBuffer.pixels[j*cols+i]),0,255,0,1);
      //map(pow(brightness(videoInterBuffer.pixels[j*cols+i]),2),0,255*255,0,1);//j*rows+i
    }
  }
}
void resetBuffer() {
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      buffer[i][j]=0;
    }
  }
}
float someV(int i, int j) {
  //return abs(20*sin(i*TWO_PI/cols+radians(2*frameCount))*cos(j*TWO_PI/rows+radians(frameCount)))*unit;
  if(doInv) return unit*16*4*2*(1-buffer[i][j]);
  else return unit*16*4*2*buffer[i][j];
}
void doLights() {
  if (doCycle) {
    if (frameCount%3==0) {
      directionalLight( 255, 0, 0, 1, 0, 0);
      directionalLight(   0, 255, 0, 0, 1, 0);
      directionalLight(   0, 0, 255, 0, 0, -1);
    } else if (frameCount%3==1) {
      directionalLight(   0, 0, 255, 1, 0, 0);
      directionalLight( 255, 0, 0, 0, 1, 0);
      directionalLight(   0, 255, 0, 0, 0, -1);
    } else {
      directionalLight(   0, 255, 0, 1, 0, 0);
      directionalLight(   0, 0, 255, 0, 1, 0);
      directionalLight( 255, 0, 0, 0, 0, -1);
    }
  }else{
    if (wlight==0) {
      directionalLight( 255, 0, 0, 1, 0, 0);
      directionalLight(   0, 255, 0, 0, 1, 0);
      directionalLight(   0, 0, 255, 0, 0, -1);
    } else if (wlight==1) {
      directionalLight(   0, 0, 255, 1, 0, 0);
      directionalLight( 255, 0, 0, 0, 1, 0);
      directionalLight(   0, 255, 0, 0, 0, -1);
    } else {
      directionalLight(   0, 255, 0, 1, 0, 0);
      directionalLight(   0, 0, 255, 0, 1, 0);
      directionalLight( 255, 0, 0, 0, 0, -1);
    }
  }
}
void keyPressed() {
  if (key=='c')doCycle=!doCycle;
  if (key=='v'){wich++;wich%=urls.length;}
  if (key=='b')doBlink=!doBlink;
  if (key=='y')ytrans=!ytrans;
  if (key=='o')doOrtho=!doOrtho;
  if (key=='i')doInv=!doInv;
  if (key=='r')resetBuffer();
  if (key=='l'){wlight++;wlight%=3;}
  if (key=='j')video[wich].jump(random(video[wich].duration()));
}

int         wich = 0;

String[]  urls = {
  "/Users/coyarzun/Documents/Processing/2017_unnamed/seashore_001/data/Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4",
  //"/Users/coyarzun/ima/recreative/porn/4jWhatsapp/WhatsApp Video 2017-09-01 at 19.20.35.mp4"
  "/Users/coyarzun/ima/recreative/porn/4jWhatsapp/WhatsApp Video 2017-08-24 at 21.04.12.mp4"
  //"/Users/coyarzun/ima/recreative/porn/kalie69_riding my dildo to perfection - Pornhub.com.mp4",
  //"/Users/coyarzun/ima/recreative/porn/planesgirl_Please Get Me Pregnant - Pornhub.com.mp4",
  //"/Users/coyarzun/ima/recreative/porn/miaRand_dance short - Pornhub.com.mp4",
  //"/Users/coyarzun/ima/recreative/porn/Anisyia Livejasmin doggy ANAL and nasty ATM blowjob - Pornhu.mp4",
  //"/Users/coyarzun/ima/recreative/porn/Chasey Lain - Wicked as she Seems - Pornhub.com.mp4"
  };
