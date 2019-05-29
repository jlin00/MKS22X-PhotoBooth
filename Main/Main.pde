import processing.video.*;

Capture cam;
int mode; //1- library, 2- booth, 3- editor

void setup() {
  size(768, 700);
  background(0);
  mode = 1; //always start in library mode

  //setup the three modes 
  setup_lib();
  setup_booth();
  setup_editor();

  //setup for loading cameras 
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
}

void mouseClicked(){ //if mouse is clicked 
  if (mode == 1) {
    mouseClicked_lib();
  }
  else if (mode == 2) {
    mouseClicked_booth();
  }
  else {
    
  }
}

void mouseWheel(MouseEvent event){ //only necessary for library mode
  float e = event.getCount();
  scroll -= 25*e;
  int first_ycor = 60; //ycor of first image
  int last_ycor = (libimages.size() - 1) / 4 * 145 + 60; //ycor of the last image
  if (first_ycor + scroll > 60){ //if cannot scroll down further
    stopScroll = true;
  }
  else if (last_ycor + scroll < 550){ //if cannot scroll up futher 
    stopScroll = true;
  }
  else stopScroll = false;
  
  if (stopScroll) scroll += 25*e;
  //println(e);
  //println(scroll);
}

void draw() {
  if (mode == 1) { //library mode
    draw_lib();
  }
  
  if (mode == 2) { //booth mode
    draw_booth();
  }
  
  if (mode == 3) { //edit mode
    draw_editor();
  }
}
