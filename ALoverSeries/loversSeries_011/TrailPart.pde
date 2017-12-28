class TrailParticle{
  int     tailLength = 50;
  ArrayList<PVector> trail;
  ArrayList<PVector> trailAng;
  float   unit;
  PVector pos, ang;
  
  TrailParticle(PVector p){
    pos = new PVector(p.x,p.y,p.z);
    ang = new PVector(random(TWO_PI),random(TWO_PI),random(TWO_PI));
    unit = 8;
    trail = new ArrayList<PVector>();
    trailAng = new ArrayList<PVector>();
  }
  void update(){
    trail.add( new PVector(pos.x,pos.y,pos.z) );
    trailAng.add( new PVector(ang.x,ang.y,ang.z) );
    pos.x+= random(-unit,unit);
    pos.y-= unit;
    pos.z+= random(-unit,unit);
    pos.x = constrain(pos.x,-width/4,width/4);
    pos.z = constrain(pos.z,-width/4,width/4);
    
    if(trail.size()>tailLength)trail.remove(0);
  }
  void draw(){
    fill(255);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    //if(doLights)
    noStroke();
    if(doRumble){rotateX(ang.x);rotateY(ang.y);rotateZ(ang.z);}
    box(unit);
    popMatrix();
    for(int i=0; i<trail.size(); i++){
      fill(255,doAlpha?map(i,0,tailLength,0,255):255);
      pushMatrix();
      translate(trail.get(i).x,trail.get(i).y,trail.get(i).z);
      if(doRumble){
        rotateX(trailAng.get(i).x);rotateY(trailAng.get(i).y);rotateZ(trailAng.get(i).z);
      }
      box(unit*.8);
      popMatrix();
    } 
  }
}
