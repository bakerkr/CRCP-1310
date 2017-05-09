//https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking
// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

//Kyle Baker (lots of edits)

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
Kinect kinect;
KinectTracker tracker;
Flurry storm;
PVector ptracker;

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
  // Shows the depth image allowing for sensor to be lined up
 //tracker.display();
  storm.update(tracker);
  storm.draw();
  ptracker = tracker.previousLocation.sub(tracker.getPos());
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