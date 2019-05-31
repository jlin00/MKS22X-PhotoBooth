class Sticker implements Draggable, Resizeable {
  int w;
  int h;
  float x;
  float y;
  PImage image;
  
  Sticker(PImage image, int x, int y) {
    this.image = image;
    w = x;
    h = y;
    this.x = 300;
    this.y = 300;
    
    display();
  }
  
  void display() {
    image.resize(w, h);
    image(image, x, y);
  }
  
  void drag(float x, float y) {
  }
  
  void resizes(float x, float y) {
  }
  
}