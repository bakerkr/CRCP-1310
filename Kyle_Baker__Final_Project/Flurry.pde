class Flurry {
  // talk to ball
  ArrayList<Ball> balls;

  Flurry() {
    balls = new ArrayList<Ball>();
  }

  void draw() {
    for (int i=0; i<balls.size(); i++) {
      balls.get(i).display();
    }
  }

  void update(KinectTracker tracker) {
    if (tracker.inRange) {
      int numToAdd = round(random(6, 45));
      // initialize new balls
      for (int i = 0; i<numToAdd; i++) {
        balls.add(new Ball());
      }
    }
    for (int i=0; i<balls.size(); i++) {
      balls.get(i).move();
      balls.get(i).alpha = balls.get(i).alpha-2;
    }
    for (int i=balls.size()-1; i>=0; i--) {
      if (balls.get(i).alpha <= 0) {
        balls.remove(i);
      }
    }
  }

  void clear() {
    balls.clear();
  }
}