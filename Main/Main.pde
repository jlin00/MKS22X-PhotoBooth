import processing.video.*;

Capture cam;
int mode;
String[] filenames;
ArrayList<PImage> libimages;
PImage b; //temp

//1- library, 2- booth, 3- editor
void addFiles(String dir){
  String path = sketchPath(dir);
  filenames = listFileNames(path);
  //printArray(filenames);
  //println(path);
}

void setup() {
  size(640,550);
  mode = 1;
  
  //setup for loading images from directory for library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){
    PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
    libimages.add(temp);
  }
  
  //setup for loading cameras 
  String[] cameras = Capture.list();
  b = loadImage("button.png");
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
}

void draw() {
  if (mode == 1){
    background(153);
    for (int i = 0; i < libimages.size(); i++){
      libimages.get(i).resize(100, 80);
      image(libimages.get(i), i * 120, 0);
    }
  }
  if (mode == 2){
     cam.start();
    if (cam.available() == true) {
      cam.read();
    }
  pushMatrix();
  scale(-1,1);
  image(cam.get(),-width,0);
  popMatrix();
  
 // Button play = new Button(50.0, 50.0, b, "pic");
 // play.display();
  }
  if (mode == 3){
  }
}