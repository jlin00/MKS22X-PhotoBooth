class ScrollBar{
  float bar_x, bar_y; //location of bar
  int bar_width, bar_height; //width and height of bar
  float scroll_x; //position of slider
  float scroll_min, scroll_max; //min and max values of slider, based on bar 
  boolean over; //mouse over slider
  boolean clicked; //once mouse is pressed and mosue is over slider, clicked is true
  
  ScrollBar(float bar_x, float bar_y, int bar_width, int bar_height){
    this.bar_x = bar_x;
    this.bar_y = bar_y;
    this.bar_width = bar_width;
    this.bar_height = bar_height; 
    
    scroll_x = bar_x + bar_width/2 - bar_height/2;
    scroll_min = bar_x;
    scroll_max = bar_x + bar_width; 
    
    over = false;
    clicked = false;
  }
  
  boolean mouseOver(){ //is the mouse hovering over the bar
    return (mouseX > bar_x && mouseX < bar_x + bar_width && mouseY > bar_y && mouseY < bar_y + bar_height);
  }
  
  void update(){
    over = mouseOver();
    
    if (mousePressed && over) clicked = true; //if clicked on slider, clicked is true
    if (!mousePressed) clicked = false; //if you let go of mouse, clicked is false
    if (clicked){ //move the slider to where mouse is 
      if (mouseX < scroll_min) scroll_x = scroll_min;
      else if (mouseX > scroll_max - bar_height) scroll_x = scroll_max - bar_height;
      else scroll_x = mouseX;
    }
  }
  
  void display(){
    noStroke();
    fill(220);
    rect(bar_x, bar_y, bar_width, bar_height);
    if (over || clicked) fill(95);
    else fill(140);
    rect(scroll_x, bar_y, bar_height, bar_height);
  }
  
}
