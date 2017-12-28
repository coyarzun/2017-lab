import processing.video.*;

PGraphics pg;
PShader shader;
PImage  curves, xcurves;
Boolean usexShader = true,  useShader = true, blinkShader = true, dowiros = true;

PImage wiros;

Movie video;
float videoAspectRatio;

void setup() {
  size(320*2, 240, P3D);
  //size(1024,512,P3D);
  //size(displayWidth,displayHeight,P3D);
  shader   = loadShader("ccShader_003.glsl");doCurves();
  pg = createGraphics(width, height, P3D);
  wiros = loadImage("wiros_600x600.jpg");
  video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/incredibleAmateurs - Pornhub.com.mp4");//Hands Free Blowjob! Sexy Snapchat Saturday - March 5th 2016 .mp4");//Morning Sex - Pornhub.com.mp4");//
  video.loop();
  video.speed(0.5);
  videoAspectRatio = video.width/video.height;
}
void draw() {

  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*0.005));//millis()));
  shader.set("textureMap", usexShader?xcurves:curves);


  
  background(196);
  //image(0, 0, 0, width, height);
  
  
  
  if(useShader)
  shader(shader);
  
  else resetShader();
  image(dowiros?wiros:video, 0, 0, width, height);
  if(blinkShader)usexShader=!usexShader;
  
  
  resetShader();
  image(dowiros?wiros:video, 8, 8, width/3, (height/3)/videoAspectRatio);
}
void movieEvent(Movie m) {
  m.read();
}
void keyPressed(){
  if(key=='z')useShader=!useShader;
  if(key=='x')usexShader=!usexShader;
  if(key=='c')doCurves();
  if(key=='b')blinkShader=!blinkShader;
  if(key=='m')dowiros=!dowiros;
  if(key=='j')video.jump(random(video.duration()));
}
void doCurves(){
  curves       = createImage(256, 256, RGB);//loadImage("_curves/curve_001_updownz.png");//baseTexture.jpg");
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      //curves.set(i,j,color(map(i,0,curves.width,0,255)));///(j+1)));
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*32)%256, random(256)));//,255,255));///(j+1)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;//+100;
      //float v  = map(i, 0, curves.width, 0, 256);//+100;
      curves.set(i, j, color(v));//,255,255));//255));///(j+1)));
    }
  }
}
