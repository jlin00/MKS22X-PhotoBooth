class Button {
  float x,y;
  float w,h,d; //width and height or diameter
  float size;
  boolean shape; //true- rectangles, false- circles
  String type;
  
  Button(float x, float y, float w, float h, boolean shape, String id){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.shape = shape;
    type = id;
  }
  
  Button(float x, float y, float d, boolean shape, String id){
    this.x = x;
    this.y = y;
    this.d = d;
    this.shape = shape;
    type = id;
  }
  
  boolean overCircle(){
    if (!shape){
      float disX = x - mouseX;
      float disY = y - mouseY;
      return (sqrt(sq(disX) + sq(disY)) < d/2);
    }
    return false;
  }
  
  boolean overRect(){
    if (shape){
      return (mouseX >= x && mouseX <= x+w && 
              mouseY >= y && mouseY <= y+h);
    }
    return false;
  }
  
  void mouseClicked(){
    if ((shape && overRect()) || overCircle()){
      if (type.equals("test")){
        fill(0);
        text("ffaeasasf", 10, 10);
      }
    }
  }
  
  void display() {
    if (shape){
      rect(x,y,w,h);
    }
    else{
      ellipse(x,y,d,d);
    }
  }
  
  void draw(){}
}
/*
class SliderButton extends Button {
  float value;
  
  SliderButton(float x, float y, PImage im) {
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
*/