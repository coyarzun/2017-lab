class Piano{
  int   ckeys, whites, blacks, octaves, mods;
  float   boxw, boxh, boxd;
  
  PianoKey[] keys;
  
  Piano(){
    ckeys = 88;
    octaves = ckeys/12;
    mods    = ckeys%12;
    setup();
  }
  Piano(int k){
    ckeys = k;
    octaves = ckeys/12;
    mods    = ckeys%12;
    setup();
  }
  Piano(int o, int xk){
    octaves = o;//ckeys/12;
    mods    = xk;
    ckeys = o*12+xk;
    setup();
  }
    
   
  void setup(){
    whites = 0;
    blacks = 0;
    
    keys = new PianoKey[ckeys];
    
    boxw= 2*unit;
    
    for(int i=0; i<ckeys; i++){
      int aux = i%12;
      if(aux==0 || aux==2 || aux==4 || aux==5 || aux==7 || aux==9 || aux==11 ){
        whites++;
        keys[i] = new PianoKey(i,false);
        boxw+=unit;
      }else{
        blacks++;
        keys[i] = new PianoKey(i,true);
      }
    }
    println(ckeys+" keys, "+octaves+" octaves+"+mods+". "+whites+" whites / "+blacks+" blacks");
    boxh = (random(1.5,2))*unit;
    boxd = (random(5,20))*unit;
  }
  void draw(){
    if(doLights)noStroke();
    else stroke(0);
    pushMatrix();
    drawKeyboard();
    drawBody();
    popMatrix();
  }
  void drawBody(){
    fill(255);
    pushMatrix();
    translate(0,unit,-boxd/2);
    translate(0,0,4.5*unit);
    box(boxw,unit,boxd);
    popMatrix();
    pushMatrix();
    translate(0,-boxh/2+unit/2,-(+boxd-4.5*unit)/2);
    box(boxw,boxh,boxd-4.5*unit);
    translate(0,-unit/2,0);
    rotateX(radians(-15));
    box(boxw-unit,boxh,boxd-4.5*unit-unit);
    popMatrix();
    
    pushMatrix();
    translate(-boxw/2+unit/2,unit/4,4.5*unit/2);
    rotateX(radians(-15));
    box(1.1*unit,2*unit,4.5*unit);
    popMatrix();
    
    pushMatrix();
    translate(boxw/2-unit/2,unit/4,4.5*unit/2);
    rotateX(radians(-15));
    box(1.1*unit,2*unit,4.5*unit);
    popMatrix();
  }
  void drawKeyboard(){
    pushMatrix();
    translate(-whites*unit/2,0);
    translate(unit/2,0);
    for(int i=0; i<keys.length; i++){
      keys[i].draw();
      if(i<keys.length-1)translate((keys[i].isBlack? unit/2:keys[i+1].isBlack?unit/2:unit),0);
    }
    popMatrix();
  }
}
