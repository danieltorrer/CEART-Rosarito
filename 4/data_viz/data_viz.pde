import processing.pdf.*;

// Aral Balkan
// Bruce Willis
// Signal app

// Caja para guardar SVG
PShape mapa;
// Caja para guardar tabla (.csv)
Table tabla;
//Crear texto
PFont fuente;

void setup(){
  size( 900, 450);
  
  noLoop();
  //Cargamos el svg
  mapa = loadShape("WorldMap.svg");
  tabla = loadTable("MeteorStrikes.csv", "header");
  
  printArray( PFont.list());
  fuente = createFont("AvenirLTStd-Light", 12);
}

void draw(){
  // Dibujar mapa desde 0,0 hasta 900, 450
  beginRecord(PDF, "export/meteor###.pdf");
  shape( mapa, 0, 0, width, height );
  
  // Renderear letras como curvas
  textMode(MODEL);
  
  fill(0, 0, 0);
  textFont(fuente);
  text("Meteoritos", width - 150, height - 30);
  
  //contador
  int i = 0;
  
  fill(#FF006B, 50);
  noStroke();
  // Para cada fila ejecuta este bloque
  for (TableRow row : tabla.rows()) {
    // Traduccion de coord a px
    float longitud = row.getFloat("longitude");
    float latitud = row.getFloat("latitude");
    
    float longitudFinal = map( longitud, -180, 180, 0, 900);
    float latitudFinal = map (latitud, 90, -90, 0, 450);
    
    float masa = row.getFloat("mass_g");
    float masaFinal =  0.05 * sqrt( masa ) / PI; 
    


    ellipse(longitudFinal, latitudFinal, masaFinal, masaFinal);
    
    if(i<20) {
      fill(0);

      // llamamos al tipo de fuente
      textFont(fuente);

      // Desplegamos fuente en pantalla
      text( row.getString("place") , longitudFinal + masaFinal + 5, latitudFinal + 4);
      noFill();
      stroke(0);
      line(longitudFinal+masaFinal/2, latitudFinal, longitudFinal+masaFinal, latitudFinal);
    }
    i++;
 }
 endRecord();
}