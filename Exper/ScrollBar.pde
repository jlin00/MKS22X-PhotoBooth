class ScrollBar {
  int bwidth, bheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  boolean over;           // is the mouse over the slider?
  boolean locked;

  ScrollBar (float xp, float yp, int bw, int bh) {
    bwidth = bw;
    bheight = bh;
    xpos = xp;
    ypos = yp-bheight/2;
    spos = xpos + bwidth/2 - bheight/2;
    sposMin = xpos;
    sposMax = xpos + bw;
  }

  void update() {
    over = overEvent(); 
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      if (mouseX <= sposMin) spos = sposMin;
      else if (mouseX >= sposMax - bheight) spos = sposMax - bheight;
      else spos = mouseX;
    }
  }

  boolean overEvent() {
    return (mouseX > xpos && mouseX < xpos+bwidth && mouseY > ypos && mouseY < ypos+bheight);
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, bwidth, bheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, bheight, bheight);
  }

  float getPos(){
    return spos;
  }
}
