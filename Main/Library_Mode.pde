//class for library mode 

//variables for accessing library images 
String[] filenames; //names of all files in Images folder 
ArrayList<PImage> libimages; //stores every image to be displayed 

//variables for actions in library mode 
int scroll; //used with mouse wheel 
boolean stopScroll; //variable to check if can scroll further 
ArrayList<Button> lib_buttons; //buttons in mode 1

//method to accessing images in directory 
void addFiles(String dir){ //add all the filenames from images into array
  String path = sketchPath(dir); 
  filenames = listFileNames(path); //accesses all the fileNames in Images folder 
  //printArray(filenames);
  //println(path);
}

void loadLibrary() { //(re)loads the library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){ //loops through filenames 
    if (!filenames[i].substring(0, 1).equals(".")){
      PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
      libimages.add(temp); //add image to arrayList 
    }
  }
}

//setup for library mode to be used in main 
void setup_lib(){
  //initializing variables 
  stopScroll = false; //default scroll method 
  lib_buttons = new ArrayList<Button>();
  
  //setup for loading images from directory for library
  loadLibrary();
    
  //action buttons in library 
  Button go_to_booth = new Button(675, 12.5, 75, 25, true, "redirectB"); //redirect to booth button 
  lib_buttons.add(go_to_booth);
}

//draw for library mode to be used in main 
void draw_lib(){
  background(245);
  for (int i = 0; i < libimages.size(); i++) { //display every image 
    int xcor = i % 4 * 192 + 2;
    int ycor = i / 4 * 145 + 60 + scroll;
    image(libimages.get(i), xcor, ycor, 188, 141);
  }
  
  //heading for library mode 
  heading_settings();
    
  for (Button b : lib_buttons){ //display all teh buttons in library 
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
  for (Button b: lib_buttons){ //loops thorugh all buttons 
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h) {
        if (b.type.equals("redirectB")){ //redirect to booth 
          text_clicked();
          text("BOOTH", 714, 30);
          mode = 2;
        } 
      }
    }
  }
  
  // clicking images to go to editor mode  
  for (int i = 0; i < libimages.size(); i++){ //loops through all the images 
    int xcor = i % 4 * 192 + 2;
    int ycor = i / 4 * 145 + 60 + scroll;
    if (mouseX >= xcor && mouseX <= xcor + 188 && mouseY >= ycor && mouseY <= ycor + 141 && mouseY >= 50){ //if mouse over image 
      mode = 3; //go to editor 
      reset_editor(); //reset editor to defaults 
      to_edit = libimages.get(i); //to_edit is the image clicked
      copy = to_edit.copy(); //copy of to_edit
      sample = to_edit.copy(); //resized copy of to_edit
      sample.resize(100,75);
    }
  }  
}

//mouse_Wheel method for library to be used in main 
void mouseWheel_lib(MouseEvent event){
  float e = event.getCount(); //how much mouse has scrolled 
  scroll -= 15*e; //increases scrubbing speed 
  int first_ycor = 60; //ycor of first image
  int last_ycor = (libimages.size() - 1) / 4 * 145 + 60; //ycor of the last image
  if (first_ycor + scroll > 60){ //if cannot scroll down further
    stopScroll = true;
  }
  else if (last_ycor + scroll < 550){ //if cannot scroll up futher 
    stopScroll = true;
  }
  else stopScroll = false; //else can keep scrolling 
  
  if (stopScroll) scroll += 15*e;
  //println(e);
  //println(scroll);
}
