float sinPoint[];
float cosPoint[];
float status[];
int style[];
int num;

void setup(){ 
  size(1280, 800, P3D);
  
  sinPoint = new float[360];
  cosPoint = new float[360];
  float angle;
  
  for (int i = 0; i < 360; i++){
    angle = radians(i);
    sinPoint[i] = sin(angle);
    cosPoint[i] = cos(angle);
  }
  num = 100; 
  status = new float[6*num];
  style  = new int[2*num];
  int index = 0; 
 
  for(int i = 0; i < num; i++){
    status[index++] = random(360);     // X軸の回転
    status[index++] = random(360);     // Y軸の回転 
    status[index++] = random(90,270);  // 角度
    status[index++] = random(100,450); // 半径
    status[index++] = random(5, 10);   // 幅
    status[index++] = random(0.01);    // 回転速度
    
    int r = (int)random(3);
    switch(r){
      case 0 : style[i*2] = color(0, 100+random(50), 150, random(255)); break;
      case 1 : style[i*2] = color(255, 80, random(50), random(255)); break;
      case 2 : style[i*2] = color(255, random(255)); break;
    }
    style[i*2+1] = int(random(3));
  }
  
  noFill();
  strokeWeight(1);
}

void draw(){ 
  background(35); 
  translate(width/2,height/2,0); 
  rotateY(frameCount*0.01);

  int index=0; 
  for(int i = 0; i < num; i++){ 
    pushMatrix();
    rotateX(status[index++]);
    rotateY(status[index++]);
    switch(style[i*2+1]){
      case 0 : stroke(style[i*2]);
               arcEllipse( status[index++], status[index++], status[index++] );
               break;
      case 1 : stroke(style[i*2]);
               arcRect( status[index++], status[index++], status[index++] );
               break;
      case 2 : stroke(style[i*2]);
               arcTriangles( status[index++], status[index++], status[index++] );
               break;
    }
    status[index-5] += status[index];
    status[index-4] += status[index];
    index++;
    popMatrix(); 
  }
}

void arcEllipse(float deg,float rad,float wid){
  for(int i = 0; i < deg; i += 4){
    pushMatrix();
    translate(cosPoint[i]*rad, sinPoint[i]*rad);
    rotate(radians(i));
    ellipse(0, 0, wid, wid);
    popMatrix();
  }
} 
void arcRect(float deg,float rad,float wid){
  for(int i = 0; i < deg; i += 4){
    pushMatrix();
    translate(cosPoint[i]*rad, sinPoint[i]*rad);
    rotate(radians(i));
    rect(0, 0, wid, wid);
    popMatrix();
  }
} 
void arcTriangles(float deg,float rad,float wid){ 
  for (int i = 0; i < deg; i += 4){ 
    pushMatrix();
    translate(cosPoint[i]*rad, sinPoint[i]*rad);
    rotate(radians(i));
    triangle(0, 0, wid, wid, wid, -wid);
    popMatrix();
  }
}

void keyPressed(){
  switch(key){
    case 'r' : changeRed(); break;
    case 'g' : changeGreen(); break;
    case 'b' : changeBlue(); break;
  }
}
void changeRed(){
  for(int i = 0; i < num; i++){
    int r = (int)random(3);
    switch(r){
      case 0 : style[i*2] = color(100+random(155), 0, 0, random(255)); break;
      case 1 : style[i*2] = color(200+random(55), 50+random(50), 50+random(50), random(255)); break;
      case 2 : style[i*2] = color(255, random(255)); break;
    }
    style[i*2+1] = int(random(3));
  }
}
void changeGreen(){
  for(int i = 0; i < num; i++){
    int r = (int)random(3);
    switch(r){
      case 0 : style[i*2] = color(50+random(50), 100+random(50), random(50), random(255)); break;
      case 1 : style[i*2] = color(200, 80+random(60), 0, random(255)); break;
      case 2 : style[i*2] = color(255, random(255)); break;
    }
    style[i*2+1] = int(random(3));
  }
}
void changeBlue(){
  for(int i = 0; i < num; i++){
    int r = (int)random(3);
    switch(r){
      case 0 : style[i*2] = color(0, 100+random(50), 150, random(255)); break;
      case 1 : style[i*2] = color(255, 80, random(50), random(255)); break;
      case 2 : style[i*2] = color(255, random(255)); break;
    }
    style[i*2+1] = int(random(3));
  }
}
