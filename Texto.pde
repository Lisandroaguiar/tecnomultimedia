class Texto {

  //VARIABLES (propiedades)

  float posX, posY;
  float tam;
  PFont miFuente;

  //CONSTRUCTOR ("setup" de mi clase)

  Texto() {

    miFuente=loadFont("miFuente.vlw");

    tam=15;
  }  

  //METODOS (funciones)

  void dibujarTexto (String texto, float posX, float posY) { 
    pushStyle();
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(miFuente); 
    textSize(tam);
    text(texto, posX, posY); 
    popStyle();
  }
}
