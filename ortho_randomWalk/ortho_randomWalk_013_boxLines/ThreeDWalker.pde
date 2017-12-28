class ThreeDeeWalker {
  ArrayList<Path> paths;
  int pathIndex;

  ThreeDeeWalker() {
    paths = new ArrayList<Path>();
    pathIndex = 0;
    addPath();
  }
  void addPath() {
    int c, r, z, tc, tr, tz, ll;

    if (pathIndex==0) {
      c = int(random(cols));
      r = int(random(rows));
      z = int(random(zcols));
    } else {
      c = paths.get(pathIndex-1).toC;
      r = paths.get(pathIndex-1).toR;
      z = paths.get(pathIndex-1).toZ;
    }

    float dice = random(100);

    if (dice<30) { 
      tc = int(random(cols));
      tr = r;
      tz = z;
    } else if (dice<60) {
      tc = c;
      tr = int(random(rows));
      tz = z;
    } else {
      tc = c;
      tr = r;
      tz = int(random(zcols));
    }
    paths.add(new Path(c, r, z, tc, tr, tz));
    pathIndex++;
  }
  void update() {
    for (int i=0; i<paths.size (); i++) {
      paths.get(i).update();
      if (paths.get(i).life<0){
        paths.remove(i);
        pathIndex--;
      }
    }
    addPath();
  }
  void draw() {
    noStroke();
    pushMatrix();
    translate(-cols*unit/2, -rows*unit/2, -zcols*unit/2);
    //box(unit*12);
    for (int i=0; i<paths.size (); i++) {
      paths.get(i).draw();
    }
    popMatrix();
  }
}
class Path {
  int fromC, fromR, fromZ;
  int toC, toR, toZ;
  int life = 100;


  Path(int fc, int fr, int fz, int tc, int tr, int tz) {
    fromC=fc; 
    fromR = fr; 
    fromZ=fz;
    toC=tc; 
    toR=tr; 
    toZ=tz;
  }
  void update() {
    life--;
  }
  void draw() {
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
  void oldDraw() {
    pushMatrix();
    stroke(255);
    strokeWeight(unit);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    line(fromC*unit, fromR*unit, fromZ*unit, toC*unit, toR*unit, toZ*unit);
    popMatrix();
  }
}

