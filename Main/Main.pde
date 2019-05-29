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
  if (mode == 2) {
    mouseClicked_booth();
  }
  else if (mode == 1) {
     for (Button b: lib_buttons){
      if (b.shape) { //if rectangular button
        if (mouseX >= b.x && mouseX <= b.x+b.w && 
          mouseY >= b.y && mouseY <= b.y+b.h) {
            if (b.type.equals("redirectB")){
              text_clicked();
              text("BOOTH", 714, 30);
              undo_text_clicked();
              mode = 2;
            } 
        }
      } else { //if circular buttons
        float disX = b.x - mouseX;
        float disY = b.y - mouseY;
        if (sqrt(sq(disX) + sq(disY)) < b.d/2) {
          //code for circular button actions
        }
      }
    }
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
