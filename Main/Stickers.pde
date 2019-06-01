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
    
    
  }
  
  void display() {
    image.resize(w, h);
    image(image, x, y);
    
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      println("hehe");
      over = true;  
    }
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
