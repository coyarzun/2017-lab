class Path {
  PVector from, to, current, speed, direction;
  
  int life = 10*1*5;
  ThreeDeeWalker root;
  boolean done, reallydone;
  
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
    if(!done){
      current.x+=speed.x;
      current.y+=speed.y;
      current.z+=speed.z;
    }else if(life<0){
      from.x+=speed.x;
      from.y+=speed.y;
      from.z+=speed.z;    
    }
    //println(from+" "+current+" "+to);
    
    if((to.x-current.x)+(to.y-current.y)+(to.z-current.z)==0.0 && !done){
      //println("next!");
      root.addPath();
      //speed.x=0;speed.y=0;speed.z=0;
      done = true;
      println("done");
    }

    if((to.x-from.x)+(to.y-from.y)+(to.z-from.z)==0.0){
      //println("next!");
      speed.x=0;speed.y=0;speed.z=0;
      reallydone = true;
      println("dead");
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
    fill(255,64);
    box(w,h,d);
    popMatrix(); 
  }
  void lineDraw() {
    //println("drawing?");
    //pushMatrix();vvv
    line(from.x*unit, from.y*unit, from.z*unit, current.x*unit, current.y*unit, current.z*unit);
    //popMatrix();
  }
}
