//class for editor mode

//variables 
PImage to_edit; //image to be edited
PImage copy; //copy of to_edit
PImage sample; //sample displayed in editor panel 
ArrayList<Button> edit_buttons; //buttons in mode 3
ArrayList<Button> color_buttons;
ArrayList<Button> kernel_buttons; 
  int filter_num; //only one color fitler or kernel filter can be applied
ArrayList<ScrollBar> scroll_buttons; 
  Button apply, reset;
  float brightness_level;
  float saturate_level;
  float contrast_level;
ArrayList<Button> draw_buttons;
int filterMode;
int adjust;
int adjustRight;
int adjustLeft;
boolean leftmost;
boolean rightmost;
int scroll_mode; 
PGraphics pg;
  color drawcolor; 

ArrayList<Sticker> stickers;
PImage dogSticker;

//setup for editor mode to be used in main
void setup_editor(){
  dogSticker = loadImage("puppy.png");
  
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  color_buttons = new ArrayList<Button>();
  kernel_buttons = new ArrayList<Button>();
  scroll_buttons = new ArrayList<ScrollBar>();
  draw_buttons = new ArrayList<Button>();
  filterMode = 2;
  leftmost = true; //for navigation bar
  rightmost = false; //for navigation bar 
  pg = createGraphics(461, 346);
  drawcolor = color(0); //default draw color
  //adjustLeft = 0;
  //adjustRight = 1;
  
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL");
  edit_buttons.add(go_to_lib);
  Button go_to_booth = new Button(18, 12.5, 75, 25, true, "redirectB"); //redirect to editor button 
  edit_buttons.add(go_to_booth);
  Button save = new Button (18, 662, 75, 25, true, "save"); //save button 
  edit_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  edit_buttons.add(1,cancel);
  Button left = new Button (5, 550, 10, 75, true, "left"); //left arrow button 
  left.setPopup(false);
  edit_buttons.add(2, left);
  Button right = new Button (753, 550, 10, 75, true, "right"); //right arrow button 
  edit_buttons.add(3, right);
  
  //edit bar buttons 
  Button colorFilters = new Button(20, 505, 100, 25, true, "colorFilters");
  edit_buttons.add(colorFilters);
  Button kernelFilters = new Button(145, 505, 100, 25, true, "kernelFilters");
  edit_buttons.add(kernelFilters);
  Button adjust = new Button(270, 505, 100, 25, true, "adjust");
  edit_buttons.add(adjust);
  Button sticker = new Button(395, 505, 100, 25, true, "sticker");
  edit_buttons.add(sticker);
  Button frames = new Button(520, 505, 100, 25, true, "frames");
  edit_buttons.add(frames);
  Button drawings = new Button(645, 505, 100, 25, true, "drawing");
  edit_buttons.add(drawings);
  
  //color filters, sample pictures of filter are overlaid over these 
  Button noFilter = new Button (20, 550, 100, 75, true, "noFilter");
  color_buttons.add(noFilter);
  kernel_buttons.add(noFilter);
  Button grayFilter = new Button (145, 550, 100, 75, true, "grayFilter");
  color_buttons.add(grayFilter);
  Button redFilter = new Button (270, 550, 100, 75, true, "redFilter");
  color_buttons.add(redFilter);
  Button orangeFilter = new Button (395, 550, 100, 75, true, "yellowFilter");
  color_buttons.add(orangeFilter);
  Button yellowFilter = new Button (520, 550, 100, 75, true, "orangeFilter");
  color_buttons.add(yellowFilter);
  Button greenFilter = new Button (645, 550, 100, 75, true, "greenFilter");
  color_buttons.add(greenFilter);
  Button blueFilter = new Button (770, 550, 100, 75, true, "blueFilter");
  color_buttons.add(blueFilter);
  Button purpleFilter = new Button (895, 550, 100, 75, true, "purpleFilter");
  color_buttons.add(purpleFilter);
  Button invertFilter = new Button (1020, 550, 100, 75, true, "invertFilter");
  color_buttons.add(invertFilter);
  
  
  //kernel image processing 
  Button blur = new Button(145, 550, 100, 75, true, "blur");
  kernel_buttons.add(blur);
  Button sharpen = new Button(270, 550, 100, 75, true, "sharpen");
  kernel_buttons.add(sharpen);
  Button edgeEnhance = new Button(395, 550, 100, 75, true, "edgeEnhance");
  kernel_buttons.add(edgeEnhance);
  Button edgeDetect = new Button(520, 550, 100, 75, true, "edgeDetect");
  kernel_buttons.add(edgeDetect);
  Button emboss = new Button(645, 550, 100, 75, true, "emboss");
  kernel_buttons.add(emboss);
  Button sobelEdge = new Button(770, 550, 100, 75, true, "sobelEdge");
  kernel_buttons.add(sobelEdge);
  Button hoznLines = new Button(895, 550, 100, 75, true, "hoznLines");
  kernel_buttons.add(hoznLines);
  Button vertLines = new Button(1020, 550, 100, 75, true, "vertLines");
  kernel_buttons.add(vertLines);
  
  //adjustment scrollbars 
  ScrollBar bright_adj = new ScrollBar(150, 550, 500, 10, "brightness");
  scroll_buttons.add(bright_adj);
  ScrollBar sat_adj = new ScrollBar(150, 580, 500, 10, "saturation");
  scroll_buttons.add(sat_adj);
  ScrollBar cont_adj = new ScrollBar(150, 610, 500, 10, "contrast");
  scroll_buttons.add(cont_adj);
  apply = new Button (665, 560, 70, 20, true, "apply");
  reset = new Button (665, 590, 70, 20, true, "reset");
  
  //draw color palette
  Button color1 = new Button(40, 580, 20, false, color(0));
  draw_buttons.add(color1);
  Button color2 = new Button(80, 580, 20, false, color(128));
  draw_buttons.add(color2);
  Button color3 = new Button(120, 580, 20, false, color(255, 0, 0));
  draw_buttons.add(color3);
  Button color4 = new Button(160, 580, 20, false, color(255, 128, 0));
  draw_buttons.add(color4);
  Button color5 = new Button(200, 580, 20, false, color(255, 255, 0));
  draw_buttons.add(color5);
  Button color6 = new Button(240, 580, 20, false, color(128, 255, 0));
  draw_buttons.add(color6);
  Button color7 = new Button(280, 580, 20, false, color(0, 255, 0));
  draw_buttons.add(color7);
  Button color8 = new Button(320, 580, 20, false, color(0, 255, 128));
  draw_buttons.add(color8);
  Button color9 = new Button(360, 580, 20, false, color(0, 255, 255));
  draw_buttons.add(color9);
  Button color10 = new Button(400, 580, 20, false, color(0, 128, 255));
  draw_buttons.add(color10);
  Button color11 = new Button(440, 580, 20, false, color(0, 0, 255));
  draw_buttons.add(color11);
  Button color12 = new Button(480, 580, 20, false, color(127, 0, 255));
  draw_buttons.add(color12);
  Button color13 = new Button(520, 580, 20, false, color(255, 0, 255));
  draw_buttons.add(color13);
  Button color14 = new Button(560, 580, 20, false, color(255, 0, 127));
  draw_buttons.add(color14);
  Button color15 = new Button(600, 580, 20, false, color(255));
  draw_buttons.add(color15);
  
  
  Button dogS = new Button(0, 300, 100, 25, true, "dogS");
  edit_buttons.add(dogS);
  
  stickers = new ArrayList<Sticker>();
  
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //heading
  heading_settings();
  text("Photo Editor",384,32);
  
  //footer
  footer_settings();
  
  image(copy, 153.5, 115, 461, 346);
  
  for (Button b : edit_buttons) {
    if (b.popup) b.display();
  }
  
  for (Sticker s : stickers) {
    if (s.appear) s.display();
  }
  
  if (filterMode == 3){
    apply.display();
    reset.display();
  }
  
  if (filterMode == 6){
    for (Button b: draw_buttons){
      b.display();
    }
  }
  
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
  text("BOOTH", 56, 30);
  textSize(16);
  text("SAVE", 55, 680);
  text("CANCEL", 710, 680);
  
  editBar();
  
  text("COLOR", 72, 522);
  text("EFFECTS", 197, 522);
  text("ADJUST", 322, 522);
  text("STICKERS", 447, 522);
  text("FRAMES", 572, 522);
  text("DRAW", 697, 522);
  
  image(pg, 153.5, 115);
}

