class Button {
  float x,y;
  float w,h,d; //width and height or diameter
  float size;
  boolean shape; //true- rectangles, false- circles
  String type;
  boolean popup; //for buttons that are not always available
  
  Button(float x, float y, float w, float h, boolean shape, String id){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.shape = shape;
    type = id;
    popup = true;
  }
  
  Button(float x, float y, float d, boolean shape, String id){
    this.x = x;
    this.y = y;
    this.d = d;
    this.shape = shape;
    type = id;
    popup = true;
  }
  
  void display() {
    if (shape){
      noStroke();
      if (type.equals("redirectL") || type.equals("redirectB") || 
          type.equals("save")){
        if (popup) rect(x,y,w,h,6);
      }
      else rect(x,y,w,h);
    }
    else{
      stroke(0);
      ellipse(x,y,d,d);
      if (type.equals("take")){
        strokeWeight(1);
        fill(255);
        ellipse(x,y,d*0.8,d*0.8);
      }
    }
  }
  
  void contract(){ //contract the capture button when clicked
    strokeWeight(6);
    ellipse(x,y,d*0.8,d*0.8);
  }
  
  void uncontract(){
    for (int i = 5; i > 0; i--){
      strokeWeight(i);
      ellipse(x,y,d*0.8,d*0.8);
    }
  }
  
  void setPopup(boolean x){
    popup = x;
  }
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
*/
