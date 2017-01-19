import hype.*;
import hype.extended.layout.*;
import hype.extended.colorist.*;
import processing.pdf.*;


HDrawablePool pool, pool2, pool3, pool4, pool5;
HColorPool colors, colors2, colors3, colors4, colors5;

void setup(){
  size(600, 600);
  
  H.init(this).background(#625182);

  colors = new HColorPool(#6D8E9E,#9AA5A2,#A5B6B6);
  colors2 = new HColorPool(#C1CDCA,#DFE9E3);
  colors3 = new HColorPool(#FE5B7B,#FF738D);
  colors4 = new HColorPool(#FF8297,#FF899D);
  
  pool = new HDrawablePool(1000);
  
  colors5 = new HColorPool(#625182,#6D8E9E,#9AA5A2,#A5B6B6,#C1CDCA,#DFE9E3,#FE5B7B,#FF738D,#FF8297,#FF899D);
 
  
  pool.autoAddToStage()
    .add(new HShape("triangle.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("hey.png")
      )
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .noStroke()
            .anchorAt(H.CENTER)
            .rotate( int(random(0, 360)))
            .size( (int)random(0, 20) )
          ;
          d.randomColors(colors.fillAndStroke());
        }
      }
    )
    .requestAll()
  ;

 
  
  
}

void draw(){
  H.drawStage();
}

void keyReleased(){
  if(key == 's' || key == 'S'){
    saveFrame("frames/####_d4.jpg");
  }

  if(key == 'v' || key == 'V'){
    saveVector();
  }
}

void saveVector() {
  PGraphics tmp = null;
  tmp = beginRecord(PDF, "frames/render##.pdf");

  if (tmp == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
  }

  endRecord();
}