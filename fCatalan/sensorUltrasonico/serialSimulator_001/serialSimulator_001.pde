import processing.serial.*;

Serial   myPort;

void setup() {
  String portName = Serial.list()[2]; 
  myPort = new Serial(this, portName, 9600);
}
void draw(){
  background(0);
  myPort.write(nf(512*(1+sin(radians(frameCount))),2,0));
}
