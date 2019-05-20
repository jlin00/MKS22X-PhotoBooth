/*
String[] filenames;
PImage[] images;

void addFiles(){
  String path = sketchPath("Images");
  filenames = listFileNames(path);
  println(path);
}

void setup(){
  size(640, 480);
  addFiles();
  images = new PImage[filenames.length]; //make Arraylist
  for (int i = 0; i < filenames.length; i++){
    images[i] = loadImage("Images/"+filenames[i]);
  }
}

void draw(){
  for (int i = 0; i < images.length; i++){
    image(images[i], i * 40, 0);
  }
}
*/