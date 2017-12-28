import processing.serial.*;

Serial   myPort;  //Crea un objeto de clase serial
int      valor;     //Datos recibidos por el Puerto serial
String[] history;
int      hCounter;
int      screen = 0;

void setup() {
  println(Serial.list());
  //cambiar 0, 1 o el que sea al número de puerto que estés usando
  String portName = Serial.list()[0];
  ///////////////
  myPort  = new Serial(this, portName, 9600);
  int      lf = 13;      // ASCII carriage return
  myPort.bufferUntil(lf); 
  ///////////////
  history = new String[10];
  hCounter = 0;
  ///////////////
  size(600, 600, P3D);
}


void draw(){
  switch(screen){
    case 0:
      drawA();
      delay(2000);
      screen = 1;
      break;
    case 1:
      drawB();
      delay(2000);
      screen = 2;
      break;
    case 2:
      drawC();
      break;
  }
}
void drawA(){
  background(0);
  textSize(32);
  fill(0, 102, 153, 204);
  text("helloworld A", 12, 32);
}
void drawB(){
  background(0);
  textSize(32);
  fill(0, 102, 153, 204);
  text("helloworld B", 12, 32);
}
void drawC() {
  background(0);
  textSize(32);
  fill(0, 102, 153, 204);
  for (int i = 0; i < history.length; i++) {
    text("metadata;" + history[i], 12, 32+i*32);
  }
  println(valor);
}
void serialEvent(Serial p) { 
  String inString = p.readString();
  inString = trim(inString);
  valor = int(inString);
  ///////////////
  history[hCounter] = inString;
  hCounter++; 
  hCounter%=history.length;
}

