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

  //if no available cameras 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
}

void mouseClicked(){ //if mouse is clicked 
  //mouseClicked calls different methods and functions depending on the mode 
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

void mouseWheel(MouseEvent event){ //only library mode utilizes scrolling 
  mouseWheel_lib(event);
}

void mouseDragged() { //only editor mode utilizes dragging 
  mouseDragged_edit();
}

void mousePressed() { //only necessary for editor mode 
  mousePressed_edit();
}

void mouseReleased(){ //only necessary for editor mode 
  mouseReleased_edit();
}

void draw() { //different screen is drawn depending on the mode 
  if (mode == 1) {
    draw_lib();
  }
  
  if (mode == 2) { 
    draw_booth();
  }
  
  if (mode == 3) {
    draw_editor();
  }
}
