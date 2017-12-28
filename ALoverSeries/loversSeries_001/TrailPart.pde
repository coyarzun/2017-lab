class TrailParticle{
  ArrayList<PVector> trail;
  float   unit;
  PVector pos;
  
  TrailParticle(PVector p){
    pos = new PVector(p.x,p.y,p.z);
    unit = 8;
    trail = new ArrayList<PVector>();
  }
  void update(){
    trail.add( new PVector(pos.x,pos.y,pos.z) );
    pos.x+= random(-unit,unit);
    pos.y-= unit;
    pos.z+= random(-unit,unit);
  }
  void draw(){
    fill(255);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
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
