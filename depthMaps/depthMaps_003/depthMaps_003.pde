//Kazuki Takamatsu
String[] names = {
  
  "0e5c2877213e6a5c523920e9ea2e0d9e--gouache-painting-map-art.jpg",
  "64acd6253c1257263769e640978deabe--gouache-painting-acrylic-paintings.jpg",
  "kazuki-takamatsu_beautiful-bizarre_04.jpg",
  "KAZUKI-TAKAMATSU_‘Please-Come-In’-acrylic-acrylic-gouache-medium-chalk-giclee-on-tarpoulin-39-x-39-detail.jpg",
  "KAZUKI-TAKAMATSU-2016-01.jpg",
  "Player-Piano-575x575.jpg",
  "a24682382961_37a8b17731_o.jpg",
  "a26567752495_dbb1f04c4b_z.jpg",
  "Kazuki-Takamatsu-yatzer_9.jpg",
  "391359278f41af071fb8aef096a75a99--gouache-painting-kawaii-art.jpg"
  };
PImage[]img;
int w = 0;

void setup(){
  size(800,800,P3D);
  img = new PImage[names.length];
  for(int i=0; i<img.length; i++){
    img[i] = loadImage(names[i]);
  }
}
void draw(){
  int d= 4;
  background(0);
  translate(width/2,height/2, -width/2);
  rotateY(radians(frameCount));
  translate(-img[w].width/2,-img[w].height/2);
  for(int i=0; i<img[w].width; i+=d){
    for(int j=0; j<img[w].height; j+=d){
      int k = i+j*img[w].width;//i*height+j;
      stroke(255);strokeWeight(1);
      float z = map(brightness(img[w].pixels[k]),0,255,0,img[w].width/4);
      point(i,j,z);//, i,j,0);
    }
  }
}
void keyPressed(){
  if(keyCode==38){w--;if(w<0)w+=img.length;}
  if(keyCode==40){w++;w%=img.length;}
}
