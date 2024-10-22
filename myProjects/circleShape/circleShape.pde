void setup(){
  size(500,500); 
  background(255);
  strokeWeight(5);
  smooth();
  
  float radius = 100;
  int centX = 250;
  int centY = 250; 
  
  
  stroke(0,30);
  noFill();
  ellipse(centX,centY,radius*2,radius*2); 
  
  stroke(10,130,70);
  strokeWeight(1);
  
  float x,y;
  float noiseVal = random(2); 
  float redVariance, thisRadius,rad;
  beginShape();
  fill(20,160,70,50);
  
  for(float ang = 0; ang <=360; ang+=1){
    
    noiseVal += 0.1;
    redVariance = 30 * customNoise(noiseVal);
    
    thisRadius = radius + redVariance; 
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    
    curveVertex(x,y);
  }
  endShape();
}


float customNoise(float value){
  int count = int(value % 12);
  float retValue = pow(cos(value),count);
  return retValue;
}
