class Sticker {
  int w, h; //width and height 
  float x, y; //position 
  PImage image; //stickerPic 
  boolean appear;
  boolean over = false; //whether or not mouse is over sticker 
  float xOffset, yOffset; //adjusts mouse drag 
  
  Sticker(PImage image, float x, float y) { //constructor 
    this.image = image;
    w = 80;
    h = 80;
    this.x = x;
    this.y = y;
    appear = false;
 
  }
  
  void display() { //display the sticker 
    image.resize(w, h);
    image(image, x, y);
    
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) { //if mouse over sticker 
      over = true;  
    } else {
      over = false;
    }
  }
  
  void press() { //if mousePressed 
    xOffset = mouseX-x;
    yOffset = mouseY-y;
  }
  
  void drag() { //if mouseDragged 
    if (over) { //if mouse over sticker 
      if (toMove == null) toMove = this; //only one sticker may be dragged at once
      if (toMove == this){ //if this sticker is the one to be moved
        x = mouseX-xOffset;
        y = mouseY-yOffset;
      }
    }
  }
  
}
