import processing.video.*;

Capture cam;
int mode; //1- library, 2- booth, 3- editor

//mode 2
int picNum; //used to name image 
ArrayList<Button> booth_buttons; //buttons in mode 2

//mode 3
PImage to_edit;
ArrayList<Button> edit_buttons; //buttons in mode 3


void setup() {
  size(768, 700);
  background(0);
  mode = 1; //always start in library mode

  //setup the three modes 
  setup_lib();
  
  
  //initializing ArrayLists 
  booth_buttons = new ArrayList<Button>();
  edit_buttons = new ArrayList<Button>();

  //setup for loading cameras 
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);

  //booth_buttons 
  Button take = new Button(384, 662, 50, false, "take"); //capture button
  booth_buttons.add(take); 
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL"); //redirect to library button 
  booth_buttons.add(go_to_lib);
  Button save = new Button (700, 662, 75, 25, true, "save"); //save button 
  save.setPopup(false);
  booth_buttons.add(0,save);
}

void mouseClicked(){ //if mouse is clicked 
  if (mode == 2) {
    for (Button b : booth_buttons) { //loops through booth buttons 
      if (b.popup){
        if (b.shape) { //if rectangular button
          if (mouseX >= b.x && mouseX <= b.x+b.w && 
            mouseY >= b.y && mouseY <= b.y+b.h) {
            if (b.type.equals("redirectL")){
                text_clicked();
                text("LIBRARY", 714, 30);
                undo_text_clicked();
                mode = 1;
            }
            
            if (b.type.equals("save") && b.popup == true){
              PImage slice = get(0, 50, 768, 576); //only saves portion of screen 
              slice.save("Images/IMG" + (picNum + filenames.length) + ".jpg");
              picNum++;
              b.setPopup(false);
            }
          }
        } else { //if circular buttons
          float disX = b.x - mouseX;
          float disY = b.y - mouseY;
          if (sqrt(sq(disX) + sq(disY)) < b.d/2) {
            if (b.type.equals("take")) { //if capture button 
              b.contract();
              booth_buttons.get(0).setPopup(true);
              b.uncontract();
              fill(255);
              rect(0,50,768,576);
            }
          }
        }
      }
    }
  } else if (mode == 1) {
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
    background(245);
    cam.start();
    if (cam.available() == true) {
      cam.read();
    }
    pushMatrix();
    scale(-1, 1); //flip image on x axis 
    scale(1.2);
    translate(128, 42);
    image(cam.get(), -width, 0);
    popMatrix();
    
    heading_settings();
    
    for (Button b : booth_buttons) {
      b.display();
    }
    
    text("Photo Booth",384,32);
    textSize(14);
    fill(0);
    text("LIBRARY", 712, 30);
    
    
  }
  
  if (mode == 3) { //edit mode
    background(245);
    //heading
    heading_settings();
    text("Photo Editor",384,32);
    
  }
}
