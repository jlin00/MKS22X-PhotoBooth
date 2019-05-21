class Button {
  float[] size;
  boolean clicked = false;
  PImage image;
  String type;
  
  Button(float x, float y, String im, String id){
    size = new float[] { x, y };
    image = loadImage(im);
    type = id;
  }
  
  void action(){
    
    // depending on id, different buttons perform actions
      // if else statements OR switch
  }
  
  boolean isClicked() {
    return clicked;
  }
}

class SliderButton extends Button {
  float value;
  
  SliderButton(float x, float y, String im) {
    super(x,y,im, "slider");
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
