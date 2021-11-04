class Jugador {
  // CAMPOS (variables)
  float posX, posY;
  float hitBox=100;
  float velocidad;
  int numFrames = 6;
  PImage [] jugador = new PImage [numFrames];

  //CONSTRUCTOR ("setup" de mi programa)
  Jugador() {
    posX = width/2;
    posY = height;
    velocidad = 1.75;
    for (int i = 0; i < numFrames; i++) {
      jugador[i] = loadImage("jugador"+ nf(i, 2)+ ".png");
    }
  }
  //METODOS (funciones)
  void dibujar() {
    image(this.jugador[frameCount%numFrames], this.posX, this.posY);
  }


  void actualizar() {
    posY -= velocidad;
    if (this.posY < 0) {
      this.posY =501;
    }
    if (this.posX > 400) {
      this.posX = 400;
    } else if (this.posX < 50) {
      this.posX = 50;
    }
  }

  void mover() {
    if ( keyPressed && key == 'd' || keyPressed && keyCode == RIGHT) {
      posX += 10;
    }
    if ( keyPressed && key == 'a' || keyPressed && keyCode == LEFT) {
      posX -= 10;
    }
  }
  void colisionObstaculosMov(Obstaculos obstaculo) {
    float xObstaculo= obstaculo.getX();
    float yObstaculo= obstaculo.getY();

    float dColision= dist(xObstaculo, yObstaculo, posX, posY);
    if (dColision<hitBox/3) { 
      velocidad-=0.25; 
      println("colisionObstaculosMoviles");
      obstaculo.reciclar();
    }
  }
  void colisionTacho(Obstaculos obstaculo) {
    float xObstaculo= obstaculo.getX();
    float yObstaculo= obstaculo.getY();

    float dColision= dist(xObstaculo, yObstaculo, posX, posY);
    if (dColision<hitBox/4) { 
      velocidad-=0.25; 
      println("colisionTacho");
      obstaculo.reciclarTacho();
    }
  }
  void colisionEnemigo(Enemigo enemigo, Progreso progreso) {
    float xEnemigo = enemigo.getX();
    float yEnemigo = enemigo.getY();
    float dColision = dist(xEnemigo, yEnemigo, posX, posY);
    if (dColision < hitBox/2) {
      progreso.perdiste();
      println("colisionEnemigo - Perdiste");
    }
  }

  float getY() {
    return this.posY;
  }
  float getX() {
    return this.posX;
  }
  void reiniciarJugador() {
    velocidad=1.75;
    posX=width/2;
    posY=height;
  }
}
