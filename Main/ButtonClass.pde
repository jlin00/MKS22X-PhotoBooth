class Button {
  String name;
  float[] size;
  boolean clicked;
  
  void setup() {
  }
  
  void draw() {
  }
  
  boolean isClicked() {
    return true;
  }
}

class SliderButton extends Button {
  float value;
  
  void slide(float f) {
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