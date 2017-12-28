//inspired on Aphex Twin - Orphans cover
color[] colors;

void setup(){
  size(400,400);
  colorMode(HSB);
  colors = new color[8];
  for(int i=0; i<colors.length; i++){
    colors[i] = color(i*256/colors.length, 255, 255);
  }
  background(0);
}
void draw(){
  if(mousePressed){
    for(int i=0; i<colors.length; i++){
      stroke(colors[i]);
      int s = 8;
      line(pmouseX+i*s, pmouseY-i*s, mouseX+i*s, mouseY-i*s);
    }
  }
}
