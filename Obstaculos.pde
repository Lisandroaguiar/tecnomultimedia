class Obstaculos {

  // CAMPOS (variables)
  PImage [] lata = new PImage [23];
  PImage [] botella = new PImage [13];
  PImage tacho;
  float posX, posY;
  int velocidad;

  //CONSTRUCTOR ("setup" de mi programa)
  Obstaculos (float posX_, float posY_) {
    for (int i = 0; i <23; i++) {
      lata[i] = loadImage("lata"+ nf(i, 2) + ".png");
    }  
    for (int a = 0; a <13; a++) {
      botella[a] = loadImage("botella"+ nf(a, 2) + ".png");
    }
    tacho = loadImage("tacho.png");
    posX = posX_;
    posY =posY_;
    velocidad = 1;
  }

  //METODOS (funciones)
  void actualizar() {
    posY += velocidad;
    if (this.posY >= height) {
      this.posY = 10;
    } else if ( this.posX>400) {
      this.posX=400;
    } else  if ( this.posX<width/10) {
      this.posX=50;
    }
  }
  void dibujarLata() {
    image(this.lata[frameCount%23], this.posX, this.posY);
  }
  void dibujarBotella() {
    image(this.botella[frameCount%13], this.posX, this.posY);
  }
  void dibujarTacho() {
    image(this.tacho, this.posX, this.posY);
  }

  void reciclar() {
    this.posX = random(width/10, 350);
    this.posY = 10;
  }
  void reciclarTacho() {
    this.posX = 300;
    this.posY = -200;
  }
  float getX() {
    return this.posX;
  }
  float getY() {
    return this.posY;
  }
}
