class Scene implements TouchOSC {
  boolean glitcheable;
  boolean hold;

  float tempo;

  boolean reflectH, reflectV;
  boolean onStage;

  float gain;
  boolean hatDetect, snareDetect, kickDetect, beatHit;

  float xOff, yOff;
  float zoom, opacity;

  float rotX, rotY, rotZ, yOffset, zOffset;

  float minHue, maxHue, sat;
  boolean cycle, shine;

  float dotSize, lineLength;
  boolean showLine, showDot;

  boolean invertOn;

  PGraphics pg;
  PGraphics lens;
  PImage    oSB;

  Scene() {
  }
  Scene(int w, int h) {
    pg   = createGraphics(w, h, P3D);
    lens = createGraphics(w, h, P3D);
    oSB = new PImage(w, h, ARGB);
    pg.colorMode(HSB);
  }
  void draw() {
    if (onStage) {
      pg.beginDraw();
      pg.background(255);//0);//random(255),255,255);
      doCamera();
      customize();
      if(invertOn)pg.filter(INVERT);
      pg.endDraw();
      doLens();
      if (glitcheable) doGlitch();
    }
  }
  void customize() {
    pg.rectMode(CENTER);
    pg.noStroke();
    pg.fill(minHue, sat, 255);
    pg.rect(0, 0, pg.width/2, pg.height/2);
  }
  void doCamera() {
    pg.translate(pg.width/2, pg.height/2);
    pg.scale(pow(2, 3*zoom));
    pg.translate(xOff, yOff);
    pg.rotateX(rotX);
    pg.rotateY(rotY);
    pg.rotateZ(rotZ);
    pg.translate(0, yOffset, zOffset);
  }
  void doLens() {
    //beginDraw();
    //background(0,0);
    textureMode(NORMAL);
    if (!reflectH && !reflectV) {
      beginShape();
      noStroke();
      texture(pg);
      vertex(0, 0, 0, 0);
      vertex(width, 0, 1, 0);
      vertex(width, height, 1, 1);
      vertex(0, height, 0, 1);
      endShape(CLOSE);
    }
    else if (reflectH && reflectV) {
      beginShape();
      noStroke();
      texture(pg);
      vertex(0, 0, 0, 0);
      vertex(width/2, 0, .5, 0);
      vertex(width/2, height/2, .5, .5);
      vertex(0, height/2, 0, .5);
      endShape(CLOSE);

      beginShape();
      noStroke();
      texture(pg);
      vertex(width/2, 0, 0.5, 0);
      vertex(width, 0, 0, 0);
      vertex(width, height/2, 0, .5);
      vertex(width/2, height/2, 0.5, .5);
      endShape(CLOSE);

      beginShape();
      noStroke();
      texture(pg);
      vertex(0, height/2, 0, 0.5);
      vertex(width/2, height/2, 0.5, 0.5);
      vertex(width/2, height, 0.5, 0);
      vertex(0, height, 0, 0);
      endShape(CLOSE);

      beginShape();
      noStroke();
      texture(pg);
      vertex(width/2, height/2, 0.5, 0.5);
      vertex(width, height/2, 0, 0.5);
      vertex(width, height, 0, 0);
      vertex(width/2, height, 0.5, 0);
      endShape(CLOSE);
    }
    else if (reflectH) {
      beginShape();
      noStroke();
      texture(pg);
      vertex(0, 0, 0, 0);
      vertex(width/2, 0, .5, 0);
      vertex(width/2, height, .5, 1);
      vertex(0, height, 0, 1);
      endShape(CLOSE);

      beginShape();
      noStroke();
      texture(pg);
      vertex(width/2, 0, 0.5, 0);
      vertex(width, 0, 0, 0);
      vertex(width, height, 0, 1);
      vertex(width/2, height, 0.5, 1);
      endShape(CLOSE);
    }
    else {
      beginShape();
      noStroke();
      texture(pg);
      vertex(0, 0, 0, 0);
      vertex(width, 0, 1, 0);
      vertex(width, height/2, 1, 0.5);
      vertex(0, height/2, 0, 0.5);
      endShape(CLOSE);

      beginShape();
      noStroke();
      texture(pg);
      vertex(0, height/2, 0, 0.5);
      vertex(width, height/2, 1, 0.5);
      vertex(width, height, 1, 0);
      vertex(0, height, 0, 0);
      endShape(CLOSE);
    }    
    //endDraw();
  }
  void doGlitch() {
    //do some interesting here
    float aux = random(100)>50? -1 : 1;
    int shiftH = 0;//(int)random(-width/2,width/2);//int(   (width/2)*aux*abs(in.left.get(0)));//-10;
    int shiftV = int(   (height/2)*aux*abs(in.left.get(0)));//0;//int(   (width/2)*aux*abs(in.left.get(0)));;//int(100*in.right.get(0));//-10;
    loadPixels();
    for (int i=0;i<pixels.length;i++) {
          int x = i%width;
          int y = (i-x)/width;
          int shift = shiftH+shiftV*width;
          int shiftedPosition = (pixels.length+i-shift)%pixels.length;
          pixels[i] = pixels[shiftedPosition];
    }
    updatePixels();
  } 
  void setGlitch(float v) {        
    glitcheable = v==1.0;
  }
  void setTempo(float v) {        
    tempo       = v;
  }
  void setHold(float v) {        
    hold        = v==1.0;
  }
  void setFlipH(float v) {        
    reflectH    = v==1.0;
  }
  void setFlipV(float v) {        
    reflectV    = v==1.0;
  }
  void setOnStage(float v) {        
    onStage     = v==1.0;
  }

