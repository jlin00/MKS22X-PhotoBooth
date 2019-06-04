PGraphics pg;
color c; 

void setup() {
  size(1000, 800);
  pg = createGraphics(height, width);
  color c = color(0);
}

void draw() {
  background(204);
  image(pg, 0, 0); 
}

// Click to clear the PGraphics object
void mouseDragged() {
  pg.beginDraw(); 
  //pg.clear();
  for (int kx = -2; kx <= 2; kx++){
    for (int ky = -2; ky <= 2; ky++){
      pg.set(mouseX + kx, mouseY + ky, c);
    }
  }
  pg.endDraw(); 
}

void mouseClicked(){
  if (c == color(0)) c = color(0, 0);
  else c = color(0); 
}
