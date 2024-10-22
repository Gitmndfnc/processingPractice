float xstart, xnoise, ystart, ynoise, xStartNoise, yStartNoise;

void setup() {
 
  size(300,300);
  smooth();
  background(0);
  frameRate(2);
  xstart = random(10);
  ystart = random(10);
  xStartNoise = random(20);
  yStartNoise = random(20);
}

void draw() {
  background(255);
  xStartNoise +=0.01;
  yStartNoise+=0.01;
  xstart+=(noise(xStartNoise) * 0.5) - 0.25;
  ystart+=(noise(yStartNoise) * 0.5) - 0.25;
  
  xnoise = xstart;
  ynoise = ystart;
  
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));  
    }
  }
}


void drawPoint(float x, float y, float noiseFactor){
 
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor * radians(360));
  stroke(0, 150);
  line(0,0,20,0);
  popMatrix();
  
}
