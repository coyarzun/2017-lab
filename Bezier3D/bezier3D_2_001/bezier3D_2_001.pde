//cubic bezier dev
ArrayList d;
PFont     font;
Draggable a, b, c1, c2;
Draggable a2, b2, c21, c22;


boolean doOrtho, doGrid, doBezier, doGui, doSpin,doLights, doBlink;

void setup() {
  size(900, 600, P3D);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw", 8);
  d = new ArrayList();//(20,20);
  d.add( new Draggable(10, 10) );
  d.add( new Draggable(width/3-10, height/2-10) );
  d.add( new Draggable(10, height/4) );
  d.add( new Draggable(width/3-10, height/4) );

  d.add( new Draggable(10, height/2+10) );
  d.add( new Draggable(width/3-10, height-10) );
  d.add( new Draggable(10, 3*height/4) );
  d.add( new Draggable(width/3-10, 3*height/4) );


  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  a2  = ((Draggable)d.get(4));
  b2  = ((Draggable)d.get(5));
  c21 = ((Draggable)d.get(6));
  c22 = ((Draggable)d.get(7));
}
float a3x, a3y, a3z, c31x, c31y, c31z, c32x, c32y, c32z, b3x, b3y, b3z;
void draw() {
  a.x  = width/6+(width/6-5)*sin(2*radians(frameCount));
  b.x  = width/6+(width/6-5)*cos(3*radians(frameCount));
  
  a2.x = a.x; b2.x=b.y+height/2;
  
  a2.y  = width/3+(width/6-5)*sin(2*radians(frameCount));
  b2.y  = width/3+(width/6-5)*cos(3*radians(frameCount));
  
  c1.x = 10+100*sin(radians(frameCount));
  c1.y = height/4+100*cos(radians(frameCount));
  c2.x = width/3-10+100*cos(radians(frameCount));
  c2.y = height/4+100*sin(radians(frameCount));
  
  background(0);
  if (doOrtho)ortho();
  else perspective();
  noFill();
  if (doGui) {
    stroke(200);
    rect(10, 10, width/3-20, width/3-20);
    line(a.x, a.y, c1.x, c1.y);
    line(b.x, b.y, c2.x, c2.y);
    line(c1.x, c1.y, c2.x, c2.y);

    stroke(255);
    bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);


    stroke(200);
    rect(10, 10+height/2, width/3-20, width/3-20);
    line(a2.x, a2.y, c21.x, c21.y);
    line(b2.x, b2.y, c22.x, c22.y);
    line(c21.x, c21.y, c22.x, c22.y);

    stroke(255);
    bezier(a2.x, a2.y, c21.x, c21.y, c22.x, c22.y, b2.x, b2.y);
  
  for (int i=0; i<d.size (); i++) {
    Draggable tmp = (Draggable)d.get(i);
    tmp.draw();
  }
  }

  translate(2*width/3, height/2);
  noFill();
  stroke(128);
  if(doLights)doLights();
  if(doSpin)rotateY(radians(frameCount));
  //rotateX(radians(45));

  

  a3x    = map(a.x, 10, width/3-10, -width/6+5, width/6-5);
  a3y    = map(a.y, 10, width/3-10, -width/6+5, width/6-5); 
  a3z    = map(a2.y-height/2, 10, width/3-10, -width/6+5, width/6-5);
  c31x   = map(c1.x, 10, width/3-10, -width/6+5, width/6-5);
  c31y   = map(c1.x, 10, width/3-10, -width/6+5, width/6-5);
  c31z   = map(c21.y-height/2, 10, width/3-10, -width/6+5, width/6-5);
  c32x   = map(c2.x, 10, width/3-10, -width/6+5, width/6-5);
  c32y   = map(c2.x, 10, width/3-10, -width/6+5, width/6-5);
  c32z   = map(c22.y-height/2, 10, width/3-10, -width/6+5, width/6-5);
  b3x    = map(b.x, 10, width/3-10, -width/6+5, width/6-5);
  b3y    = map(b.x, 10, width/3-10, -width/6+5, width/6-5);
  b3z    = map(b2.y-height/2, 10, width/3-10, -width/6+5, width/6-5);

  if (doBezier)bezier(a3x, a3y, a3z, 
  c31x, c31y, c31z, 
  c32x, c32y, c32z, 
  b3x, b3y, b3z);

  if (doGrid)box(width/3-10);

  /*
  pushMatrix();
   //translate(-width/6+5,-width/6+5,-width/6+5);
   translate(-width/6,0);
   bezier(a.x,a.y,a2.y,
   c1.x,c1.y,c21.y,
   c2.x,c2.y,c22.y,
   b.x,b.y,b2.y);
   //
   popMatrix();*/
  bezier3D();
  //filter(INVERT);
  if(doBlink)doLights=!doLights;
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

void bezier3D() {
  int steps = 64;
  float t, sx, sy, sz, sdiam;
  float tx, ty, tz, sa;

  boolean itsMe;

  for (int i=0; i<steps+1; i++) {
    itsMe = (frameCount)%steps==i;

    t = i/float(steps);
    sx = bezierPoint(a3x, c31x, c32x, b3x, t);
    sy = bezierPoint(a3y, c31y, c32y, b3y, t);
    sz = bezierPoint(a3z, c31z, c32z, b3z, t);

    /*
    sx    = map(sx, 10, width/3-10, -width/6+5, width/6-5);
     sy    = map(sy, 10, width/3-10, -width/6+5, width/6-5); 
     sz    = map(sz, 10, width/3-10, -width/6+5, width/6-5);
     */

    //sx-=width/6-5;
    //sy-=width/6-5;
    //sz-=width/6-5;

    //sz -= width/3;

    sdiam = i%16==0?8:5;
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
    translate(sx, sy, sz);
    //ellipse(0,0, sdiam, sdiam);

    tx = bezierTangent(a3x, c31x, c32x, b3x, t);
    ty = bezierTangent(a3y, c31y, c32y, b3y, t);
    tz = bezierTangent(a3z, c31z, c32z, b3z, t);

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
    rotateZ(radians(frameCount));
    box(sdiam);
    box(sdiam*.2, sdiam*4, sdiam*.2);
    popMatrix();
  }
}

void doLights() {
  directionalLight( 255, 0, 0, 1, 0, 0);
  directionalLight(   0, 255, 0, 0, 1, 0);
  directionalLight(   0, 0, 255, 0, 0, -1);
}

void keyPressed() {
  if (key=='o')doOrtho=!doOrtho;
  if (key=='g')doGrid=!doGrid;
  if (key=='b')doBezier=!doBezier;
  if (key=='u')doGui=!doGui;
  if (key=='s')doSpin=!doSpin;
  if (key=='l')doLights=!doLights;
  if (key=='k')doBlink=!doBlink;
}

