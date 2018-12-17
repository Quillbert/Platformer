class Player {
  float deltaY = 0;
  float gravity = 1.0;
  boolean jumping = true;
  int jumpTimer;
  boolean dead = false;
  float x, y;
  float velocity = 4;
  boolean touching = true;
  Collider hitBox;
  public Player(float x, float y) {
    this.x = x;
    this.y = y;
    hitBox = new Collider(70, 70);
    hitBox.update(x, y);
  }
  void jump() {
    if(isSpace && jumpTimer <= 12) {
     jumping = true;
     deltaY = -10;
     if(jumpTimer==12) {
      deltaY = -15; 
     }
    }
    if(jumping) {
     jumpTimer++;
     y+=deltaY;
     deltaY += gravity;
     if(deltaY > 10) {
      deltaY = 10; 
     }
    }
  }
  void movement() {
    if (isLeft) {
      x -= velocity;
    }
    if (isRight) {
      x += velocity;
    }
    if (isCtrl) {
      if (velocity < 8) {
        velocity += 0.1;
      }
    } else {
      velocity = 4;
    }
  }

  void fall() {
    if (y > height + 200) {
      dead = true;
    }
  }
  void act() {
    fill(255, 0, 0);
    rect(x, y, 70, 70);
    hitBox.update(x,y);
    jump();
    hitBox.update(x,y);
    movement();
    hitBox.update(x,y);
    fall();
    jumping = true;
  }
}
