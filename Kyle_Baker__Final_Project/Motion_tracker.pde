//https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking
// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
Kinect kinect;
KinectTracker tracker;
Flurry storm;

void setup() {
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  storm = new Flurry();
  fullScreen();
}

void draw() {
  background(0);

  // Run the tracking analysis
  tracker.track();
  // Show the image
 //tracker.display();
  storm.update(tracker);
  storm.draw();
    

  // Let's draw the raw location
 /*PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x+width/4, v1.y+height/3, 20, 20);*/
  
  // Let's draw the "lerped" location
 /*PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x+width/4, v2.y+height/3, 20, 20);*/
}

// Adjust the threshold with key presses
void keyPressed() {
 storm.clear();
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