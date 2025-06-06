float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeColR = 150;
float _strokeColG = 220;
float _strokeColB = 100;
int _strokeChange = -1;

void setup() {
  size(1000, 1000); 
  smooth();
  frameRate(30);
  background(255);
  noFill();
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}

void draw() {
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 550) +1;
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }
  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerX = width/2 + (noise(_xnoise) * 100) - 50;
  float centerY = height/2 + (noise(_ynoise) * 100) - 50;
  float rad = radians(_angle);
  float x1 = centerX + (_radius * cos(rad));
  float y1 = centerY + (_radius * sin(rad));
  float opprad = rad + PI;
  float x2 = centerX + (_radius * cos(opprad));
  float y2 = centerY + (_radius * sin(opprad));
  _strokeColR += _strokeChange;
  _strokeColG += _strokeChange;
  _strokeColB += _strokeChange;
  if (_strokeColR > 125) { _strokeChange = -1; }
  if (_strokeColR < 0) { _strokeChange = 1; }
  if (_strokeColG > 254) { _strokeChange = -1; }
  if (_strokeColG < 0) { _strokeChange = 1; }
  if (_strokeColB > 254) { _strokeChange = -1; }
  if (_strokeColB < 0) { _strokeChange = 1; }
  stroke(_strokeColR, _strokeColG, _strokeColB,60);
  strokeWeight(1); 
  line(x1, y1, x2, y2);
}
