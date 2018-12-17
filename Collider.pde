class Collider {
 float x,y,wid,hei;
 public Collider() {
  x = 0;
  y = 0;
  wid = 70;
  hei = 70;
 }
 public Collider(float w, float h) {
  x = 0;
  y = 0;
  wid = w;
  hei = w;
 }
 void show() {
  pushStyle();
  stroke(255,0,255);
  noFill();
  strokeWeight(3);
  rect(x,y,wid,hei);
  popStyle();
 }
 boolean rectBox(Collider other) {
  boolean top =  y + hei > other.y;
  boolean bottom = y < other.y + other.hei;
  boolean left = x + wid > other.wid;
  boolean right = x < other.x + other.wid;
  if(top && bottom && left && right) {
   return true; 
  }
  return false;
 }
 void update(float x, float y) {
  this.x = x;
  this.y = y;
 }
}
