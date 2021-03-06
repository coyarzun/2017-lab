class TrailParticle{
  int     tailLength = 50;
  ArrayList<PVector> trail;
  float   unit;
  PVector pos;
  
  TrailParticle(PVector p){
    pos = new PVector(p.x,p.y,p.z);
    unit = 16;
    trail = new ArrayList<PVector>();
  }
  void update(){
    trail.add( new PVector(pos.x,pos.y,pos.z) );
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
    box(unit);
    popMatrix();
    for(int i=0; i<trail.size(); i++){
      pushMatrix();
      translate(trail.get(i).x,trail.get(i).y,trail.get(i).z);
      box(unit*.8);
      popMatrix();
    } 
  }
}
