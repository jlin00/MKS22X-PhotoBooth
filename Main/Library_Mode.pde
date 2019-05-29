//class for library mode 

//variables for accessing library images 
String[] filenames; //names of all files in Images folder 
ArrayList<PImage> libimages;

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

//setup for library mode to be used in main 
void setup_lib(){
  //initializing variables 
  stopScroll = false; //default scroll method 
  lib_buttons = new ArrayList<Button>();
  
  //setup for loading images from directory for library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){
    if (!filenames[i].substring(0, 1).equals(".")){
      PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
      libimages.add(temp);
    }
  }
  
    
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
