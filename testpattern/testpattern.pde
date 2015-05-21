boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight);
  frameRate(96);
  background(255);
  smooth();
  noFill();
  stroke(0);
}

void draw() {
  background(255);
  int num = 2;
  for(int j=0; j < num; j++){
    int k = j+1;
    viewPattern(j, k, num);
  }
}

void viewPattern(int j, int k, int num) {
  for(int i=0; i < 500; i++){
    float x = random(0, height);
    line(width*j/num, x, width*k/num, x);
  }
}
