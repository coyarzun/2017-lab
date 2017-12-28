class Piano{
  int   ckeys, whites, blacks, scales, mods;
  PianoKey[] keys;
  
  Piano(){
    ckeys = 88;
    whites = 0;
    blacks = 0;
    scales = ckeys/12;
    keys = new PianoKey[ckeys];
    
    for(int i=0; i<ckeys; i++){
      mods = i%12;
      if(mods==0 || mods==2 || mods==4 || mods==5 || mods==7 || mods==9 || mods==11 ){
        whites++;
        keys[i] = new PianoKey(i,false);
      }else{
        blacks++;
        keys[i] = new PianoKey(i,true);
      }
    }
    println(ckeys+" keys, "+scales+" scales+"+mods+". "+whites+" whites / "+blacks+" blacks");
  }
  void draw(){
    if(doLights)noStroke();
    else stroke(0);
    pushMatrix();
    drawKeyboard();
    popMatrix();
  }
  void drawKeyboard(){
    pushMatrix();
    translate(-whites*unit/2,0);
    translate(unit/2,0);
    for(int i=0; i<keys.length; i++){
      keys[i].draw();
      translate((keys[i].isBlack? unit/2:keys[i+1].isBlack?unit/2:unit),0);
    }
    popMatrix();
  }
}
