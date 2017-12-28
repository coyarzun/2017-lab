class BGUI{
  ArrayList d;

  BGUI() {
    d = new ArrayList();//(20,20);
    d.add( new Draggable(10, 10) );
    d.add( new Draggable(width-10, 10) );
    d.add( new Draggable(width/2, height-10) );
  }
  void draw() {
    Draggable a, b, c;

    
    a  = ((Draggable)d.get(0));
    b  = ((Draggable)d.get(1));
    c  = ((Draggable)d.get(2));
    //c2 = ((Draggable)d.get(3));


    int steps = 64;
    float t, sx, sy, sdiam;
    float tx, ty, sa;

    boolean itsMe;

    for (int i=0; i<steps+1; i++) {
      itsMe = (frameCount)%steps==i;

      t = i/float(steps);

      PVector m1, m2, m3;
      m1 = new PVector( lerp(a.x, c.x, t), lerp(a.y, c.y, t) ); 
      m2 = new PVector( lerp(c.x, b.x, t), lerp(c.y, b.y, t) );
      m3 = new PVector( lerp(m1.x, m2.x, t), lerp(m1.y, m2.y, t) );

      sx = m3.x;//bezierPoint(a.x, c1.x, c2.x, b.x, t);
      sy = m3.y;//bezierPoint(a.y, c1.y, c2.y, b.y, t);
      if (itsMe) {
        line(m1.x, m1.y, m2.x, m2.y);
        //ellipse(m3.x, m3.y, 6, 6);
        ellipse(m1.x, m1.y, 6, 6);
        ellipse(m2.x, m2.y, 6, 6);
      }
      sdiam = i%16==0?8:5;
      if (itsMe) sdiam*=1.8;

      float f = map(i, 0, steps+1, 0, 1);
      color cc = lerpColor(color(255, 0, 255), color(255, 255, 0), f);

      stroke(!itsMe? cc:0);
      ellipse(sx, sy, sdiam, sdiam);

      //    tx = bezierTangent(a.x, c1.x, c2.x, b.x, t);
      //    ty = bezierTangent(a.y, c1.y, c2.y, b.y, t);
      sa = atan2((m2.y-m1.y), (m2.x-m1.x));
      sa -= HALF_PI;
      line(sx, sy, 4*sdiam*cos(sa)+sx, 4*sdiam*sin(sa)+sy);
    }
    noFill();
    stroke(200);
    line(a.x, a.y, c.x, c.y);
    line(b.x, b.y, c.x, c.y);

    stroke(0);
    beginShape();
    vertex(a.x, a.y);
    quadraticVertex(c.x, c.y, b.x, b.y);
    endShape();

    for (int i=0; i<d.size (); i++) {
      Draggable tmp = (Draggable)d.get(i);
      tmp.draw();
    }
  }
  void mousePressed() {
    for (int i=0; i<d.size (); i++) {
      Draggable tmp = (Draggable)d.get(i);
      if (tmp.mousePressed()) {
        for (int j=i+1; j<d.size (); j++) {
          Draggable tmp2 = (Draggable)d.get(j);
          tmp2.mouseReleased();
        }
        //break;
      }
    }
  }
  void mouseReleased() {
    for (int i=0; i<d.size (); i++) {
      Draggable tmp = (Draggable)d.get(i);
      tmp.mouseReleased();
    }
  }

  class Draggable {
    float x, y;
    float xoff, yoff;
    float diam;
    boolean dragging = false;
    float   tolerance = 1.2;

    Draggable(float x, float y) {
      this.x=x;
      this.y=y;
      diam = 8;
    }
    boolean mousePressed() {
      dragging = dist(mouseX, mouseY, x, y)<=diam*tolerance;
      xoff     = mouseX-x;
      yoff     = mouseY-y;
      return dragging;
    }
    void mouseReleased() {
      dragging = false;
    }
    void draw() {
      if (dragging) {
        x=mouseX-xoff;
        y=mouseY-yoff;
      }
      stroke(dragging?color(255, 0, 255):0);
      noFill();
      pushMatrix();
      translate(x, y);
      ellipse(0, 0, diam, diam);
      fill(0);
      textSize(8);
      text("( "+x+", "+y+" )", diam*.8, diam*1.2);
      popMatrix();
    }
  }
}
