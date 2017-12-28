//Kazuki Takamatsu
PImage img;

void setup(){
  img = loadImage("kazuki-takamatsu_beautiful-bizarre_04.jpg");
  size(img.width,img.height,P3D);
  background(img);
}
void draw(){
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  translate(-width/2,-height/2);
  for(int i=0; i<width; i++){
    for(int j=0; j<height; j++){
      int k = i*height+j;
      stroke(255);
      float z = map(brightness(img.pixels[k]),0,255,0,255);
      point(i,j,z);
    }
  }
}
