class Boton {

  //VARIABLES (propiedades)

  float posX, posY;
  float tamX, tamY;
  color rell1, rell2, rell3;
  PFont miFuenteBoton;
  String estado;
  boolean botonPresionado=false;
  int contador;

  //CONSTRUCTOR ("setup" de mi clase)

  Boton() {
    miFuenteBoton=loadFont("miFuenteBoton.vlw");
    contador = 0;
    textAlign(CENTER, CENTER);
  }
  //METODOS (funciones)

  void botonCustom(String textoB, Pantalla aux) {
    pushStyle();
    if (mouseX > 150 && mouseX < 150 +200 && mouseY > 450 && mouseY < 450 + 25 ) {
      fill(245, 190, 247);
      if (mousePressed) {
        botonPresionado=true;
        aux.actualizar();
        fill(230, 133, 232);
      }
    } else {
      fill(100, 200, 200);
      botonPresionado=false;
    }
    rect(150, 450, 200, 25, 45);
    fill(255, 0, 0);
    textFont(miFuenteBoton);
    textSize(15);
    text(textoB, 150+200/2, 450+25/2);
    popStyle();
  }

  void botonContinuar(float posX, float posY, float tamX, float tamY, float tamT, Pantalla aux) {  
    pushStyle();
    if (mouseX > posX && mouseX < posX +tamX && mouseY > posY && mouseY < posY + tamY ) {
      fill(245, 190, 247);
      if (mousePressed) {
        aux.actualizar();
        botonPresionado=true;
        fill(230, 133, 232);
      }
    } else {
      fill(100, 200, 200);
      botonPresionado=false;
    }
    rect(posX, posY, tamX, tamY, 45);
    fill(255, 0, 0);
    textFont(miFuenteBoton);
    textSize(tamT);
    text("Continuar", posX+tamX/2, posY+tamY/2);
    popStyle();
  }

  void botonDoble(String textoB1, String textoB2, float posX, float posY, float posX2, float posY2, float tamX, float tamY, float tamT, Pantalla aux) {  
    pushStyle();

    if (mouseX > posX && mouseX < posX +tamX && mouseY > posY && mouseY < posY + tamY ) {
      fill(245, 190, 247);
      contador=0;
      if (mousePressed) {
        aux.actualizar();
        contador++;
        fill(230, 133, 232);
      }
    } else {
      fill(100, 200, 200);
    }
    rect(posX, posY, tamX, tamY, 45);

    if (mouseX > posX2 && mouseX < posX2 +tamX && mouseY > posY2 && mouseY < posY2 + tamY ) {
      fill(0);
      contador=0;
      if (mousePressed) {
        aux.actualizar();
        contador--;
        fill(230, 133, 232);
      }
    } else {
      fill(100, 200, 200);
    } 
    rect(posX2, posY2, tamX, tamY, 45);
    fill(255, 0, 0);
    textFont(miFuenteBoton);
    textSize(tamT);
    text(textoB1, posX+tamX/2, posY+tamY/2);
    text(textoB2, posX2+tamX/2, posY2+tamY/2);
    popStyle();
  }

  boolean getA() {
    return(botonPresionado);
  }

  int getC() {
    return(contador);
  }
}
