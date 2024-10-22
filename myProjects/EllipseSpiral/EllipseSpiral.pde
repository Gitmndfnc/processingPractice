/* 
* Disegna una spirale ellittica mostrando la differenza tra casualità e rumore di Perlin
*/
float a; // semiasse maggiore dell'ellisse
float b; // semiasse minore dell'ellisse
float alpha; // angolo
float stepa, stepb; // incrementi degli assi
float lastx, lasty, x, y; // coordinate precedenti e correnti
float noi; // rumore di Perlin 
float variance; // varianza degli assi

void setup() {
  size(600, 400); 
  background(255);
  smooth(); 
  stroke(20, 50, 70);
  strokeWeight(5);
  a = 0;
  b = 0;
  stepa = 0.2;
  stepb = 0.1;
  // punto iniziale
  alpha = 0;
  x = width/2;
  y = height/2;
  // seme iniziale scelto in modo casuale
  noi = random(10);
  variance = 200;
}


void draw() {
  lastx = x;
  lasty = y;  
  float mya, myb;
  
  // rumore
  mya = a + (noise(noi) - 0.5) * variance;
  myb = b + (noise(noi) - 0.5) * variance;
  
  // casualità
  //mya = a + (random(1) - 0.5) * variance;
  //myb = b + (random(1) - 0.5) * variance;

  // calcolo le coordinate di un punto sull'ellisse
  x = width/2 +  mya * cos(alpha);
  y = height/2 + myb * sin(alpha);

  // unisco con una linea il punto corrente e quello precedente
  line(x, y, lastx, lasty);

  // incremento l'angolo
  alpha = alpha + radians(1); 
  
  // incremento gli assi dell'ellisse
  a = a + stepa;
  b = b + stepb;
  
  // incremento il seme del rumore di Perlin
  noi = noi + 0.05;
  
}
