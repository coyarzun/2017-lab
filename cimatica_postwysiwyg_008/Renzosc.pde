class RenzOsc {
  OscP5 oscP5;
  NetAddress myRemoteLocation;
  
  float meterLevelL, meterLevelR;
  float reaktorLevelL, reaktorLevelR;
  float glitchLevel;
  float granuladorLevelL, granuladorLevelR;

  RenzOsc() {
  oscSetup();
  }
  void draw() {
    
  }
  void oscSetup() {
    oscP5 = new OscP5(this, 12000);
    myRemoteLocation = new NetAddress("192.168.1.8",12000);
    oscP5.plug(this, "meterL", "/meterL");//samplerL
    oscP5.plug(this, "meterR", "/meterR");//samplerR
    oscP5.plug(this, "reaktorL", "/reaktorL");//tercera parte
    oscP5.plug(this, "reaktorR", "/reaktorR");//
    oscP5.plug(this, "glitch", "/glitch");//primera parte y entremedio
    oscP5.plug(this, "granuladorL", "/granuladorL");//segunda parte
    oscP5.plug(this, "granuladorR", "/granuladorR");//
  }
  void meterL(float v) {  
    meterLevelL = v;
  }
  void meterR(float v) {  
    meterLevelR = v;
  }
  void reaktorL(float v) {  
    reaktorLevelL = v;
  }
  void reaktorR(float v) {  
    reaktorLevelR = v;
  }
  void glitch(float v) {  
    glitchLevel = map(v, 0, 2.5, 0, 1);
  }
  void granuladorL(float v) {  
    granuladorLevelL = map(v, 0, 0.08, 0, 1);
  }
  void granuladorR(float v) {  
    granuladorLevelR = map(v, 0, 0.08, 0, 1);
  }

  void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.isPlugged()==false) {
      println("### received an osc message.");
      println("### addrpattern\t"+theOscMessage.addrPattern());
      println("### typetag\t"+theOscMessage.typetag());
    }
  }
}
