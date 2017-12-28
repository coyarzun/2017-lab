float side;
float audioCableToFloor, energyCableToFloor;
float toEnterWall, toCurve, toNext, toEndWall;
float audioCableUpToMaster, energyCableUpToMaster;

int slaves = 7;
//unit mts?
side                  = 2f;
audioCableToFloor     = 1.2f;
energyCableToFloor    = 1f;
toEnterWall           =  .2f;
toCurve               =  .2f;
toNext                = side+.2f;
toEndWall             = side*.5+.2f;
audioCableUpToMaster  = 1.4f;
energyCableUpToMaster = 1.2f;

float total = 0f;

println("-------------------------------------------");
println("Cable plug/plug Stereo 3.5” ( "+slaves+"x )");
println("-------------------------------------------");
for(int i=0; i<slaves; i++){
  float val = audioCableToFloor+
          toEnterWall+
          toCurve+
          toNext*i+
          toEndWall+
          audioCableUpToMaster;
  total+=val;
  println("+"+val+" mts ");
}
println("-------------------------------------------");
println("--------->+~"+total+" mts ");
