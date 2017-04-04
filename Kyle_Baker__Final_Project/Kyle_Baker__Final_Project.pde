//built off of code from http://shiffman.net/p5/kinect/
import org.openkinect.processing.*;
Kinect kinect;

void setup() {
  kinect = new Kinect(this);
  kinect.initDevice();
}



kinect.enableIR(true);



PImage img = kinect.getDepthImage();
image(img, 0, 0);

int[] depth = kinect.getRawDepth();

if (rawDepth < threshold) {
    sumX += x;
    sumY += y;
    count++;
  }