void mouseDragged_edit() {
  for (Sticker s : stickers) {
    //println("yee");
    s.drag();
  }
  if (filterMode == 6){
    pg.beginDraw(); 
    for (int kx = -2; kx <= 2; kx++){
      for (int ky = -2; ky <= 2; ky++){
        pg.set(mouseX + kx - 154, mouseY + ky - 115, drawcolor);
      }
    }
    pg.endDraw(); 
  }
}

void mousePressed_edit() {
  for (Sticker s : stickers) {
    //println("yaa");
    s.press();
  }
}

//mouseClicked method for editor mode to be used in main 
void mouseClicked_editor(){
 // if (stickers.size() > 0) {
   // stickers.get(0).mouseClicked_sticker();
 // }
  
  // going through the buttons
  for (Button b: edit_buttons){
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h) {
        if (b.type.equals("redirectL")){
          text_clicked();
          text("LIBRARY", 714, 30);
          mode = 1;
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("redirectB")){
          text_clicked();
          text("BOOTH", 56, 30);
          mode = 2;
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("save")){
          PImage slice = get(153, 115, 461, 346);
          slice.save("Images/IMG"+ (picNum+filenames.length) + ".jpg");
          loadLibrary(); 
          mode = 1;
        }
        if (b.type.equals("cancel")){
          loadLibrary(); 
          mode = 1; 
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.popup && b.type.equals("right")){
          adjust = -748;
          if (filterMode == 1){
            for (Button b2: color_buttons){
              b2.shiftX(-748);
            }
          }
          if (filterMode == 2){
            for (Button b3: kernel_buttons){
              b3.shiftX(-748);
            }
          }
          edit_buttons.get(2).setPopup(true);
          edit_buttons.get(3).setPopup(false);
          leftmost = false;
          rightmost = true;
        }
        
        if (b.popup && b.type.equals("left")){
          adjust = 0;
          if (filterMode == 1){
            for (Button b2: color_buttons){
              b2.shiftX(748);
            }
          }
          if (filterMode == 2){
            for (Button b3: kernel_buttons){
              b3.shiftX(748);
            }
          }
          edit_buttons.get(2).setPopup(false);
          edit_buttons.get(3).setPopup(true);
          leftmost = true;
          rightmost = false;
        }
        
        if (b.type.equals("dogS")) {
          Sticker dog = new Sticker(dogSticker, 80, 80);
          stickers.add(dog);
          stickers.get(stickers.size()-1).appear = true;
        }
        
        if (b.type.equals("colorFilters")){
          filterMode = 1;
        }
        if (b.type.equals("kernelFilters")){
          filterMode = 2;
        }
        if (b.type.equals("adjust")){
          filterMode = 3;
        }
        if (b.type.equals("sticker")){
          filterMode = 4;
        }
        if (b.type.equals("frames")){
          filterMode = 5;
        }
        if (b.type.equals("drawing")){
          filterMode = 6;
        }
      }
    }
  }
  
  if (filterMode == 1){
    for (Button b: color_buttons){
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){
        if (b.type.equals("noFilter")){
            copy = to_edit.copy();
            filter_num = 0;
            apply_adj();
          }
          if (b.type.equals("grayFilter")){
            copy = to_edit.copy();
            filter_num = 1;
            apply_adj();
          }
          if (b.type.equals("redFilter")) {
            copy = to_edit.copy();
            filter_num = 2;
            apply_adj();
          }
          if (b.type.equals("orangeFilter")) {
            copy = to_edit.copy();
            filter_num = 3;
            apply_adj();
          }
          if (b.type.equals("yellowFilter")) {
            copy = to_edit.copy();
            filter_num = 4;
            apply_adj();
          }
          if (b.type.equals("greenFilter")) {
            copy = to_edit.copy();
            filter_num = 5;
            apply_adj();
          }
          if (b.type.equals("blueFilter")) {
            copy = to_edit.copy();
            filter_num = 6;
            apply_adj();
          }
          if (b.type.equals("purpleFilter")) {
            copy = to_edit.copy();
            filter_num = 7;
            apply_adj();
          }
          if (b.type.equals("invertFilter")) {
            copy = to_edit.copy();
            filter_num = 8;
            apply_adj();
          }
      }
    }
  }
  
  if (filterMode == 2){
    for (Button b: kernel_buttons){
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){
        if (b.type.equals("noFilter")){
          copy = to_edit.copy();
          filter_num = 0;
          apply_adj();
        }
        if (b.type.equals("blur")){
          copy = to_edit.copy();
          filter_num = 9;
          apply_adj();
        }
        if (b.type.equals("sharpen")){
          copy = to_edit.copy();
          filter_num = 10;
          apply_adj();
        }
        if (b.type.equals("edgeEnhance")){
          copy = to_edit.copy();
          filter_num = 11;
          apply_adj();
        }
        if (b.type.equals("edgeDetect")){
          copy = to_edit.copy();
          filter_num = 12;
          apply_adj();
        }
        if (b.type.equals("emboss")){
          copy = to_edit.copy();
          filter_num = 13;
          apply_adj();
        }
        if (b.type.equals("sobelEdge")){
          copy = to_edit.copy();
          filter_num = 14;
          apply_adj();
        }
        if (b.type.equals("hoznLines")){
          copy = to_edit.copy();
          filter_num = 15;
          apply_adj();
        }
        if (b.type.equals("vertLines")){
          copy = to_edit.copy();
          filter_num = 16;
          apply_adj();
        }
      }
    }
  }
  
  if (filterMode == 3){
    if (mouseX >= apply.x && mouseY >= apply.y && mouseX <= apply.x + apply.w && mouseY <= apply.y + apply.h){
      apply_adj();
    }
    if (mouseX >= reset.x && mouseY >= reset.y && mouseX <= reset.x + reset.w && mouseY <= reset.y + reset.h){
      reset_sliders();
      apply_adj();
    }
  }
  
  if (filterMode == 6){
    for (Button b: draw_buttons){
      float disX = b.x - mouseX;
      float disY = b.y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < b.d/2){ //if clicked on circular color button 
        drawcolor = b.c;
      }
    }
  }
}

