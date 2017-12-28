class Path {
  int fromC, fromR, fromZ;
  int toC, toR, toZ;
  int cC, cR, cZ;
  int dC, dR, dZ;
  int life = 100;
  ThreeDeeWalker root;
  boolean done;
  
  Path(ThreeDeeWalker r, int fc, int fr, int fz, int tc, int tr, int tz) {
    root = r;
    fromC=fc; 
    fromR = fr; 
    fromZ=fz;
    toC=tc; 
    toR=tr; 
    toZ=tz;
    
    cC = fromC;
    cR = fromR;
    cZ = fromZ;
    //B GJGFB V
    int ddC = (toC-fromC);
    int ddR = (toR-fromR);
    int ddZ = (toZ-fromZ);
    
    if(ddC==0) dC = 0;
    else dC = abs(ddC)/ddC;

    if(ddR==0) dR = 0;
    else dR = abs(ddR)/ddR;

    if(ddZ==0) dZ = 0;
    else dZ = abs(ddZ)/ddZ;

  }
  void update() {
    life--;
    cC+=dC;
    cR+=dR;
    cZ+=dZ;
    if(dist(cC,cR,cZ,toC,toR,toZ)==0 && !done){
      root.addPath();
      dC = 0; dR = 0; dZ = 0;
      done = true;
    }
  }
  void draw(){
    lineDraw();
  }
  void boxDraw() {
    pushMatrix();
    noStroke();
    float w = (1+abs(toC-fromC))*unit;
    float h = (1+abs(toR-fromR))*unit;
    float d = (1+abs(toZ-fromZ))*unit;
    float cx = (toC-fromC)/2;
    float cy = (toR-fromR)/2;
    float cz = (toZ-fromZ)/2;
    translate(fromC*unit+cx,fromR*unit+cy,fromZ*unit+cz);
    box(w,h,d);
    //line(fromC*unit, fromR*unit, fromZ*unit, toC*unit, toR*unit, toZ*unit);
    popMatrix();
  }
  void lineDraw() {
    pushMatrix();
    stroke(255);
    strokeWeight(unit);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    //line(fromC*unit, fromR*unit, fromZ*unit, toC*unit, toR*unit, toZ*unit);
    line(fromC*unit, fromR*unit, fromZ*unit, cC*unit, cR*unit, cZ*unit);
    popMatrix();
  }
}
