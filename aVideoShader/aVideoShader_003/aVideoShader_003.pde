import processing.video.*;

PGraphics pg;
PShader   shader;
PImage    curves, xcurves;
Boolean   usexShader = true,  useShader = true, blinkShader = false, dowiros = true;

PImage    wiros;


Movie[]     video;
float[]     videoAspectRatio;
int         wich = 0;

void setup() {
  //size(1024, 512, P3D);//
  size(displayWidth,displayHeight,P3D);
  doCurves();
  pg       = createGraphics(width, height, P3D);
  wiros    = loadImage("wiros_600x600.jpg");
  video = new Movie[urls.length];
  videoAspectRatio = new float[urls.length];
  for(int i=0; i<video.length; i++){
    loadVideos(i);
  }
}
void loadVideos(int i){
  video[i]    = new Movie(this, urls[i]);
  video[i].loop();
}
void draw() {
  videoAspectRatio[wich] = video[wich].width/float(video[wich].height);
  
  shader   = loadShader("ccShader_004.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*0.005));
  shader.set("textureMap", usexShader?xcurves:curves);

  background(196); 
  if(useShader)
  shader(shader);
  else resetShader();
  image(dowiros?wiros:video[wich], 0, 0, width, height);
  if(blinkShader)usexShader=!usexShader;
  resetShader();
  //image(dowiros?wiros:video[wich], 8, 8, /*width/3*/ 48, /*(width/3)*/48/videoAspectRatio[wich]);
}
void movieEvent(Movie m) {
  m.read();
}
void keyPressed(){
  if(key=='z')useShader=!useShader;
  if(key=='x')usexShader=!usexShader;
  if(key=='c')doCurves();
  //if(key=='b')blinkShader=!blinkShader;
  if(key=='m')dowiros=!dowiros;
  if(key=='j')video[wich].jump(random(video[wich].duration()));
  if(key=='l')jumpTo();
}
void jumpTo(){
  wich = int(random(urls.length));
}
void doCurves(){
  curves       = createImage(256, 256, RGB);
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*32)%256, random(256)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;
      curves.set(i, j, color(v));
    }
  }
}





String[]  urls = {
  "/Users/coyarzun/Documents/Processing/2017_unnamed/seashore_001/data/Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4"
  /*
  "/Users/coyarzun/ima/recreative/porn/Big Boobs ITALIAN CONFESSION - Pornhub.com.mp4",
    "/Users/coyarzun/ima/recreative/porn/incredibleAmateurs - Pornhub.com.mp4",
    "/Users/coyarzun/ima/recreative/porn/Elle baise en gros - Pornhub.com.mp4",
    "/Users/coyarzun/ima/recreative/porn/Blowjob and ride leads to Huge cumshot - Pornhub.com.mp4"*/
  };