void editBar(){
  if (filterMode == 1) {
    for (int i = 0; i < 9; i++){
      PImage sample_copy = sample.copy();
      if (i == 1) grayscale(sample_copy);
      if (i == 2) redscale(sample_copy);
      if (i == 3) yellowscale(sample_copy);
      if (i == 4) orangescale(sample_copy);
      if (i == 5) greenscale(sample_copy);
      if (i == 6) bluescale(sample_copy);
      if (i == 7) purplescale(sample_copy);
      if (i == 8) invert(sample_copy);
      image(sample_copy, i * 125 + 20 + adjust, 550);
    }
  }
  else if (filterMode == 2) {
    for (int i = 0; i < 9; i++){
      PImage sample_copy = sample.copy();
      if (i == 1) sample_copy = convoluteBlur(sample, blur);
      if (i == 2) sample_copy = convolute(sample, sharpen);
      if (i == 3) sample_copy = convolute(sample, edgeEnhance);
      if (i == 4) sample_copy = convolute(sample, edgeDetect);
      if (i == 5) sample_copy = convolute(sample, emboss);
      if (i == 6) sample_copy = convolute(sample, sobelEdge);
      if (i == 7) sample_copy = convolute(sample, hoznLines);
      if (i == 8) sample_copy = convolute(sample, vertLines);
      image(sample_copy, i * 125 + 20 + adjust, 550);
    }
  }
  else if (filterMode == 3){
    for (ScrollBar s: scroll_buttons){
      s.display();
      s.update();
      
      float init_pos = s.bar_x + s.bar_width/2 - s.bar_height/2;
      float value = s.scroll_x - init_pos;
      //println(value);
      
      if (s.type.equals("brightness")){
        if (value < 0) value = (value / (s.bar_width/2)) * 60;
        else value = (value / (s.bar_width / 2)) * 70;
        brightness_level = value;
      }
      if (s.type.equals("saturation")){
        if (value < 0) value = (value / (s.bar_width/2)) * 255;
        else value = (value / (s.bar_width / 2)) * 70;
        saturate_level = value;
      }
      if (s.type.equals("contrast")){
        value = (value / (s.bar_width/2)) * 128;
        contrast_level = value;
      }

    }
    fill(0);
    text("BRIGHTNESS", 70, 558);
    text("SATURATION", 70, 588);
    text("CONTRAST", 70, 618);
    text("APPLY", 698, 575);
    text("RESET", 698, 605);
  }
}

