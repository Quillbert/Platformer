class Tile {
  int id = 0;
  Collider hitBox;
  float x, y;
  public Tile(float x, float y) {
    this.x = x;
    this.y = y;
    hitBox = new Collider(70, 70);
    hitBox.update(x, y);
  }

  void touchPlayer() {
    if (dist(player.x, player.y, x, y) < 300 && id != 0) {
      if (hitBox.rectBox(player.hitBox)) {
        if (player.y + 70 < y+15) {
          player.jumping = false;
          player.jumpTimer = 0;
          player.y = y-70;
        } else if (player.y > y + 55) {
          player.y = y + 70;
        } else if (player.x + 70 < x + 15) {
          player.x = x-70;
        } else if (player.x > x + 55) {
          player.x = x+70;
        } else {
         player.y = y+70; 
        }
      }
    }
  }

  void act() {
    switch(id) {
    case 1:
      image(ground, x, y);
      break;
    case 2:
      image(brick, x, y);
      break;
    case 3:
      image(stack, x, y);
      break;
    }
    touchPlayer();
  }
}
