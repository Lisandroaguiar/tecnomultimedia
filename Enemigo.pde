class Enemigo {

  // CAMPOS (variables)
  float posX, posY;
  float velocidad;
  int numFrames = 6;
  PImage [] enemigo = new PImage [numFrames];

  //CONSTRUCTOR ("setup" de mi programa)
  Enemigo() {
    posX = width/2;
    posY =height+300;
    velocidad = 1;
    for (int i = 0; i < numFrames; i++) {
      enemigo[i] = loadImage("enemigo"+ nf(i, 2) + ".png");
    }
  }

  //METODOS (funciones)
  void dibujar() {
    image(this.enemigo[frameCount%numFrames], this.posX, this.posY);
  }

  void actualizar() {
    this.posY -= this.velocidad;

    if (this.posX> 400) {
      this.posX = 400;
    } else if (this.posX < 50) {
      this.posX = 50;
    }
  }
  void seguirJugador(Jugador jugador) {
    float yJ = jugador.getY();
    float xJ = jugador.getX();
    this.posX = xJ;
    if (yJ < 10) {
      this.posY=600;
    }
  }
  float getX() {
    return this.posX;
  }
  float getY() {
    return this.posY;
  }
  void reiniciarEnemigo() {
    posX=width/2;
    posY=height+300;
  }
}
