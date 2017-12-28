class Path {
  PVector from, to, current, speed, direction;
  PVector c1, c2;
  int maxlife = 100*10;
  int life = maxlife;
  ThreeDeeWalker root;
  boolean done, reallydone;

  Path(ThreeDeeWalker r, PVector f, PVector t, PVector d) {
    root = r;
    from = f;  
    to   = t; 
    current = new PVector(from.x, from.y, from.z);
    c1 = new PVector(from.x+random(-10, 10), from.y+random(-10, 10), from.z+random(-10, 10));
    c2 = new PVector(to.x+random(-10, 10), to.y+random(-10, 10), to.z+random(-10, 10));
    direction = d;
    speed = new PVector(d.x, d.y, d.z);
    steps = int(dist(from.x, from.y, from.z, to.x, to.y, to.z));
    fromStep = 0;
    toStep   = steps;
    cStep = 0;
  }
  void update() {
    life--;
    if (!done) {
      current.x+=speed.x;
      current.y+=speed.y;
      current.z+=speed.z;
    } else if (life<0) {
      from.x+=speed.x;
      from.y+=speed.y;
      from.z+=speed.z;
    }
    //println(from+" "+current+" "+to);

    if ((to.x-current.x)+(to.y-current.y)+(to.z-current.z)==0.0 && !done) {
      //println("next!");
      root.addPath();
      //speed.x=0;speed.y=0;speed.z=0;
      done = true;
      println("done");
    }

    if ((to.x-from.x)+(to.y-from.y)+(to.z-from.z)==0.0) {
      //println("next!");
      speed.x=0;
      speed.y=0;
      speed.z=0;
      reallydone = true;
      println("dead");
    }
  }
  int steps, fromStep, toStep, cStep;

  void updateBezierMode() {
    life--;

    if (!done)cStep++;
    else if(life<0)    fromStep++;

    if (cStep>=steps && !done) {
      root.addPath();
      done = true;
    }
    if (fromStep>=toStep) {
      reallydone = true;
    }
  }
  void draw() {
    if (boxMode)
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
    translate((from.x+cx)*unit, (from.y+cy)*unit, (from.z+cz)*unit);

    box(w, h, d);
    popMatrix();
  }
  void lineDraw() {
    //println("drawing?");
    //pushMatrix();vvv
    line(from.x*unit, from.y*unit, from.z*unit, current.x*unit, current.y*unit, current.z*unit);
    //popMatrix();
  }
  float t, sx, sy, sz, sdiam;
  float tx, ty, tz, sa;
    
  void bezierDraw() {
    //println("drawing?");
    //pushMatrix();vvv
    //bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);
    strokeWeight(1.0);stroke(255,map(constrain(life,-10,maxlife),-10,maxlife,0,255));
    noFill();
    /*bezier(  
    from.x*unit, from.y*unit, from.z*unit, 
    c1.x*unit, c1.y*unit, c1.z*unit, 
    c2.x*unit, c2.y*unit, c2.z*unit, 
    to.x*unit, to.y*unit, to.z*unit);
    */
    //popMatrix();


    

    boolean itsMe;

    for (int i=fromStep; i<cStep+1; i++) {
      itsMe = i==cStep;//(frameCount)%steps==i;

      t = i/float(steps);
      sx = bezierPoint(from.x, c1.x, c2.x, to.x, t);
      sy = bezierPoint(from.y, c1.y, c2.y, to.y, t);
      sz = bezierPoint(from.z, c1.z, c2.z, to.z, t);

      /*
    sx    = map(sx, 10, width/3-10, -width/6+5, width/6-5);
       sy    = map(sy, 10, width/3-10, -width/6+5, width/6-5); 
       sz    = map(sz, 10, width/3-10, -width/6+5, width/6-5);
       */

      //sx-=width/6-5;
      //sy-=width/6-5;
      //sz-=width/6-5;

      //sz -= width/3;

      //sdiam = i%16==0?8:5;
      sdiam = 4;
      sdiam*=2;
      if (itsMe) sdiam*=1.8;

      //    stroke(220);
      //    line(sx,0,sx,height);
      //    line(0,sy,width,sy);
      float f = map(i, 0, steps+1, 0, 1);
      color cc = lerpColor(color(255, 0, 255), color(255, 255, 0), f);

      fill(!itsMe? 255:255);
      noStroke();
      pushMatrix();
      translate(sx*unit, sy*unit, sz*unit);
      //ellipse(0,0, sdiam, sdiam);

      tx = bezierTangent(from.x, c1.x, c2.x, to.x, t);
      ty = bezierTangent(from.y, c1.y, c2.y, to.y, t);
      tz = bezierTangent(from.z, c1.z, c2.z, to.z, t);

      sa = atan2(ty, tx);
      sa -= HALF_PI;
      //
      float xxx = atan2(ty, tx);
      float yyy = atan2(tz, ty);
      float zzz = atan2(tx, tz);
      //x=r*sin(theta)*cos(phi)
      //y=r*sin(theta)*sin(phi);
      //z=r*cos(theta); 
      //line(0, 0, 0, 2*sdiam*cos(sa)+sx, 2*sdiam*sin(sa)+sy, 0);
      rotateX(xxx);
      rotateY(yyy);
      rotateZ(zzz);
      //rotateZ(radians(frameCount));
      box(sdiam);
      box(sdiam*.2, sdiam*4, sdiam*.2);
      popMatrix();
    }
  }
}

