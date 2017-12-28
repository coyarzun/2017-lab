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

for(int j=0; j<3; j++){
float total = 0f;

println("-------------------------------------------");
println(
(j==2?"Cable Eléctrico ":
("Cable plug/plug "+(j==0?"Stereo":"Mono")+" 3.5\" ")
)+"( "+slaves+"x )");
println("-------------------------------------------");
for(int i=0; i<slaves; i++){
  float val = (j==2?energyCableToFloor:audioCableToFloor)+
          toEnterWall+
          toCurve+
          toNext*i+
          toEndWall+
          (j==2?energyCableUpToMaster:audioCableUpToMaster);
  total+=val;
  println("+"+nf(val,2)+" mts ");
}
println("-------------------------------------------");
println("--------->+~"+total+" mts ");
}
