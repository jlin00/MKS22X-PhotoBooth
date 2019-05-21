abstract class Button {
  float[] size;
  boolean clicked = false;
  PImage image;
  
  Button(float x, float y, String im){
    size = new float[] { x, y };
    image = loadImage(im);
  }
  
  abstract void display();
  
  abstract void action();
  
  boolean isClicked() {
    return clicked;
  }
}

class SliderButton extends Button {
  float value;
  
  SliderButton(float x, float y, String im) {
    super(x,y,im);
  }
  
  void display(){
  }
  
  void slide(float f) {
  }
  
  void action(){
  }
}

class ButtonPanel {
  Button[] buttons;
  
  void setup() {
  }
  
  void draw() {
  }
  
  void scroll() {
  }
}
