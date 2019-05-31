interface Draggable {
  void drag(float x, float y);
}

interface Resizeable {
  void resizes(float x, float y);
}

class PhotoFrame implements Draggable, Resizeable {
  float[] size;
  float[] position;
  PImage frame;
  
  void drag(float x, float y){
  }
  
  void resizes(float x,float y) {
  }
}