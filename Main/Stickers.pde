class Sticker {
  int w, h;
  float x, y;
  PImage image;
  boolean appear;
  boolean over = false;
  float xOffset, yOffset;
  
  Sticker(PImage image) {
    this.image = image;
    w = 80;
    h = 80;
    this.x = 300;
    this.y = 300;
    appear = false;
 
  }
  
  void display() {
    image.resize(w, h);
    image(image, x, y);
    
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      //println("hehe");
      over = true;  
    } else {
      over = false;
    }
  }
  
  void press() {
    xOffset = mouseX-x;
    yOffset = mouseY-y;
  }
  
  void drag() {
    if (over) {
      x = mouseX-xOffset;
      y = mouseY-yOffset;
    }
  }
  
}
