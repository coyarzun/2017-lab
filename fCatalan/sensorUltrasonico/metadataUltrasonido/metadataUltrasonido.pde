import processing.serial.*;

Serial leerPuerto;  //Crea un objeto de clase serial
int valor;     //Datos recibidos por el Puerto serial
String[] history;
int   hCounter;

void setup() {
  String portName = Serial.list()[0]; 
  //cambiar 0, 1 o el que sea al número de puerto que estés usando
  leerPuerto =new Serial(this, portName, 9600);
  history = new String[3];hCounter = 0;
  size(600, 600, P3D);
  
}

void draw() {
  background(#000000);
  while (leerPuerto.available() > 0) {
    String inBuffer = leerPuerto.readString(); 
    trim(inBuffer);
    if (inBuffer != null) {
      println(inBuffer);
      valor = int(inBuffer);
      history[hCounter] = inBuffer;
      hCounter++; hCounter%=history.length;
    }
  }
  /*if (leerPuerto.available() >0) {  //Si existe data,  
    valor = leerPuerto.read();
  } 
  
*/
//println(valor);//Lo muestra por consola
  if (valor > 0 && valor<3000); // ARREGLAR. poner numero de distancia correspondiente
  textSize(32);
  fill(0, 102, 153, 204);
  for (int i = 0; i < history.length; i++) 
    text("metadata;" + history[i], 12, 32+i*32);  // 4to valor especifica z-axis
  /*delay(1000);
  */
}