class Button {
  float x,y; //position
  float w,h,d; //width and height or diameter
  boolean shape; //true- rectangles, false- circles
  String type; //type determines the action that will be triggered when button is clicked 
  boolean popup; //for buttons that are not always available
  color c; //only for the color palette in the edit bar 
  
  Button(float x, float y, float w, float h, boolean shape, String id){ //rectangular buttons 
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.shape = shape;
    type = id;
    popup = true;
    c = color(255, 255, 255);
  }
  
  Button(float x, float y, float d, boolean shape, String id){ //circular buttons 
    this.x = x;
    this.y = y;
    this.d = d;
    this.shape = shape;
    type = id;
    popup = true;
    c = color(255, 255, 255);
  }
  
  Button(float x, float y, float d, boolean shape, color c){ //color palette buttons 
    this.x = x;
    this.y = y;
    this.d = d;
    this.shape = shape;
    popup = true;
    this.c = c;
    type = ""; 
  }
  
  void display() { 
    //different display depending on shape and type 
    if (shape){
      noStroke();
      if (type.equals("left") || type.equals("right")) fill(180); //left and right scroll buttons have different formatting 
      else if (type.equals("colorFilters") && filterMode == 1) fill(225); //if these buttons in the edit bar are clicked, they become gray, easier for the user to see 
      else if (type.equals("kernelFilters") && filterMode == 2) fill(225);
      else if (type.equals("adjust") && filterMode == 3) fill(225);
      else if (type.equals("sticker") && filterMode == 4) fill(225);
      else if (type.equals("frames") && filterMode == 5) fill(225);
      else if (type.equals("drawing") && filterMode == 6) fill(225);
      else fill(255); //white filling is default 
      rect(x,y,w,h,6);
    }     
    else{
      stroke(0);
      if (c == color(0,0)) noFill(); //eraser button 
      else fill(c); //color palette buttons display their color 
      ellipse(x,y,d,d);
      if (type.equals("take")){ //capture button has a different visual formatting 
        strokeWeight(1);
        fill(255);
        ellipse(x,y,d*0.8,d*0.8);
     }
     fill(255); //default filling 
   }
}
  
  void contract(){ //visual effect of contracting the capture button when clicked
    strokeWeight(6);
    ellipse(x,y,d*0.8,d*0.8);
  }
  
  void uncontract(){ //visual effect of uncontracting the capture button when clicked
    for (int i = 5; i > 0; i--){
      strokeWeight(i);
      ellipse(x,y,d*0.8,d*0.8);
    }
  }
  
  void setPopup(boolean x){ //change popup setting of button 
    popup = x;
  }
  
  void shiftX(float x){ //change hozn position of button 
    this.x += x;
  }
}
