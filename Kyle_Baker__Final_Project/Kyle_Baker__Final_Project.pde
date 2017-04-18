//built off of code from http://shiffman.net/p5/kinect/
import org.openkinect.processing.*;
//import statement pulls kinect library

Kinect kinect;

float minThresh = 200;
float maxThresh = 1000;
PImage img;

void setup() {
  size(512,424);
  /*fullScreen();*/
  kinect = new Kinect(this);
  //Kinect variable holds information about the connect
  kinect.initDepth();
  kinect.activateDevice(0);
  img = createImage(kinect.depthWidth, kinect.depthHeight, RGB);
}


void draw() {
  background(0);

  image.loadPixels();
  
  minThresh = map(mouseX, 0, width, 0, 4500);
  minThresh = map(mouseY, 0, height, 0, 4500);
  
  //Get the raw depth as an array of integers
  int[] depth = kinect.getRawDepth();
  
    for(int x = 0; x < kinect.depthWidth; x++) {
    for(int y = 0; y < kinect.depthHeight; y++) {
      int offset = x + y * kinect.width;
      int rawDepth = depth[offset];
     
      if (d > minThresh && d < maxThresh) {
        img.pixels[offset] = color(255, 0, 150);
      } else {
        img.pixels[offset]= color(0);
      }

  img.updatePixels();
  image(img, 0, 0);
  
  fill(255);
  
    }
  }

  PImage img = kinect.getDepthImage();
  image(img, 0, 0);
  //draws depth image
  
depthInMeters = 1.0 / (rawDepth * -0.0030711016 + 3.3309495161);

float[] depthLookUp = new float[2048];
for (int i = 0; i < depthLookUp.length; i++) {
  depthLookUp[i] = rawDepthToMeters(i);
}

float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}

int skip = 16;

stroke(255);
strokeWeight(2);
beginShape(POINTS);
    for(int x = 0; x < w; x += skip) {
    for(int y = 0; y < h; y += skip) {
      int offset = x + y * kinect.width;

      // Convert kinect data to world xyz coordinate
      int rawDepth = depth[offset];
      PVector v = depthToWorld(x, y, rawDepth);

      stroke(255);
      pushMatrix();
      // Scale up by 200
      float factor = 200;
      translate(v.x * factor, v.y * factor, factor-v.z * factor);
      // Draw a point
      point(0,0);
      popMatrix();
    }
  }
    }
    
  }
}