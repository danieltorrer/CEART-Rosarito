PShape svg;

void setup(){
  size(600, 600);
  background(#37DFBC);
  svg = loadShape("svg5.svg");
}

// animar
void draw(){
  fill(#FFFFC1);
  ellipse(mouseX, mouseY, 50, 50);
  shape(svg, mouseX, mouseY, 50, 50);
}

void keyReleased(){

if( key == 's'){
  saveFrame("export/img_##.png");
 }
}