PFont f ;
int[] xP;
int[] yP;
boolean[] estado;
//sNombres e informacin relevante de los periodistas
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
int sensX = 0, sensY = 0;
int anchoDisp, altoDisp;


void setup() {
  fullScreen();
  //size(1000, 500);
  anchoCelda = (width-100) / celdasW ; 
  anchoDisp = anchoCelda * celdasW;
  altoCelda = (height-200) / celdasH;
  altoDisp = altoCelda * celdasH;
  xP = new int[celdasW * celdasH]; 
  yP = new int[celdasH * celdasW]; 
  estado = new boolean[celdasH * celdasW];
  f = createFont("Ubuntu-48.vlw", 40);
  textFont(f);
  for (int i= 0; i <= estado.length-1; i++) {
    estado[i] = false; // Desactivar todos las celdas
  }
}

void draw() {
  sensX = mouseX;
  sensY = mouseY;
  background(0);
  setMatriz(100, 200);
  for (int i= 0; i<estado.length-1; i++) {
    revEdo(i);
  }
  noFill();
  stroke(255);
  strokeWeight(5);
 // rect( 100, 100, anchoDisp, altoDisp );
}

int setMatriz(int m1, int m2) {
  int it = 0; // numero de iteraciones 
  // Dibjuar  y almacenar los datos de la matriz de palabras
  // Empieza en 100 y termina 200 antes del fin para dejar un magen 
  for ( int x = m1; x <= width-m2; x+=anchoCelda ) {
    for ( int y = m1; y <= height-m2; y+=altoCelda ) {
      //Se almacena la posicion de la celda desde la esquina
      xP[it] = x; 
      yP[it] = y;
      noFill();
      stroke(255);
      strokeWeight(.5);
      //rect(xP[it], yP[it], anchoCelda, altoCelda );
      it ++;
    }
  }
  return it;
}


boolean revEdo(int c) {
  textMode(CENTER);
  // 
  float distancia = dist(xP[c]+ (anchoCelda /2), yP[c] + (altoCelda /2 ), sensX, sensY ); 
  distancia = map(distancia, 0, 100, 255, 0);
  //println(distancia);
  if ( distancia <= 100 ) {
    estado[c] = false;
    //stroke(255);
    //fill(255);
    //rect(xP[c], yP[c], anchoCelda, altoCelda);
  } else {
    estado[c] = true;
    pushMatrix();
    translate(0, 0);
    //Mostrar imagen referente a cada celda.
    //scale(distancia /100);
    //textSize(abs(distancia *.8));
    fill(255, 255, 255, distancia);
    text(info[c], xP[c], yP[c]);
    popMatrix();
  }
  return estado[c];
}