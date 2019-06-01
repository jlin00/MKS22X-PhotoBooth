class Sticker implements Draggable, Resizeable {
  int w;
  int h;
  float x;
  float y;
  PImage image;
  boolean appear;
  boolean follow;
  
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
  }
  
  void mouseClicked_sticker() {
  }
  
  void drag() {
    
  }
  
  void resizes(float x, float y) {
  }
  
}
