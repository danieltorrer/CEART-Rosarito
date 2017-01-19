import hype.*;
import hype.extended.colorist.*;

HRect d;
HColorPool colors;

void setup() {
  size(600, 600);
  
  colors = new HColorPool()
    .add(#625182, 100)
    .add(#FF8297, 20)
    .add(#FF738D, 30)
    .add(#FE5B7B, 20)
    .add(#9F7689, 10);

  //Lienzo
  H.init(this).background(#202020);

  for (int i= 0; i < 100; i++) {
    d = new HRect();

    d
      .strokeWeight(1)
      .stroke( colors.getColor() )
      .fill( colors.getColor(), 100 )
      .size( (int) random(25, 125) )
      .rotate( (int) random(360) )
      .loc( (int) random(width), (int) random(height) )
      .anchorAt( H.CENTER );

    H.add(d);

  }

  H.drawStage();

}