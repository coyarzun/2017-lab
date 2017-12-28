class Puppet {
  float unit;
  ////please convertir esto en PVectors
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
  float neckW, neckH, neckD;
  float headW, headH, headD;

  ///////ángulos // 9 params por articulacion // mejor obhetos?
  /////////////y esto tb!!
  //float angX,angY,angZ,minAngX,maxAngX,minAngY,maxAngY,minAngZ,maxAngZ  
  //Articulation 
  Articulation hipsAngle, torsoAngle, chestAngle, neckAngle, headAngle;
  Articulation leftShoulderAngle, leftElbowAngle, leftWristAngle, leftHandAngle;
  Articulation rightShoulderAngle, rightElbowAngle, rightWristAngle, rightHandAngle;
  Articulation leftLegAngle, leftKneeAngle, leftAnkleAngle, leftFeetAngle;
  Articulation rightLegAngle, rightKneeAngle, rightAnkleAngle, rightFeetAngle;

  Puppet() {
    setupBody();
    setupArticulations();
  }
  void setupArticulations() {
    hipsAngle          = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, //
    0, 0, 0//PI/4, -PI, PI
    ); 
    torsoAngle         = new Articulation(
    0, -3*PI/4, PI/6, 
    0, 0, 0, 
    0, 0, 0
      ); 
    chestAngle         = new Articulation(
    0, -PI/6, PI/12, 
    0, 0, 0, 
    0, 0, 0
      ); 
    neckAngle          = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      ); 
    headAngle          = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      );
    leftShoulderAngle  = new Articulation(
    0, -PI, 3*PI/4, 
    0, 0, 0, 
    0, 0, 0
      ); 
    leftElbowAngle     = new Articulation(
    0, 0, 3*PI/4, 
    0, 0, 0, 
    0, 0, 0
      ); 
    leftWristAngle     = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      ); 
    leftHandAngle      = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      );
    rightShoulderAngle = new Articulation(
    0, -PI, 3*PI/4,
    0, 0, 0, 
    0, 0, 0
      ); 
    rightElbowAngle    = new Articulation(
    0, 0, 3*PI/4,  
    0, 0, 0, 
    0, 0, 0
      ); 
    rightWristAngle    = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      ); 
    rightHandAngle     = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      );
    leftLegAngle       = new Articulation(
    0, -PI/6, 3*PI/4, 
    0, 0, 0, 
    0, 0, 0
      ); 
    leftKneeAngle      = new Articulation(
    0, -3*PI/4, 0, 
    0, 0, 0, 
    0, 0, 0
      ); 
    leftAnkleAngle     = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      ); 
    leftFeetAngle      = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      );
    rightLegAngle      = new Articulation(
    0, -PI/6, 3*PI/4, 
    0, 0, 0, 
    0, 0, 0
      ); 
    rightKneeAngle     = new Articulation(
    0, -3*PI/4, 0, 
    0, 0, 0, 
    0, 0, 0
      ); 
    rightAnkleAngle    = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      ); 
    rightFeetAngle     = new Articulation(
    0, -PI/6, PI/6, 
    0, 0, 0, 
    0, 0, 0
      );
  }
  void setupBody() {
    unit = 8;

    hipsW = 3*unit;
    hipsH = 2*unit;
    hipsD = 1*unit;

    torsoW = 2*unit;
    torsoH = 2*unit;
    torsoD = 1*unit;

    chestW = 3*unit;
    chestH = 3*unit;
    chestD = 1.5*unit;

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

    neckW   = 1*unit;
    neckH   = 1*unit;
    neckD   = 1*unit;

    headW   = 2*unit;
    headH   = 2.5*unit;
    headD   = 2*unit;

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
  void update() {
    updateArticulations();
  }
  void draw() {
    drawTorso();
  }
  void drawTorso() {


    //torso
    pushMatrix();
    translate(0, unit/2, 0);
    hipsAngle.apply();
    drawCrotch();
    //hips
    drawLegL();
    drawLegR();
    translate(0, -hipsH/2, 0);

    box(hipsW, hipsH, hipsD);
    translate(0, -hipsH/2, 0);
    //torsomismo
    torsoAngle.apply();
    translate(0, -torsoH/2, 0);
    box(torsoW, torsoH, torsoD);
    translate(0, -torsoH/2, 0);
    //chest
    chestAngle.apply();
    translate(0, -chestH/2, 0);
    box(chestW, chestH, chestD);
    translate(0, -chestH/2, 0);

    //left Arm
    drawArmL();
    drawArmR();
    drawHead();
    popMatrix();
  }
  void drawHead() {
    pushMatrix();
    //neck
    neckAngle.apply();
    translate(0, -neckH/2, 0);
    box(neckW, neckH, neckD);
    translate(0, -neckH/2, 0);
    //head mism
    headAngle.apply();
    translate(0, -headH/2, headD/3-neckD/2);
    box(headW, headH, headD);
    popMatrix();
  }
  void drawCrotch() {
    //crotch
    pushMatrix();
    translate(0, unit/2, unit/4);
    box(unit);
    popMatrix();
  }
  void drawArmL() {
    //shoulder L
    pushMatrix();
    translate(-chestW/2-unit/2, unit/2, 0);
    
    leftShoulderAngle.apply();
    box(unit*.6);
    translate(0, unit/2, 0);
    //arm L
    translate(0, armH/2, 0);
    box(armW, armH, armD);
    translate(0, armH/2, 0);
    //elbow L
    translate(0, unit/2, 0);
    leftElbowAngle.apply();
    box(unit*.6);
    translate(0, unit/2, 0);
    //forearm L
    translate(0, forearmH/2, 0);
    box(forearmW, forearmH, forearmD);
    translate(0, forearmH/2, 0);
    //wrist L
    translate(0, unit/2, 0);
    leftWristAngle.apply();
    box(unit*.6);
    translate(0, unit/2, 0);
    //hand L
    translate(0, handH/2, 0);
    box(handW, handH, handD);
    translate(0, handH/2, 0);
    leftHandAngle.apply();
    translate(-handW/2+hand2W/2, hand2H/2, 0);
    box(hand2W, hand2H, hand2D);
    popMatrix();
  }
  void drawArmR() {
    //shoulder R
    pushMatrix();
    translate(chestW/2+unit/2, unit/2, 0);
    rightShoulderAngle.apply();
    box(unit*.6);
    
    translate(0, unit/2, 0);
    //arm R
    translate(0, armH/2, 0);
    box(armW, armH, armD);
    translate(0, armH/2, 0);
    //elbow R
    translate(0, unit/2, 0);
    rightElbowAngle.apply();
    box(unit*.6);
    translate(0, unit/2, 0);
    //forearm R
    translate(0, forearmH/2, 0);
    box(forearmW, forearmH, forearmD);
    translate(0, forearmH/2, 0);
    //wrist R
    translate(0, unit/2, 0);
    rightWristAngle.apply();
    box(unit*.6);
    translate(0, unit/2, 0);
    //hand R
    translate(0, handH/2, 0);
    box(handW, handH, handD);
    
    rightHandAngle.apply();
    translate(0, handH/2, 0);
    translate(handW/2-hand2W/2, hand2H/2, 0);
    box(hand2W, hand2H, hand2D);
    popMatrix();
  }
  void drawLegL() {
    //pierna L
    pushMatrix();
    
    translate(0, unit/2, 0);
    translate(-hipsW/2+unit/2, 0, 0);
    box(unit*.6);
    leftLegAngle.apply();
    translate(0,unit/2,0);
    translate(0, leg1H/2, 0);
    box(leg1W, leg1H, leg1D);
    //knee L
    
    translate(0, leg1H/2, 0);
    translate(0, unit/2, 0);
    box(unit*.6);
    //rotateX(radians(frameCount));
    
    leftKneeAngle.apply();
    
    translate(0, unit/2, 0);
    translate(0, leg2H/2, 0);
    box(leg2W, leg2H, leg2D);
    //ankle
    translate(0, leg2H/2, 0);
    translate(0, unit/2, 0);
    box(unit*.6);
    leftAnkleAngle.apply();
    //heel
    translate(0, heelH/2, 0);
    box(heelW, heelH, heelD);
    
    leftFeetAngle.apply();
    //foot
    translate(0, heelH/2-feetH/2, feetD/2);
    box(feetW, feetH, feetD);
    popMatrix();
  }
  void drawLegR() {
    //pierna R
    pushMatrix();
    
    translate(0, unit/2, 0);
    translate(hipsW/2-unit/2, 0, 0);
    box(unit*.6);
    rightLegAngle.apply();
    translate(0,unit/2,0);
    
    translate(0, leg1H/2, 0);
    box(leg1W, leg1H, leg1D);
    //knee L
    translate(0, leg1H/2, 0);
    translate(0, unit/2, 0);
    box(unit*.6);
    rightKneeAngle.apply();
    //rotateX(radians(frameCount));
    translate(0, unit/2, 0);
    translate(0, leg2H/2, 0);
    box(leg2W, leg2H, leg2D);
    //ankle
    translate(0, leg2H/2, 0);
    translate(0, unit/2, 0);
    box(unit*.6);
    rightAnkleAngle.apply();
    //heel
    translate(0, heelH/2, 0);
    box(heelW, heelH, heelD);
    rightFeetAngle.apply();
    //foot
    translate(0, heelH/2-feetH/2, feetD/2);
    box(feetW, feetH, feetD);
    popMatrix();
  }
  void updateArticulations(){
    hipsAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
    torsoAngle.setAndNormalizeX( sin( radians(frameCount+10) ) );
    chestAngle.setAndNormalizeX( sin( radians(frameCount+20) ) );
    neckAngle.setAndNormalizeX(  2*sin( radians(frameCount+30) ) );
    headAngle.setAndNormalizeX(  2*sin( radians(frameCount+40) ) );
    
    leftLegAngle.setAndNormalizeX(   sin( radians(frameCount-10) ) );
    leftKneeAngle.setAndNormalizeX(  sin( radians(frameCount-20) ) );
    leftAnkleAngle.setAndNormalizeX( sin( radians(frameCount-30) ) );
    leftFeetAngle.setAndNormalizeX(  sin( radians(frameCount-40) ) );
    
    rightLegAngle.setAndNormalizeX(   cos( radians(frameCount-10) ) );
    rightKneeAngle.setAndNormalizeX(  cos( radians(frameCount-20) ) );
    rightAnkleAngle.setAndNormalizeX( cos( radians(frameCount-30) ) );
    rightFeetAngle.setAndNormalizeX(  cos( radians(frameCount-40) ) );
    
    leftShoulderAngle.setAndNormalizeX(   cos( radians(frameCount-10) ) );
    leftElbowAngle.setAndNormalizeX(  cos( radians(frameCount-20) ) );
    leftWristAngle.setAndNormalizeX( cos( radians(frameCount-30) ) );
    leftHandAngle.setAndNormalizeX(  cos( radians(frameCount-40) ) );
    
    rightShoulderAngle.setAndNormalizeX( sin( radians(frameCount-10) ) );
    rightElbowAngle.setAndNormalizeX(  sin( radians(frameCount-20) ) );
    rightWristAngle.setAndNormalizeX( sin( radians(frameCount-30) ) );
    rightHandAngle.setAndNormalizeX(  sin( radians(frameCount-40) ) );
   
  }
}

