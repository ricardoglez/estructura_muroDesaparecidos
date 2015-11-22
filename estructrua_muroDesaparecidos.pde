PFont f ; //<>//
int[] xP;
int[] yP;
boolean[] estado;
//Nombres e informacion relevante de los periodistas
String[] info = {
  "uno",
  "dos",
  "tres",
  "cuatro",
  "cinco",
  "seis",
  "siete",
  "ocho",
  "nueve",
  "diez",
  "once",
  "doce",
  "trece",
  "catorce",
  "quince",
  "dieciseis",
  "diecisite",
  "dieciocho",
  "diecoNueve",
  "diecinueve",
  "veinte",
  "veintiuno",
  "Veintidos",
  "veintitres",
  "veinticuatro",
  "veinticonco"
};
int anchoCelda;
int altoCelda;
int celdasW = 5;
int celdasH = 5;
int numObj = celdasW * celdasH;
int sensX = 0, sensY = 0;
int anchoDisp, altoDisp;
PGraphics fotografia;
PImage foto;
boolean estadoF = false;

/*
///////////////
/Inicializando/
//////////////
*/
void setup() {
  fullScreen();
  //size(1000, 500);
  anchoCelda = (width-200) / celdasW ;
  anchoDisp = anchoCelda * celdasW;
  altoCelda = (height-200) / celdasH;
  altoDisp = altoCelda * celdasH;
  xP = new int[numObj];
  yP = new int[numObj];
  estado = new boolean[numObj];
  fotografia = createGraphics(width, height);
  f = createFont("Ubuntu-48.vlw", 40);
  foto = loadImage("01.jpg");
  textFont(f);
  for (int i= 0; i <= estado.length-1; i++) {
    estado[i] = false; // Desactivar todos las celdas
  }
}

/*
///////////////
/Loop inicial/
//////////////
*/
void draw() {
  sensX = mouseX;
  sensY = mouseY;
  background(0);
  setMatriz(100, 200);
  for (int i= 0; i<estado.length-1; i++) {
    revEdo(i);
  }
}
/*
////////////////////
Generar información
de la matriz
///////////////////
*/
int setMatriz(int margen, int margensum) {
  int it = 0; // numero de iteraciones
  // Dibjuar  y almacenar los datos de la matriz de palabras
  // Empieza en 100 y termina 200 antes del fin para dejar un magen
  for ( int x = margen; x <= width-margensum; x+=anchoCelda ) {
    for ( int y = margen; y <= height-margensum; y+=altoCelda ) {
      //Se almacena la posicion de la celda desde la esquina
      xP[it] = x;
      yP[it] = y;
      it ++;
    }
  }
  return it;
}
/*
//////////////////////////////
/Revisar estado de cada celda/
//////////////////////////////
*/
boolean revEdo(int c) {
  float distancia = dist(xP[c]+ (anchoCelda /2), yP[c]+ (anchoCelda /2), sensX, sensY );
  distancia = map(distancia, 0, 200, 255, 0);
  estadoF =false;
  if ( distancia <= 80 ) {
    estado[c] = false;
    delfoto();
     println(estadoF, c);
    //stroke(255);
    //fill(255);
    //rect(xP[c], yP[c], anchoCelda, altoCelda);
  } else {
      estadoF= true;
      drawfoto();
      //println(estadoF, c);
    estado[c] = true;
    pushMatrix();
    translate(0, 0);
    textAlign(CENTER);
    fill(255, 255, 255, distancia);
    text(info[c], xP[c]+ (anchoCelda /2), yP[c]+ (anchoCelda /2));
    popMatrix();
    if(distancia >= 180){
      tint(255,255,255,distancia);
      image(foto, 1200, 0 );
    }
  }
  //println(distancia, c);
  return estado[c];
}
/*
///////////////
/Dibujar foto/
//////////////
*/
void drawfoto() {
    fotografia.beginDraw();
      fotografia.fill(255, 255, 255);
      fotografia.rect(1000/2, 0, 1000/2, height);
    fotografia.endDraw();
}
void delfoto(){
  fotografia.beginDraw();
      fotografia.background(100,100,100,10);
      fotografia.rect(1000/2, 0, 1000/2, 1000);
    fotografia.endDraw();
}
