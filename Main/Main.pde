import processing.video.*;

Capture cam;
int mode; //1- library, 2- booth, 3- editor

//mode 1
String[] filenames; //names of all files in Images folder 
ArrayList<PImage> libimages;
int scroll; //used with mouse wheel 
boolean stopScroll; //variable to check if library can still be scrolled 
ArrayList<Button> lib_buttons; //buttons in mode 1

//mode 2
int picNum; //used to name image 
ArrayList<Button> booth_buttons; //buttons in mode 2

//mode 3
PImage to_edit;
ArrayList<Button> edit_buttons; //buttons in mode 3


void addFiles(String dir){ //add all the filenames from images into array
  String path = sketchPath(dir);
  filenames = listFileNames(path);
  //printArray(filenames);
  //println(path);
}

void setup() {
  size(768, 700);
  background(0);
  stopScroll = false; //default scroll method 
  mode = 1; //always start in library mode

  //initializing ArrayLists 
  booth_buttons = new ArrayList<Button>();
  lib_buttons = new ArrayList<Button>();
  edit_buttons = new ArrayList<Button>();

  //setup for loading images from directory for library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++) {
    if (!filenames[i].substring(0, 1).equals(".")) {
      PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
      libimages.add(temp);
    }
  }

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
  
  //lib_buttons
  Button go_to_booth = new Button(675, 12.5, 75, 25, true, "redirect");
  lib_buttons.add(go_to_booth);
}

void mouseClicked(){ //if mouse is clicked 
  for (Button b : booth_buttons) { //loops through booth buttons 
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && 
        mouseY >= b.y && mouseY <= b.y+b.h) {
        //code for rectangular button actions
      }
    } else { //if circular buttons
      float disX = b.x - mouseX;
      float disY = b.y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < b.d/2) {
        if (b.type.equals("take")) { //if capture button 
          b.contract();
          PImage slice = get(0, 50, 768, 576); //only saves portion of screen 
          slice.save("Images/IMG" + (picNum + filenames.length) + ".jpg");
          picNum++;
          b.uncontract();
          fill(255);
          rect(0,50,768,576);
        }
      }
    }
  }
  
  for (Button b: lib_buttons){
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && 
        mouseY >= b.y && mouseY <= b.y+b.h) {
          if (b.type.equals("redirect")){
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

void mouseWheel(MouseEvent event){ //only necessary for library mode
  float e = event.getCount();
  scroll -= e;
  int first_ycor = 60; //ycor of first image
  int last_ycor = (libimages.size() - 1) / 4 * 145 + 60; //ycor of the last image
  if (first_ycor + scroll > 60){ //if cannot scroll down further
    stopScroll = true;
  }
  else if (last_ycor + scroll < 550){ //if cannot scroll up futher 
    stopScroll = true;
  }
  else stopScroll = false;
  
  if (stopScroll) scroll += e;
  //println(e);
  //println(scroll);
}

void draw() {

  if (mode == 1) { //library mode
    background(245);
    for (int i = 0; i < libimages.size(); i++) {
      libimages.get(i).resize(188, 141);
      int xcor = i % 4 * 192 + 2;
      int ycor = i / 4 * 145 + 60 + scroll;
      image(libimages.get(i), xcor, ycor);
    }
    //heading
    heading_settings();
    
    for (Button b : lib_buttons){
      b.display();
    }
    
    //formatting button label
    text("Photo Library",384,32);
    textSize(14);
    fill(0);
    text("BOOTH", 714, 30);
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
    text("Photo Booth",384,32);
    
    for (Button b : booth_buttons) {
      b.display();
    }
  }
  
  if (mode == 3) { //edit mode
    background(245);
    //heading
    heading_settings();
    text("Photo Editor",384,32);
    
  }
}