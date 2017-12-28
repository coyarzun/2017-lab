//Kazuki Takamatsu
PImage img;

void setup(){
  //img = loadImage("kazuki-takamatsu_beautiful-bizarre_04.jpg");
  //img = loadImage("KAZUKI-TAKAMATSU_‘Please-Come-In’-acrylic-acrylic-gouache-medium-chalk-giclee-on-tarpoulin-39-x-39-detail.jpg");
  //img = loadImage("KAZUKI-TAKAMATSU-2016-01.jpg");
  //img = loadImage("Player-Piano-575x575.jpg");
  //img = loadImage("a24682382961_37a8b17731_o.jpg");
  //img = loadImage("a26567752495_dbb1f04c4b_z.jpg");
  img = loadImage("Kazuki-Takamatsu-yatzer_9.jpg");
  size(img.width,img.height,P3D);
  
}
void draw(){
  int d= 4;
  background(0);
  translate(width/2,height/2, -width/2);
  rotateY(radians(frameCount));
  translate(-width/2,-height/2);
  for(int i=0; i<width; i+=d){
    for(int j=0; j<height; j+=d){
      int k = i+j*width;//i*height+j;
      stroke(255);strokeWeight(1);
      float z = map(brightness(img.pixels[k]),0,255,0,255);
      point(i,j,z);
    }
  }
}
