size(500,500);
background(0);
strokeWeight(0.5);
smooth();

int centX = 250; 
int centY = 250;

float x,y;

for(int i= 0 ; i<300; i++){
  float lastX = -999; 
  float lastY = -999; 
  float radiusNoise = random(10);
  float radius = 10; 
  stroke(random(200), random(130), random(120));
  
  int startAngle = int(random(360));
  int endAngle = 1440 + int(random(1440));
  int angleStep = 5 + int(random(3));
  
  for(float ang = startAngle; ang <= endAngle; ang += angleStep){
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
}  
