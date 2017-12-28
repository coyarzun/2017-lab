class Manager {
  OscP5 oscP5;
  NetAddress myRemoteLocation;
  Scene[] scenes;

  boolean zqncer, zqnceAll;
  boolean invertOn;
  float   tempo;

  float opacity;
  int current;

  Manager() {
    setupScenes();
    setupOsc();
  }

  void draw(){
    background(255);//0);
    
    if(zqncer){
      current =  int((frameCount*tempo*10)%scenes.length);
       if(!zqnceAll){
         int xeks = 0;
         while(!scenes[current].onStage && xeks<scenes.length){
           current++;
           current%=scenes.length;
           xeks++;
         }
       }
    }else{
      current = -1;
      for(int i=0; i<scenes.length; i++){
        if(scenes[i].onStage){
          current = i;
          break;
        }
      }
    }

    if(current>=0)scenes[current].draw();
    /*
    for(int i=0; i<scenes.length; i++){
      scenes[i].draw();
    }
    */
    if(invertOn)filter(INVERT);
  }

  void setZqncer(float v) {    zqncer = v==1.0;  }
  void setTempo(float v)  {    tempo = v;  }
  void setOpacity(float v){    opacity = v;  }
  void zqnceAll(float v)  {    zqnceAll = v==1.0;  }
  void setInvertMode(float v) { invertOn = v==1.0; }
  
  void setupScenes() {
    scenes = new Scene[8];
    scenes[0] = new WindField(width,height);//VectorType(width,height);
    scenes[1] = new WindField(width,height);//OutlinedShape(width,height);
    scenes[2] = new WindField(width,height);//BlobWorld(width,height);
    scenes[3] = new WindField(width,height);//Geodesic(width,height);
    scenes[4] = new WindField(width,height);//
    scenes[5] = new WindField(width,height);//Helicoidal(width,height);
    scenes[6] = new WindField(width,height);
    scenes[7] = new WindField(width,height);//new PPS(width,height);
    //for (int i=2; i<scenes.length; i++) {
      //scenes[i] = new Scene(width, height);
    //}
  }
  void setupOsc() {
    oscP5 = new OscP5(this, 12000);
    myRemoteLocation = new NetAddress("192.168.1.8", 12000);//ip del ipad, puerto incoming

    oscP5.plug(this, "setZqncer", "/pattern/zequencer");
    oscP5.plug(this, "zqnceAll", "/pattern/zqnceAll");
    oscP5.plug(this, "setTempo", "/pattern/tempo");
    oscP5.plug(this, "setOpacity", "/view/main");

    oscP5.plug(ambient, "setWindDir", "/ambient/winDir");
    oscP5.plug(ambient, "setRain", "/ambient/rain");
    oscP5.plug(ambient, "setWind", "/ambient/wind");
    oscP5.plug(ambient, "setWaterAmp", "/ambient/waterAmp");
    oscP5.plug(ambient, "setHelicoAmp", "/ambient/helicoAmp");
    oscP5.plug(ambient, "setCycles", "/ambient/cycles");
    oscP5.plug(ambient, "setXtrangeF", "/ambient/xtrangeF");
    oscP5.plug(ambient, "setTrailScale", "/ambient/trailScale");
    oscP5.plug(ambient, "setTrails", "/ambient/trails");
    oscP5.plug(ambient, "setXcentricity", "/ambient/xcentricity");
    oscP5.plug(ambient, "setNoiseScale", "/ambient/noiseScale");
    oscP5.plug(ambient, "setPerlinV1", "/ambient/perlinV1");
    oscP5.plug(ambient, "setPerlinV2", "/ambient/perlinV2");
    oscP5.plug(ambient, "rec", "/ambient/rec");
    
    oscP5.plug(ambient, "setHalloes", "/ambient/halloes");
    oscP5.plug(ambient, "setInner", "/ambient/inner");
    oscP5.plug(ambient, "setOutline", "/ambient/outline");
    oscP5.plug(ambient, "sertVertex", "/ambient/vertex");
    oscP5.plug(ambient, "setCycle", "/ambient/cycle");
    oscP5.plug(ambient, "setScroll", "/ambient/scroll");
    oscP5.plug(ambient, "setThreshold", "/ambient/threshold");
//
    oscP5.plug(this, "setInvertMode", "/pattern/invert");


    for (int i=0; i<scenes.length; i++) {
      oscP5.plug(scenes[i], "setGlitch", "/pattern/glitch"+nf(i, 2));
      oscP5.plug(scenes[i], "setTempo", "/pattern/tempo"+nf(i, 2));
      oscP5.plug(scenes[i], "setHold", "/pattern/hold/1/"+(i+1));
      oscP5.plug(scenes[i], "setFlipH", "/pattern/flipH/1/"+(i+1));
      oscP5.plug(scenes[i], "setFlipV", "/pattern/flipV/1/"+(i+1));
      oscP5.plug(scenes[i], "setOnStage", "/pattern/onOff/1/"+(i+1));

      oscP5.plug(scenes[i], "setGain", "/input/gain"+nf(i, 2));
      oscP5.plug(scenes[i], "setHatDetect", "/input/beatDetect/3/"+(i+1));
      oscP5.plug(scenes[i], "setSnareDetect", "/input/beatDetect/2/"+(i+1));
      oscP5.plug(scenes[i], "setKickDetect", "/input/beatDetect/1/"+(i+1));
      oscP5.plug(scenes[i], "setBeatHit", "/input/hit/1/"+(i+1));

      oscP5.plug(scenes[i], "setOffset", "/view/offset"+nf(i, 2));
      oscP5.plug(scenes[i], "setZoom", "/view/zoom"+nf(i, 2));
      oscP5.plug(scenes[i], "setBrightness", "/view/brightness"+nf(i, 2));

      oscP5.plug(scenes[i], "setRotX", "/observer/rotX"+nf(i, 2));
      oscP5.plug(scenes[i], "setRotY", "/observer/rotY"+nf(i, 2));
      oscP5.plug(scenes[i], "setRotZ", "/observer/rotZ"+nf(i, 2));
      oscP5.plug(scenes[i], "setYoff", "/observer/yOff"+nf(i, 2));
      oscP5.plug(scenes[i], "setZoff", "/observer/zOff"+nf(i, 2));

      oscP5.plug(scenes[i], "setMinHue", "/color/minHue"+nf(i, 2));
      oscP5.plug(scenes[i], "setMaxHue", "/color/maxHue"+nf(i, 2));
      oscP5.plug(scenes[i], "setSaturation", "/color/sat"+nf(i, 2));
      oscP5.plug(scenes[i], "setCycle", "/color/cycle"+nf(i, 2));
      oscP5.plug(scenes[i], "setShine", "/color/shine"+nf(i, 2));
      //gCycle y gSHine !!

      oscP5.plug(scenes[i], "setDotSize", "/graph/dotSize"+nf(i, 2));
      oscP5.plug(scenes[i], "setLineLength", "/graph/lineLength"+nf(i, 2));
      oscP5.plug(scenes[i], "setShowLine", "/graph/line"+nf(i, 2));
      oscP5.plug(scenes[i], "setShowDot", "/graph/dot"+nf(i, 2));
      //
      oscP5.plug(scenes[i], "setInvertMode", "/pattern/invert"+nf(i, 2));
    }
  }

  void oscEvent(OscMessage theOscMessage) {
    /* with theOscMessage.isPlugged() you check if the osc message has already been
     * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
     * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
     * be used for double posting but is not required.
     */
    if (theOscMessage.isPlugged()==false) {
      /* print the address pattern and the typetag of the received OscMessage */
      println("### received an osc message.");
      println("### addrpattern\t"+theOscMessage.addrPattern());
      println("### typetag\t"+theOscMessage.typetag());
    }
  }
}

