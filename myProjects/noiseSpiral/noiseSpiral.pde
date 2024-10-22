size(500,500);
background(255);
strokeWeight(5);
smooth();

float radius = 10; 
float x,y; 
float lastX = -999; 
float lastY = -999;
float radiusNoise = random(10); 
float centX = 250;
float centY = 250;

for(float ang = 0; ang <= 1440; ang +=5){
  radiusNoise+=0.05;
  radius+=0.5;
  float thisRadius = radius + (noise(radiusNoise)*200)-100;
  float rad = radians(ang);
  x = centX + (thisRadius * cos(rad));
  y = centY + (thisRadius * sin(rad)); 
  
  if(lastX>-999){
    line(x,y,lastX,lastY);
  }
  
  lastX = x; 
  lastY = y; 
  
}
