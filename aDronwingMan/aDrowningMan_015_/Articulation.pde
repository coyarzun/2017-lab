class Articulation{
  PVector angles, minAngles, maxAngles;
  
  Articulation(float ax, float minx, float maxx, 
               float ay, float miny, float maxy, 
               float az, float minz, float maxz){
    angles = new PVector(ax,ay,az);
    minAngles = new PVector(minx,miny,minz);
    maxAngles = new PVector(maxx,maxy,maxz);
  }
  void setAndNormalizeX(float v){
    v = constrain(v,-1.0,1.0);
    angles.x = map(v,-1.0,1.0,minAngles.x,maxAngles.x);
  }
  void setAndNormalizeY(float v){
    v = constrain(v,-1.0,1.0);
    angles.y = map(v,-1.0,1.0,minAngles.y,maxAngles.y);
  }
  void setAndNormalizeZ(float v){
    v = constrain(v,-1.0,1.0);
    angles.z = map(v,-1.0,1.0,minAngles.z,maxAngles.z);
  }
  void normalizeAll(PVector v){
    v.x = constrain(v.x,0.0,1.0);
    v.y = constrain(v.y,0.0,1.0);
    v.z = constrain(v.z,0.0,1.0);
    angles.x = map(v.x,0.0,1.0,minAngles.x,maxAngles.x);
    angles.y = map(v.y,0.0,1.0,minAngles.y,maxAngles.y);
    angles.z = map(v.z,0.0,1.0,minAngles.z,maxAngles.z);
  }
  void apply(){
    rotateX(angles.x);
    rotateY(angles.y);
    rotateZ(angles.z);
  }
  void reset(){
    angles.x = 0;
    angles.y = 0;
    angles.z = 0;
  }
}
