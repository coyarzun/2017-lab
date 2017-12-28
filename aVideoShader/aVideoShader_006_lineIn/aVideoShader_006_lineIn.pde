import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

PGraphics pg;
PShader   shader;
PImage    curves, xcurves;
Boolean   usexShader = true,  useShader = true, blinkShader = false, dowiros = true;

PImage    wiros;


Movie[]     video;
float[]     videoAspectRatio;
int         wich = 0;

void setup() {
  //size(1024,512,P3D);
  size(512, 256, P3D);//
  //size(displayWidth,displayHeight,P3D);
  //doCurves();
  pg       = createGraphics(width, height, P3D);
  wiros    = loadImage("wiros_600x600.jpg");
  video = new Movie[urls.length];
  videoAspectRatio = new float[urls.length];
  for(int i=0; i<video.length; i++){
    loadVideos(i);
  }
  minim = new Minim(this);
  in = minim.getLineIn();
}
void loadVideos(int i){
  video[i]    = new Movie(this, urls[i]);
  video[i].loop();
}
void draw() {
  
  videoAspectRatio[wich] = video[wich].width/float(video[wich].height);
  
  doCurves(abs(in.left.get(0)));
  shader   = loadShader("ccShader_006.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*0.805));
  shader.set("textureMap", curves);

  background(196); 
  
  shader(shader);
  
  image(video[wich], 0, 0, width, height);
  
  //resetShader();
  //image(dowiros?wiros:video[wich], 8, 8, /*width/3*/ 48, /*(width/3)*/48/videoAspectRatio[wich]);
}
void movieEvent(Movie m) {
  m.read();
}
void keyPressed(){
  //if(key=='z')useShader=!useShader;
  //if(key=='x')usexShader=!usexShader;
  //if(key=='c')doCurves();
  //if(key=='b')blinkShader=!blinkShader;
  //if(key=='m')dowiros=!dowiros;
  if(key=='j')video[wich].jump(random(video[wich].duration()));
  if(key=='l')jumpTo();
}
void jumpTo(){
  wich = int(random(urls.length));
}
void doCurves(float aa){
  aa*=30.0;
  curves       = createImage(256, 1, RGB);
  xcurves      = createImage(256, 1, RGB);
  
  for (int i=0; i<curves.width; i++) {
      xcurves.set(i, 0, color(random(256), map(i, 0, curves.width, 0, 255*32)%256, random(256)));
      float v  = map(i*i*aa, 0, curves.width*curves.width, 0, 256)%256;
      //audio sensitive
      curves.set(i, 0, color(v));
  }
}





String[]  urls = {
  "/Users/coyarzun/Documents/Processing/2017_unnamed/seashore_001/data/Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4",
  //"/Users/coyarzun/ima/recreative/porn/kawaii_girl_01 - Pornhub.com.mp4",
  //"/Users/coyarzun/ima/recreative/porn/kawaii_girl_02 - Pornhub.com.mp4"
  //"/Users/coyarzun/ima/recreative/porn/kawaii_girl_03 - Pornhub.com.mp4"
  //
  //"/Users/coyarzun/ima/recreative/porn/Cherry Crush Hentai Kitty Compilation - Masturbation Anal fu.mp4"
  //"/Users/coyarzun/ima/recreative/porn/kawaii_girl_04 - Pornhub.com.mp4"
  };
