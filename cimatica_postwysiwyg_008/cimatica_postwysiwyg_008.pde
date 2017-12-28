import java.awt.*;
import oscP5.*;
import netP5.*;
import ddf.minim.*;
import processing.video.*;
//import hypermedia.video.*;

ArrayList  mm;  // Declare MovieMaker ArrayList
int        movieIndex;
int        recframeIndex;
String     filename;

RenzOsc renzosc;

Minim minim;
AudioInput in;

VAmbient ambient;
Manager manager;

boolean recording;
PApplet p = this;
  
boolean scrollOn, halloesOn, innerOn, outLineOn, vertexOn, cycleOn;

int vthreshold;

void setup(){
  size(1280,512,P3D);
  colorMode(HSB);
  noCursor();
  ambient = new VAmbient();
  manager = new Manager();  
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  renzosc = new RenzOsc();
  //mm = new ArrayList();
  /*
  halloesOn = true;
  innerOn   = true;
  outLineOn = true;
  vertexOn  = true;
  cycleOn   = true;
  scrollOn  = false;  
  */
}

void draw(){
  background(255);
  manager.draw();
  /*
  if(recording && mm.size()>0){
    MovieMaker mmm = (MovieMaker)mm.get(movieIndex-1);
    mmm.addFrame(); 
    println("recording "+filename+" frame:"+recframeIndex);
    recframeIndex++;
  }
  */
  //filter(INVERT);
}
