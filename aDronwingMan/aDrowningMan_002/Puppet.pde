class Puppet{
  float unit;
  float torsoW, torsoH, torsoD;
  float leg1W, leg1H, leg1D;
  float leg2W, leg2H, leg2D;
  float heelW, heelH, heelD;
  float feetW, feetH, feetD;
  
  Puppet(){
    unit = 8;
    torsoW = 3*unit;
    torsoH = 6*unit;
    torsoD = 1*unit;
    leg1W  = 1*unit;
    leg1H  = 3*unit;
    leg1D  = 1*unit;
    leg2W  = 1*unit;
    leg2H  = 3*unit;
    leg2D  = 1*unit;
    heelW  = 1*unit;
    heelH  = 1*unit;
    heelD  = 1.5*unit;
    feetW  = 1*unit;
    feetH  = 0.5*unit;
    feetD  = 2*unit;
  }
  void update(){
  }
  void draw(){
    drawTorso();
    drawLegL();
    drawLegR();
    
  }
  void drawTorso(){
  //torso
    pushMatrix();
    //translate(0,-torsoH/3,0);
    translate(0,-torsoH/2,0);
    box(torsoW,torsoH,torsoD);
    popMatrix();
    //crotch
    pushMatrix();
    translate(0,unit/2,0);
    box(unit);
    popMatrix();
  }
  void drawLegL(){
  //pierna L
    pushMatrix();
    translate(0,unit/2,0);
    translate(-torsoW/2+unit/2,0,0);
    translate(0,leg1H/2,0);
    box(leg1W,leg1H,leg1D);
    //knee L
    translate(0,leg1H/2,0);
    translate(0,unit/2,0);
    box(unit*.6);
    //rotateX(radians(frameCount));
    translate(0,unit/2,0);
    translate(0,leg2H/2,0);
    box(leg2W,leg2H,leg2D);
    //ankle
    translate(0,leg2H/2,0);
    translate(0,unit/2,0);
    box(unit*.6);
    //heel
    translate(0,heelH/2,0);
    box(heelW,heelH,heelD);
    //foot
    translate(0,heelH/2-feetH/2,feetD/2);
    box(feetW,feetH,feetD);
    popMatrix();
  }
  void drawLegR(){
  //pierna R
    pushMatrix();
    translate(0,unit/2,0);
    translate(torsoW/2-unit/2,0,0);
    translate(0,leg1H/2,0);
    box(leg1W,leg1H,leg1D);
    //knee L
    translate(0,leg1H/2,0);
    translate(0,unit/2,0);
    box(unit*.6);
    //rotateX(radians(frameCount));
    translate(0,unit/2,0);
    translate(0,leg2H/2,0);
    box(leg2W,leg2H,leg2D);
    //ankle
    translate(0,leg2H/2,0);
    translate(0,unit/2,0);
    box(unit*.6);
    //heel
    translate(0,heelH/2,0);
    box(heelW,heelH,heelD);
    //foot
    translate(0,heelH/2-feetH/2,feetD/2);
    box(feetW,feetH,feetD);
    popMatrix();
}
}