void reset_editor(){ //must be reset everytime new image is being edited 
  for (ScrollBar s: scroll_buttons){
    s.scroll_x = s.bar_x + s.bar_width/2 - s.bar_height/2;
  }
  leftmost = true;
  rightmost = false;
  adjust = 0;
  filterMode = 1;
}

void apply_adj(){
  copy = brighten(to_edit, brightness_level);
  copy = saturate(copy, saturate_level);
  copy = contrast(copy, contrast_level);
  
  //code for overlaying filters with adjustment, filterNum changes with buttons 
  if (filter_num == 1) grayscale(copy);
  else if (filter_num == 2) redscale(copy);
  else if (filter_num == 3) orangescale(copy);
  else if (filter_num == 4) yellowscale(copy);
  else if (filter_num == 5) greenscale(copy);
  else if (filter_num == 6) bluescale(copy);
  else if (filter_num == 7) purplescale(copy);
  else if (filter_num == 8) invert(copy);
  else if (filter_num == 9) copy = convoluteBlur(copy, blur);
  else if (filter_num == 10) copy = convolute(copy, sharpen);
  else if (filter_num == 11) copy = convolute(copy, edgeEnhance);
  else if (filter_num == 12) copy = convolute(copy, edgeDetect);
  else if (filter_num == 13) copy = convolute(copy, emboss);
  else if (filter_num == 14) copy = convolute(copy, sobelEdge);
  else if (filter_num == 15) copy = convolute(copy, hoznLines);
  else if (filter_num == 16) copy = convolute(copy, vertLines);
}

void reset_sliders(){
  for (ScrollBar s: scroll_buttons){
    float init_pos = s.bar_x + s.bar_width/2 - s.bar_height/2;
    s.scroll_x = init_pos; //reset slider to initial position
  }
  
  brightness_level = 0;
  saturate_level = 0;
  contrast_level = 0;
}
