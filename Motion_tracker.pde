//https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking
// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

// talk to ball
ArrayList<Ball> balls = new ArrayList<Ball>();


void setup() {
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  fullScreen();
}

void draw() {
  background(0);
  scale(-1, 1);
  translate(-width, 0);


//SNOW
  for (int i=0; i<balls.size(); i++) {
    balls.get(i).display();
    balls.get(i).move();
  }
  boolean found = false;
  int j = 0;
  if (!found) {
    int numToAdd = round(random(6,45));
    // initialize new balls
    for (int i = 0; i<numToAdd; i++) {
      balls.add(new Ball());
    }
  }



  // Run the tracking analysis
  tracker.track();
  // Show the image
// tracker.display();
  

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x+width/4, v1.y+height/3, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x+width/4, v2.y+height/3, 20, 20);
}

// Adjust the threshold with key presses
void keyPressed() {
 balls.clear();
 int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
     // t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}


//SNOW
void mousePressed() {
    boolean found = false;
  int j = 0;
  if (!found) {
    int numToAdd = round(random(150,300));
    // initialize new balls
    for (int i = 0; i<numToAdd; i++) {
      balls.add(new Ball());
    }
  }
}