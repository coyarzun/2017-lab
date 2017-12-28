class VAmbient {
  float windDir, rain, wind;
  float waterAmp, helicoAmp, cycles, xtrangeF;
  float trails, trailScale, xcentricity;
  float noiseScale, perlinV1, perlinV2;
  
  VAmbient() {
  }
  void setWindDir(float v)     { windDir     = map(v,0,1,0,TWO_PI); }
  void setRain(float v)        { rain        = map(v,0,1,0,100); }
  void setWind(float v)        { wind        = v; }//map(v,0,1,0,1); }
  void setWaterAmp(float v)    { waterAmp    = v; }//map(v,0,1,0,1); }
  void setHelicoAmp(float v)   { helicoAmp   = map(v,0,1,0,1); }
  void setCycles(float v)      { cycles      = map(v,0,1,0,1); }
  void setXtrangeF(float v)    { xtrangeF    = map(v,0,1,0,1); }
  void setTrailScale(float v)  { trailScale  = map(v,0,1,0,1); }
  void setTrails(float v)      { trails      = map(v,0,1,0,1); }
  void setXcentricity(float v) { xcentricity = map(v,0,1,0,1); }
  void setNoiseScale(float v)  { noiseScale  = map(v,0,1,0,.5); }
  void setPerlinV1(float v)    { perlinV1    = map(v,0,1,0,1); }
  void setPerlinV2(float v)    { perlinV2    = map(v,0,1,0,1); }
  //void rec(float v)            { if(v==1.0) startRecording();else stopRecording();  }
  void rec(float v)            {}
  void setHalloes(float v)     { halloesOn   = v==1.0; }
  void setInner(float v)       { innerOn     = v==1.0; }
  void setOutline(float v)     { outLineOn   = v==1.0; }
  void sertVertex(float v)     { vertexOn    = v==1.0; }
  void setCycle(float v)       { cycleOn     = v==1.0; }
  void setScroll(float v)      { scrollOn    = v==1.0; }  
  void setThreshold(float v)    { vthreshold  = (int)map(v,0,1,0,255); }
  
}

