int numPoints = 1200;     
int numSpheres = 4;
float lengthLimit = 70;

Point[] pointArr;
Sphere[] sphereArr;

void setup(){
  size(1280, 800, P3D);
  
  sphereArr = new Sphere[numSpheres];
  for (int i = 0; i < numSpheres; i++){
    sphereArr[i] = new Sphere();
  }
  
  pointArr = new Point[numPoints];
  for (int i = 0; i < numPoints; i++){
    pointArr[i] = new Point();
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < sphereArr.length; i++){
    sphereArr[i].update();
  }
  for(int i = 0; i < pointArr.length; i++){
    pointArr[i].update();
  }
 
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.01);
  
  for(int i = 0; i < pointArr.length; i++){
    Point fromP = pointArr[i];
    stroke(fromP.col, 128);
    for (int j = 0; j < pointArr.length; j++){
      Point toP = pointArr[j];
      float dist = dist(fromP.x, fromP.y, fromP.z, toP.x, toP.y, toP.z);
      if (dist < lengthLimit){
        line(fromP.x, fromP.y, fromP.z, toP.x, toP.y, toP.z);
      }
    }
  }
}

class Sphere{
  float radius;
  float radNoise;
  
  Sphere(){
     radNoise = random(10);
  }
  
  void update(){
    radius = 30 + noise(radNoise) * 600;
    radNoise += 0.01;
  }
}

class Point{
  float x, y, z;
  float a, b, c;
  color col;
  Sphere myS;
  
  Point(){
    float s = radians(random(360));
    float t = radians(random(360));
    a = cos(s) * sin(t);
    b = sin(s) * sin(t);
    c = cos(t);
    myS = sphereArr[int(random(numSpheres))];
    col = color(0, random(128), random(128), 128);
  }
  
  void update(){
    x = myS.radius * a;
    y = myS.radius * b;
    z = myS.radius * c;
  } 
}
