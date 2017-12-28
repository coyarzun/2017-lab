class Path {
  PVector from, to, current, speed, direction;
  PVector c1, c2;
  
  int life = 100*1;
  ThreeDeeWalker root;
  boolean done, reallydone;
  
  Path(ThreeDeeWalker r, PVector f, PVector t, PVector d){
    root = r;
    from = f;  
    to   = t; 
    current = new PVector(from.x,from.y,from.z);
    c1 = new PVector(from.x+random(-10,10),from.y+random(-10,10),from.z+random(-10,10));
    c2 = new PVector(to.x+random(-10,10),to.y+random(-10,10),to.z+random(-10,10));
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
    //lineDraw();
    bezierDraw();
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
    //pushMatrix();vvv
    line(from.x*unit, from.y*unit, from.z*unit, current.x*unit, current.y*unit, current.z*unit);
    //popMatrix();
  }
  void bezierDraw() {
    //println("drawing?");
    //pushMatrix();vvv
    //bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);
    bezier(  
            from.x*unit, from.y*unit, from.z*unit, 
            c1.x*unit, c1.y*unit, c1.z*unit,
            c2.x*unit, c2.y*unit, c2.z*unit,
            current.x*unit, current.y*unit, current.z*unit);
    //popMatrix();
  }
}
