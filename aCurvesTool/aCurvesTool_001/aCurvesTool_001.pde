//cubic bezier dev

PFont     font;
BGUI  gui;

void setup() {
  size(400, 400);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw", 8);
  gui = new BGUI();
}
void draw() {
  background(255);
  gui.draw();
}
void mousePressed(){
  gui.mousePressed();
}//
void mouseReleased(){
  gui.mouseReleased();
}//mouseReleased


