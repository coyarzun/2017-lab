class Path {
  PVector from, to, current, speed, direction;
  
  int life = 100*10;
  ThreeDeeWalker root;
  boolean done;
  
  Path(ThreeDeeWalker r, PVector f, PVector t, PVector d){
    root = r;
    from = f;  
    to   = t; 
    current = new PVector(from.x,from.y,from.z);
    direction = d;
    speed = new PVector(d.x,d.y,d.z);
  }
  void update() {
    life--;
    current.x+=speed.x;
    current.y+=speed.y;
    current.z+=speed.z;
    //println(from+" "+current+" "+to);
    
    if((to.x-current.x)+(to.y-current.y)+(to.z-current.z)==0.0 && !done){
      //println("next!");
      root.addPath();
      speed.x=0;speed.y=0;speed.z=0;
      done = true;
    }
  }
  void draw(){
    lineDraw();
  }
  void boxDraw() {
    pushMatrix();
    noStroke();
    /*float w = (1+abs(toC-fromC))*unit;
    float h = (1+abs(toR-fromR))*unit;
    float d = (1+abs(toZ-fromZ))*unit;
    float cx = (toC-fromC)/2;
    float cy = (toR-fromR)/2;
    float cz = (toZ-fromZ)/2;
    translate(fromC*unit+cx,fromR*unit+cy,fromZ*unit+cz);
    box(w,h,d);*/
    //line(fromC*unit, fromR*unit, fromZ*unit, toC*unit, toR*unit, toZ*unit);
    popMatrix(); 
  }
  void lineDraw() {
    //println("drawing?");
    pushMatrix();
    stroke(255);
    strokeWeight(unit);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    //line(fromC*unit, fromR*unit, fromZ*unit, toC*unit, toR*unit, toZ*unit);
    line(from.x*unit, from.y*unit, from.z*unit, current.x*unit, current.y*unit, current.z*unit);
    popMatrix();
  }
}
