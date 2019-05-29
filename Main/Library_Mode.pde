//class for library mode 

//variables for accessing library images 
String[] filenames; //names of all files in Images folder 
ArrayList<PImage> libimages;

// variable for coordinates of each image
ArrayList<int[]> imageLocations;

//variables for actions in library mode 
int scroll; //used with mouse wheel 
boolean stopScroll; //variable to check if library can still be scrolled 
ArrayList<Button> lib_buttons; //buttons in mode 1

//method to accessing images in directory 
void addFiles(String dir){ //add all the filenames from images into array
  String path = sketchPath(dir);
  filenames = listFileNames(path);
  //printArray(filenames);
  //println(path);
}

void loadLibrary() {
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){
    if (!filenames[i].substring(0, 1).equals(".")){
      PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
      libimages.add(temp);
    }
  }
}

//setup for library mode to be used in main 
void setup_lib(){
  //initializing variables 
  stopScroll = false; //default scroll method 
  lib_buttons = new ArrayList<Button>();
  imageLocations = new ArrayList<int[]>();
  
  //setup for loading images from directory for library
  
  loadLibrary();
    
  //action buttons in library 
  Button go_to_booth = new Button(675, 12.5, 75, 25, true, "redirectB");
  lib_buttons.add(go_to_booth);
}

//draw for library mode to be used in main 
void draw_lib(){
  background(245);
  for (int i = 0; i < libimages.size(); i++) {
    libimages.get(i).resize(188, 141);
    int xcor = i % 4 * 192 + 2;
    int ycor = i / 4 * 145 + 60 + scroll;
    image(libimages.get(i), xcor, ycor);
    int[] temp = new int[] { xcor, ycor, i };
    imageLocations.add(temp);
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

//mouseClicked method for library to be used in main 
void mouseClicked_lib(){
  for (Button b: lib_buttons){
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h) {
        if (b.type.equals("redirectB")){
          text_clicked();
          text("BOOTH", 714, 30);
          mode = 2;
        } 
      }
    }
  }
  
  // clicking images to go to editor mode
  for (int i = 0; i < imageLocations.size(); i++) { // int[] i : imageLocations
    int[] t = imageLocations.get(i);
    if (mouseX >= t[0] && mouseX <= t[0]+188 && 
        mouseY >= t[1] && mouseY <= t[1]+141) {
          mode = 3;
          to_edit = libimages.get(t[2]);
          picWidth = to_edit.width;
          picHeight = to_edit.height;
        }
  }
}

//mouse_Wheel method for library to be used in main 
void mouseWheel_lib(MouseEvent event){
  float e = event.getCount();
  scroll -= 15*e;
  int first_ycor = 60; //ycor of first image
  int last_ycor = (libimages.size() - 1) / 4 * 145 + 60; //ycor of the last image
  if (first_ycor + scroll > 60){ //if cannot scroll down further
    stopScroll = true;
  }
  else if (last_ycor + scroll < 550){ //if cannot scroll up futher 
    stopScroll = true;
  }
  else stopScroll = false;
  
  if (stopScroll) scroll += 15*e;
  //println(e);
  //println(scroll);
}
