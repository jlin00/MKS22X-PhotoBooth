import processing.video.*;

Capture cam;
String mode;

void setup() {
  size(1500,900);
  mode = "booth";
  cam = new Capture(this, 320, 240, 30);
  cam.start();
}

void draw() {
  if (mode.equals("booth")) {
    if(cam.available()) {
      cam.read();
    }
    image(cam, 600, 300);
  }
}
