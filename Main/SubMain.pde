//this class is for various methods that don't belong in other classes but would clutter up the main if written in there

void text_clicked(){
  fill(172,172,172);
}

void heading_settings(){ //setup for heading of each mode 
  fill(188,215,255);
  noStroke();
  rect(0,0,768,50);
  fill(255);
  textAlign(CENTER);
  PFont font = createFont("NEOTERICc - Bold DEMO VERSION.ttf",23);
  textFont(font);
}
