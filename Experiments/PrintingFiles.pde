void setup(){
  String path = sketchPath("Images");
  
  String[] filenames = listFileNames(path);
  for (String f: filenames){
    if (!f.substring(0,1).equals(".")){
      println(f);
    }
  }
  //printArray(filenames);
}
