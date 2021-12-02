class Progreso {
  int marcaDeTiempo = 0;  //marca de tiempo para que no cuente el tiempo que paso el jugador en el menu
  int tiempo = 15 * 1000;  //cantidad de segundos
  String estado;
  int x=150;
  int y=150;
  PFont miFuente;

  //Constructor

  Progreso() {
    estado="uno";
    miFuente=loadFont("Calibri-48.vlw");
  }

  void dibujarBarra() {

    //logica de estados ---ESTADO 1
    if ( estado.equals("uno") ) {
      println("uno");
      pushStyle();
      textFont(miFuente);
      textSize(15);
      textAlign(CENTER);
      noStroke();
      fill(0, 200);
      rect(0, height/4*3, width, height);
      fill(255);
      text("INSTRUCCIONES:", width/2, height/7*6-20);
      text("Corre de derecha a izquierda y evita los obstáculos para escapar.\n Presiona: 'a' y 'd'o las flechas correspondientes\npara moverte de izquierda a derecha.", width/2, height/7*6);
      fill(255, 0, 0);
      text("PRESIONA LA BARRA ESPACIADORA PARA JUGAR", width/2, height-20);
      popStyle();
    }

    //logica de estados

    if ( estado.equals("dos") ) {

      if ( millis() > marcaDeTiempo+tiempo ) {  
        estado = "tres";//CAMBIAR ACA
      }
      float t = map( millis(), marcaDeTiempo, marcaDeTiempo+tiempo, 0, 400);  //tamaño del rectángulo rojo
      fill( 255, 0, 0 );
      rect( 50, 0, t, 10 );
      println("2");
    }
  }

  String getEstado() { 
    return estado;
  }
  void arrancarJuego() {
    if (key==' ' && estado == "uno") {
      estado = "dos";
      marcaDeTiempo = millis();
    }
  }

  void ganaste(Pantalla aux3) {
    if (estado=="tres") {
      aux3.cambiarEstado("amigos");
    }
  }

  void cambiarEstado() {
    estado="cuatro";
  }

  void perdiste(Pantalla aux3) {
    if (estado=="cuatro") {
      aux3.cambiarEstado("callejon");
    }
  }

  void reiniciarEstado() {
    estado="uno";
  }
}
