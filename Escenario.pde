class Escenario {

  // CAMPOS (variables)
  float posX, posY;
  float velocidad;
  int tamX, tamY;
  PImage fondo;

  //CONSTRUCTOR ("setup" de mi programa)
  Escenario(float posX_, float posY_, int tamX_, int tamY_) {
    this.posX = posX_;
    this.posY = posY_;
    this.tamX = tamX_;
    this.tamY = tamY_;
    velocidad = 1;  
    fondo = loadImage("calle.png");
  }

  //METODOS (funciones)
  void dibujar() {
    image(this.fondo, this.posX, this.posY); 
    fondo.resize(tamX, tamY);
  }

  void actualizar() {
    this.posY +=  this.velocidad;
    if (posY >= (-50) ) {
      posY = -500;
    }
  }
}
