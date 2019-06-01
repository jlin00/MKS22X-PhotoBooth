class Sticker {
  int w, h;
  float x, y;
  PImage image;
  boolean appear;
  boolean over = false;
  float bx, by, xOffset, yOffset;
  
  Sticker(PImage image, int x, int y) {
    this.image = image;
    w = x;
    h = y;
    this.x = 300;
    this.y = 300;
    appear = false;
    
    if (mouseX > bx-w && mouseX < bx+w && mouseY > by-y && mouseY < by+y) {
      over = true;  
    }
  }
  
  void display() {
    image.resize(w, h);
    image(image, x, y);
  }
  
  void press() {
    xOffset = mouseX-bx;
    yOffset = mouseY-by;
  }
  
  void drag() {
    if (over) {
      bx = mouseX-xOffset;
      by = mouseY-yOffset;
    }
  }
  
  void resizes(float x, float y) {
  }
  
}
