class Button {
  PImage img; 
  float x,y;
  float w,h,d; //width and height or diameter
  float size;
  boolean shape; //true- rectangles, false- circles
  boolean pic; 
  String type;
  boolean popup; //for buttons that are not always available
  color c;
  
  Button(float x, float y, float w, float h, boolean shape, String id){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.shape = shape;
    type = id;
    popup = true;
    c = color(255, 255, 255);
  }
  
  Button(float x, float y, float d, boolean shape, String id){
    this.x = x;
    this.y = y;
    this.d = d;
    this.shape = shape;
    type = id;
    popup = true;
    c = color(255, 255, 255);
  }
  
  Button(float x, float y, float d, boolean shape, color c){
    this.x = x;
    this.y = y;
    this.d = d;
    this.shape = shape;
    popup = true;
    this.c = c;
    type = "";
  }
  
  void display() {
    if (shape){
      noStroke();
      if (type.equals("left") || type.equals("right")) fill(180);
      else if (type.equals("colorFilters") && filterMode == 1) fill (225);
      else if (type.equals("kernelFilters") && filterMode == 2) fill (225);
      else if (type.equals("adjust") && filterMode == 3) fill (225);
      else if (type.equals("sticker") && filterMode == 4) fill (225);
      else if (type.equals("frames") && filterMode == 5) fill (225);
      else if (type.equals("drawing") && filterMode == 6) fill (225);
      else fill(255);
      rect(x,y,w,h,6);
    }     
    else{
      stroke(0);
      fill(c);
      ellipse(x,y,d,d);
      if (type.equals("take")){
        strokeWeight(1);
        fill(255);
        ellipse(x,y,d*0.8,d*0.8);
     }
     fill(255);
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
  
  void shiftX(float x){
    this.x += x;
  }
}
