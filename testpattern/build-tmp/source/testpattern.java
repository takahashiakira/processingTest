import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class testpattern extends PApplet {

public boolean sketchFullScreen() {
  return true;
}

public void setup() {
  size(displayWidth, displayHeight);
  frameRate(96);
  background(255);
  smooth();
  noFill();
  stroke(0);
}

public void draw() {
  background(255);
  int num = 2;
  for(int j=0; j < num; j++){
    int k = j+1;
    viewPattern(j, k, num);
  }
}

public void viewPattern(int j, int k, int num) {
  for(int i=0; i < 500; i++){
    float x = random(0, height);
    line(width*j/num, x, width*k/num, x);
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "testpattern" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
