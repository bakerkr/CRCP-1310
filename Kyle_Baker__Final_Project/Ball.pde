//Ball class
//Donya Quick
//Lecture example covered on April 19, 2017

//Kyle Baker (lots of edits)

class Ball {
  float x;
  float y;
  color c;
  float radius;
  float xSpeed = random(-5,5);
  float ySpeed = random(-5,5);
  int alpha = (int)random(155,255);
  
  Ball() {
    this.radius = random(1,5);
    this.c = color(255,alpha);
    noStroke();
    PVector v1 = tracker.getPos();
    x = map(v1.x,0,kinect.width, 0, width);
    y = map(v1.y,0,kinect.height, 0, height);
  }
  
  void display() {
    fill(c, alpha);
    ellipse(x,y, radius*2, radius*2);
  }
  
  void move() {
    x = x+xSpeed;
    y = y+ySpeed;
  }
}