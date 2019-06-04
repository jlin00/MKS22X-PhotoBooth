class Frame{
  PImage pic; 
  float x, y;
  boolean appear;
  
  Frame(PImage pic){
    this.pic = pic;
    this.pic.resize(461, 346);
    x = 153.5; //x and y coordinates of picture
    y = 115;
    appear = false;
  }
}
