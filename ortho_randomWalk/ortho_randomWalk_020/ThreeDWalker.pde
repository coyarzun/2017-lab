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
      c = int(paths.get(pathIndex-1).to.x);
      r = int(paths.get(pathIndex-1).to.y);
      z = int(paths.get(pathIndex-1).to.z);
      //debiera ser, evaluar en q eje se mueve y elejir solo los otros 2
    }
    /////////////
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
    /////////////
    int ddC = (tc-c);
    int ddR = (tr-r);
    int ddZ = (tz-z);
    int dC,dR,dZ;
    if(ddC==0) dC = 0;
    else dC = abs(ddC)/ddC;
    
    if(ddR==0) dR = 0;
    else dR = abs(ddR)/ddR;
    
    if(ddZ==0) dZ = 0;
    else dZ = abs(ddZ)/ddZ;
    ///////////////////
    paths.add(new Path(this,new PVector(c, r, z), new PVector(tc, tr, tz), new PVector(dC,dR,dZ)));
    pathIndex++;
  }
  void update() {
    for (int i=0; i<paths.size (); i++) {
      paths.get(i).update();
      if (paths.get(i).reallydone){//<0){
        paths.remove(i);
        pathIndex--;
      }
    }
    //addPath();
  }
  void draw() {
    noStroke();
    pushMatrix();
    translate(-cols*unit/2.0, -rows*unit/2.0, -zcols*unit/2.0);
    //box(unit*12);
    if(!boxMode)
    {
      beginShape();
      stroke(255);
      strokeWeight(unit);
      strokeCap(ROUND);
      strokeJoin(ROUND);
    }
    for (int i=0; i<paths.size (); i++) {
      paths.get(i).draw();
    }
    if(!boxMode)endShape();
    popMatrix();
  }
}


