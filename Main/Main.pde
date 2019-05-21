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
<<<<<<< HEAD
  mode = 2;
=======
  mode = 1;
  
  //setup for loading images from directory for library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){
    PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
    libimages.add(temp);
  }
  
  //setup for loading cameras 
>>>>>>> f622608522f46156296067730f7e7aa0f8546821
  String[] cameras = Capture.list();
  loadImage("button.img");
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
}

void draw() {
  if (mode == 1){
    for (int i = 0; i < libimages.size(); i++){
      libimages.get(i).resize(100, 80);
      image(libimages.get(i), i * 120, 0);
    }
  }
  if (mode == 2){
<<<<<<< HEAD
     if (cam.available() == true) {
       cam.read();
      }
      pushMatrix();
    scale(-1,1);
    image(cam.get(),-width,0);
    popMatrix();
    
    Button capture = new Button(320.0, 500.0, "button.img", "pic");
    capture.action();
  }
  if (mode == 3){
  }
  
}
=======
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
>>>>>>> f622608522f46156296067730f7e7aa0f8546821
