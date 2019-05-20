String[] filenames;
PImage[] images;

void addFiles(){
  String path = sketchPath("Images");
  filenames = listFileNames(path);
  println(path);
}

void setup(){
  addFiles();
  images = new PImage[filenames.length]; //make Arraylist
  for (int i = 0; i < filenames.length; i++){
    images[i] = loadImage("Images/"+filenames[i]);
  }
}

void draw(){
  for (PImage pic: images){
    image(pic, 0, 0);
  }
}