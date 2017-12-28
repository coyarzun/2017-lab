const int pinEcho = 10;
const int pinTrig = 9;
const int ledPinA = 3;
const int ledPinB = 2;

long duracion;
int distancia;
int distanciaSegura;


void setup() {
  pinMode(pinTrig, OUTPUT); // definir pinTrig como Output
  pinMode(pinEcho, INPUT); // definir pinEcho como Input
  pinMode(ledPinA, OUTPUT); // definir tira A de leds como salida
  pinMode(ledPinB, OUTPUT); // definir tira B de leds como salida
  Serial.begin(9600); // comunicacion serial

}

void loop() {
  // Clears the trigPin
  digitalWrite(pinTrig, LOW);
  delayMicroseconds(0);

  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(pinTrig, HIGH);
  delayMicroseconds(0);
  digitalWrite(pinTrig, LOW);

  // Reads the echoPin, returns the sound wave travel time in microseconds
  duracion = pulseIn(pinEcho, HIGH);

  // Calculating the distance
  distancia= duracion*0.034/2;

  if (distancia <= 450){
    digitalWrite(ledPinA, HIGH);
    digitalWrite(ledPinB, HIGH);
  }
  else{
    digitalWrite(ledPinA, LOW);
    digitalWrite(ledPinB, LOW);
  }
  // Prints the distance on the Serial Monitor
  //Serial.print("Distancia: ");
  Serial.println(distancia);
  delay(1000/60);
 

}