  void setGain(float v) {     
    gain = v;
  }
  void setHatDetect(float v) {     
    hatDetect = v==1.0;
  }
  void setSnareDetect(float v) {     
    snareDetect = v==1.0;
  }
  void setKickDetect(float v) {     
    kickDetect = v==1.0;
  }
  void setBeatHit(float v) {     
    beatHit = v==1.0;
  }

  void setOffset(float x, float y) {    
    xOff    = map(x, 0, 1, -pg.width/2, pg.width/2); 
    yOff = map(y, 0, 1, -pg.height/2, pg.height/2);
  }
  void setZoom(float v) {    
    zoom    = v;
  }//map(v,0,1,0,4);  }
  void setBrightness(float v) {    
    opacity = map(v, 0, 1, 0, 255);
  }

  void setRotX(float v) {    
    rotX    = map(v, 0, 1, -PI, PI);
  }
  void setRotY(float v) {    
    rotY    = map(v, 0, 1, -PI, PI);
  }
  void setRotZ(float v) {    
    rotZ    = map(v, 0, 1, -PI, PI);
  }
  void setYoff(float v) {    
    yOffset = map(v, 0, 1, -pg.height, pg.height);
  }
  void setZoff(float v) {    
    zOffset = map(v, 0, 1, 0, -pg.height);
  }

  void setMinHue(float v) {    
    minHue = map(v, 0, 1, 0, 255);
  }
  void setMaxHue(float v) {    
    maxHue = map(v, 0, 1, 0, 255);
  }
  void setSaturation(float v) {    
    sat    = map(v, 0, 1, 0, 255);
  }
  void setCycle(float v) {    
    cycle  = v==1.0;
  }
  void setShine(float v) {    
    shine  = v==1.0;
  }

  void setDotSize(float v) {        
    dotSize    = map(v, 0, 1, 1, 32);
  }
  void setLineLength(float v) {        
    lineLength = map(v, 0, 1, 4, 1000);
  }
  void setShowLine(float v) {        
    showLine   = v==1.0;
  }
  void setShowDot(float v) {        
    showDot    = v==1.0;
  }
  void setInvertMode(float v){
    invertOn   = v==1.0;
  }
}

public interface TouchOSC {
  void draw();
  void customize();
  void doCamera();
  void doLens();
  void doGlitch();
  void setGlitch(float v);
  void setTempo(float v) ;
  void setHold(float v)  ;
  void setFlipH(float v)   ;
  void setFlipV(float v)   ;
  void setOnStage(float v) ;

  void setGain(float v);
  void setHatDetect(float v)  ;
  void setSnareDetect(float v);
  void setKickDetect(float v) ;
  void setBeatHit(float v)    ;

  void setOffset(float x, float y);
  void setZoom(float v)           ;
  void setBrightness(float v)     ;

  void setRotX(float v);
  void setRotY(float v);
  void setRotZ(float v);
  void setYoff(float v);
  void setZoff(float v);

  void setMinHue(float v);
  void setMaxHue(float v);
  void setSaturation(float v);
  void setCycle(float v)       ;
  void setShine(float v)       ;

  void setDotSize(float v)   ;
  void setLineLength(float v);
  void setShowLine(float v)    ;
  void setShowDot(float v)     ;
}



