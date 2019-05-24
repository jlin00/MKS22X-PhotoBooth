class Button {
  float[] size;
  boolean clicked = false;
  PImage image;
  String type;
  
  Button(float x, float y, PImage im, String id){
    size = new float[] { x, y };
    image = im;
    type = id;
  }
  
  void mouseClicked() {
   // if (abs(mouseX - 340) <= size[0] / 2.0 && abs(mouseY - 500) <= size[1] / 2.0) {
      println("clicked");
    //}
  }
  
  void display() {
    image(image, 340, 500, size[0], size[1]);
  }
  
  void draw(){
    if (type.equals("pic")) {
      if (clicked) {
        println("yes");
        cam.read();
        image(cam, 0, 0);
      }
    }
    // depending on id, different buttons perform actions
      // if else statements OR switch
  }
  
  boolean isClicked() {
    return clicked;
  }
}

class SliderButton extends Button {
  float value;
  
  SliderButton(float x, float y, PImage im) {
    super(x,y,im, "slider");
  }
  
  void display(){
  }
  
  void slide(float f) {
  }
  
  void action() {
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