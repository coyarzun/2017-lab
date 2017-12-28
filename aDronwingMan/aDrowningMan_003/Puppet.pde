class Puppet{
  float unit;
  
  float hipsW, hipsH, hipsD;
  float torsoW, torsoH, torsoD;
  float chestW, chestH, chestD;
  float leg1W, leg1H, leg1D;
  float leg2W, leg2H, leg2D;
  float heelW, heelH, heelD;
  float feetW, feetH, feetD;
  float handW, handH, handD;
  float hand2W, hand2H, hand2D;
  
  float armW, armH, armD;
  float forearmW, forearmH, forearmD;
  
  Puppet(){
    unit = 8;

    hipsW = 3*unit;
    hipsH = 2*unit;
    hipsD = 1*unit;

    torsoW = 2*unit;
    torsoH = 2*unit;
    torsoD = 1*unit;
    
    chestW = 3*unit;
    chestH = 3*unit;
    chestD = 1*unit;
    
    armW  = 1*unit;
    armH  = 2.5*unit;
    armD  = 1*unit;
    
    forearmW  = 1*unit;
    forearmH  = 2*unit;
    forearmD  = 1*unit;
    
    handW  = 0.6*unit;
    handH  = 1*unit;
    handD  = 0.8*unit;
    
    hand2W  = 0.2*unit;
    hand2H  = 1*unit;
    hand2D  = 0.8*unit;
    
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
    //crotch
    pushMatrix();
    translate(0,unit/2,unit/4);
    box(unit);
    popMatrix();
    
    //torso
    pushMatrix();
    //hips
    translate(0,-hipsH/2,0);
    box(hipsW,hipsH,hipsD);
    translate(0,-hipsH/2,0);
    //torsomismo
    translate(0,-torsoH/2,0);
    box(torsoW,torsoH,torsoD);
    translate(0,-torsoH/2,0);
    //chest
    translate(0,-chestH/2,0);
    box(chestW,chestH,chestD);
    translate(0,-chestH/2,0);
    //shoulder L
    pushMatrix();
    translate(-chestW/2-unit/2,unit/2,0);
    box(unit*.6);
    translate(0,unit/2,0);
    //arm L
    translate(0,armH/2,0);
    box(armW,armH,armD);
    translate(0,armH/2,0);
    //elbow L
    translate(0,unit/2,0);
    box(unit*.6);
    translate(0,unit/2,0);
    //forearm L
    translate(0,forearmH/2,0);
    box(forearmW,forearmH,forearmD);
    translate(0,forearmH/2,0);
    //wrist L
    translate(0,unit/2,0);
    box(unit*.6);
    translate(0,unit/2,0);
    //hand L
    translate(0,handH/2,0);
    box(handW,handH,handD);
    translate(0,handH/2,0);
    translate(-handW/2+hand2W/2,hand2H/2,0);
    box(hand2W,hand2H,hand2D);
    popMatrix();
    
    popMatrix();

  }
  void drawLegL(){
  //pierna L
    pushMatrix();
    translate(0,unit/2,0);
    translate(-hipsW/2+unit/2,0,0);
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
    translate(hipsW/2-unit/2,0,0);
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

