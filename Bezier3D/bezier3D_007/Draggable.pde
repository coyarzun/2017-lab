class Draggable{
  float x, y;
  float xoff, yoff;
  float diam;
  boolean dragging = false;
  float   tolerance = 1.2;
  
  Draggable(float x, float y){
    this.x=x;this.y=y;
    diam = 8;
  }
  boolean mousePressed(){
    dragging = dist(mouseX,mouseY,x,y)<=diam*tolerance;
    xoff     = mouseX-x;
    yoff     = mouseY-y;
    return dragging;
  }
  void mouseReleased(){
    dragging = false;
  }
  void draw(){
    if(dragging){x=mouseX-xoff;y=mouseY-yoff;}
    stroke(dragging?color(0,255,0):255);
    noFill();
    pushMatrix();
    translate(x,y);
    ellipse(0,0,diam,diam);
    fill(255);
    textSize(8);
    text("( "+x+", "+y+" )", diam*.8, diam*1.2);
    popMatrix();
  }
}
