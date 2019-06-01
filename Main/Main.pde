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
  else if (mode == 3){
    mouseClicked_editor();
  }
}

void mouseWheel(MouseEvent event){ //only necessary for library mode
  mouseWheel_lib(event);
}

void mouseDragged() {
  mouseDragged_edit();
}

void mousePressed() {
  mousePressed_edit();
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
