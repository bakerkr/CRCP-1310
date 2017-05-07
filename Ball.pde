/*
Ball class
Donya Quick
Lecture example covered on April 19, 2017
*/

class Ball {
  float x;
  float y;
  color c;
  //int transparency=random(155,255);
  float radius;
  float xSpeed = random(-5,5); //speed of hand + random()
  float ySpeed = random(-5,5); //speed of hand + random()
  int alpha = (int)random(155,255);
  
  Ball() {
    this.radius = random(1,5);
    this.c = color(255,alpha);
    noStroke();
    PVector v1 = tracker.getPos();
    x = v1.x+width/4;
    y = v1.y+height/3;
  }
  
  void display() {
    fill(c);
    if (x>random(7*width/8,width)) {
      alpha = alpha-1;
     } else if (alpha<0) {
      alpha = 0;
  }
    ellipse(x,y, radius*2, radius*2);
  }
  
  void move() {
    x = x+xSpeed;
    y = y+ySpeed;
  }
}