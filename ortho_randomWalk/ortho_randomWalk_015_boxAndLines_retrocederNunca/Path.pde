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
    if(boxMode)
    boxDraw();
    else
    lineDraw();
  }
  void boxDraw() {
    pushMatrix();
    noStroke();
    float w = (1+(abs(current.x-from.x)))*unit;
    float h = (1+(abs(current.y-from.y)))*unit;
    float d = (1+(abs(current.z-from.z)))*unit;
    float cx = (current.x-from.x)/2;
    float cy = (current.y-from.y)/2;
    float cz = (current.z-from.z)/2;
    translate((from.x+cx)*unit,(from.y+cy)*unit,(from.z+cz)*unit);
    box(w,h,d);
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
