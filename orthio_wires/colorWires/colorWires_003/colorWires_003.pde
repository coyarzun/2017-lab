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
    int s = 4;
    noStroke(); fill(0);
    quad(
    pmouseX, pmouseY,
    mouseX, mouseY,
    mouseX+colors.length*s, mouseY-colors.length*s,
    pmouseX+colors.length*s, pmouseY-colors.length*s
    );
    for(int i=0; i<colors.length; i++){
      stroke(colors[i]);
      strokeWeight(s/2);
      line(pmouseX+i*s, pmouseY-i*s, mouseX+i*s, mouseY-i*s);
    }
  }
}
