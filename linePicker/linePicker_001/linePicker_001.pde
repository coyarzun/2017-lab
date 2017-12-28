class Line{
  PVector from, to;
  float   angle, ratio;
  float   l, r, t, b;//left, right, top, bottom
  
  Line(float x1, float y1, float x2, float y2){
    from = new PVector(x1,y1);
    to   = new PVector(x2,y2);
    angle  = atan2(to.y-from.y,to.x-from.x);
    angle  += TWO_PI; angle%= TWO_PI;
    ratio  = dist(from.x,from.y,to.x,to.y);
    bounds();
  }
  Line(PVector p, float r, float a){
    from = p;
    float x2 = from.x+r*cos(a);
    float y2 = from.y+r*sin(a);
    to   = new PVector(x2,y2);
    angle = a; 
    ratio = r;
    bounds();
  }
  void bounds(){
    l    = min(from.x,to.x);
    r    = max(from.x,to.x);
    t    = min(from.y,to.y);
    b    = max(from.y,to.y);
  }
  boolean checkBounds(float mx, float my){
    return mx>=l && mx<=r && my>=t && my<=b;
  }
  boolean checkAngle(float mx, float my, float decTolerance){
    float a = atan2(my-from.y, mx-from.x); a%=TWO_PI;
    float da = abs(angle-a); da%= TWO_PI;
    println(a+" "+da);
    return da<=radians(decTolerance);
  }
  void draw(){
    pushMatrix();
    noFill();
    strokeWeight(4.0);
    line(from.x,from.y,to.x,to.y);
    strokeWeight(1.0);
    rect(l,t, r-l, b-t);
    popMatrix();
  }
}

Line[] lines;

void setup(){
  size(400,400);
  lines = new Line[100];
  for(int i=0; i<lines.length; i++){
    lines[i] = new Line( new PVector( random(width), random(height) ),
                         80, random(TWO_PI) );
  }
}
void draw(){
  background(255);
  for(int i=0; i<lines.length; i++){
    if(lines[i].checkBounds(mouseX, mouseY)){
      if(lines[i].checkAngle(mouseX, mouseY, 4)){
        stroke(255,0,0);
      }else{
        stroke(0,255,0);
      }
    }else{
      stroke(0);
    }
    lines[i].draw();
  }
}
