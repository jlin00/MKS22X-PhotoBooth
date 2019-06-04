PGraphics pg;

void setup() {
  size(1000, 800);
  pg = createGraphics(100, 100);
}

void draw() {
  background(204);
  translate(100,100);
  update();
}

// Click to clear the PGraphics object
void mouseDragged() {
  pg.beginDraw(); 
  //pg.clear();
  for (int kx = -2; kx <= 2; kx++){
    for (int ky = -2; ky <= 2; ky++){
      pg.set(mouseX + kx - 150, mouseY + ky - 150, color(0));
    }
  }
  pg.endDraw(); 
}

void mouseClicked(){
  pg.clear();
}

void update(){
  image(pg, 50, 50);
}
