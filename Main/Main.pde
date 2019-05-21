import processing.video.*;

Capture cam;
int mode;
String[] filenames;
ArrayList<PImage> libimages;

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
  addFiles("Images");
  libimages = new ArrayList<PImage>();
  for (int i = 0; i < filenames.length; i++){
    PImage temp = loadImage("Images/" + filenames[i]);
    libimages.add(temp);
  }
  
  //setup for loading cameras 
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
}

void draw() {
  if (mode == 1){
    for (int i = 0; i < libimages.size(); i++){
      image(libimages.get(i), i * 40, 0);
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
  }
  if (mode == 3){
  }
}