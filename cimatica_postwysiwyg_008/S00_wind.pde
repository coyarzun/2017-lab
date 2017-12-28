class WindField extends Scene{
  float _width, _height;
  int grid_width, grid_height;
  float gridX, gridY;
  PerlinGrid perlin;
  
  WindField(int w, int h){
    pg = createGraphics(w,h,P3D);
    lens = createGraphics(w,h,P3D);
    oSB = new PImage(w,h,ARGB);
    pg.colorMode(HSB);
    
    _width = w;
    _height = w;
    int gw, gh;
    gw = gh = 40;
    grid_width = gw;
    grid_height = gh;
    gridX  = w/float(gw-1);
    gridY  = w/float(gh-1);
    perlin = new PerlinGrid(gw,gh);
  }

  void customize(){
    perlin.update();
    //pg.rotateX(radians(-30));
    //pg.translate(0, _height/4,-_height/2);//, -_width);
    pg.translate(-_width/2, 0,-_height);//-grid_height/2);
    for (int j=0; j<grid_height; j++) {
      for (int i=0; i<grid_width; i++) {
        float x = i*gridX;
        float z = j*gridY;
        pg.pushMatrix();
        float jiu = minHue+(maxHue-minHue)*perlin.vals[i][j];
        color tmp = 0;//color( jiu, 255,255);
        pg.stroke( tmp, 32 );//        pg.stroke( tmp, 32 );
        float ds = showLine? lineLength/2:0;
        float jiujiu =  360*perlin.vals[i][j];
        int iii = (i+j*grid_width)%512;
        float lineinfaktor = 100*in.right.get(iii);
        pg.translate(x, 100*ambient.waterAmp*sin(radians(jiujiu))+lineinfaktor, z);
        pg.rotate(TWO_PI*perlin.vals[i][j]);
        try{
        pg.line(-ds, 0, ds, 0);        
        pg.line(0, -ds, 0, ds);
        }catch(Exception e){
        }
        ds = showDot? 2*dotSize : 4;
        pg.noStroke();
        pg.fill(tmp);
        pg.ellipse(0, 0, ds/8, ds/8);
        pg.fill(0);
        pg.ellipse(0, 0, ds/16, ds/16);
        pg.popMatrix();
      }
    }
  }

  void setGlitch(float v){        glitcheable = v==1.0;  }
  void setTempo(float v) {        tempo       = v;  }
  void setHold(float v)  {        hold        = v==1.0;  }
  void setFlipH(float v)   {        reflectH    = v==1.0;  }
  void setFlipV(float v)   {        reflectV    = v==1.0;  }
  void setOnStage(float v) {        onStage     = v==1.0;  }

  void setGain(float v)       {     gain = v;  }
  void setHatDetect(float v)  {     hatDetect = v==1.0;  }
  void setSnareDetect(float v){     snareDetect = v==1.0;  }
  void setKickDetect(float v) {     kickDetect = v==1.0;  }
  void setBeatHit(float v)    {     beatHit = v==1.0;  }

  void setOffset(float y, float x){    xOff    = map(x,0,1,-pg.width/2,pg.width/2); yOff = map(y,0,1,-pg.height/2,pg.height/2);  }
  void setZoom(float v)           {    zoom    = map(v,0,1,0,2);  }
  void setBrightness(float v)     {    opacity = map(v,0,1,0,255);  }

  void setRotX(float v){    rotX    = map(v,0,1,-PI, PI);  println(v);}
  void setRotY(float v){    rotY    = map(v,0,1,-PI, PI);  }
  void setRotZ(float v){    rotZ    = map(v,0,1,-PI, PI);  }
  void setYoff(float v){    yOffset = map(v,0,1,-pg.height,pg.height);  }
  void setZoff(float v){    zOffset = map(v,0,1,0,-pg.height);  }
  
  void setMinHue(float v)    {    minHue = map(v,0,1,0,255);  }
  void setMaxHue(float v)    {    maxHue = map(v,0,1,0,255);  }
  void setSaturation(float v){    sat    = map(v,0,1,0,255);  }
  void setCycle(float v)       {    cycle  = v==1.0;  }
  void setShine(float v)       {    shine  = v==1.0;  }

  void setDotSize(float v)   {        dotSize    = map(v,0,1,1,32*4);  }
  void setLineLength(float v){        lineLength = map(v,0,1,4,1000);  }
  void setShowLine(float v)    {        showLine   = v==1.0;  }
  void setShowDot(float v)     {        showDot    = v==1.0;  }
  void setInvertMode(float v){  invertOn   = v==1.0; }
  
  class PerlinGrid {
    float noiseScale=0.1;//01;//0.02;//.01;//0.02;
    int w, h;
    float[][]vals;

    PerlinGrid(int _w, int _h) {
      w = _w; 
      h = _h;
      vals = new float[w][h];
    }
    void update() {
      float val1= frameCount*(-.5+ambient.perlinV1);
      float val2 = frameCount*(-.5+ambient.perlinV2);
      for (int i=0; i<w; i++) {
        for (int j=0; j<h; j++) {
          vals[i][j] = noise((val1+i)*ambient.noiseScale, (val2+j)*ambient.noiseScale);
        }
      }
    }
  }
}
