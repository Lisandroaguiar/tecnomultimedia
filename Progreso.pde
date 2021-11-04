class Progreso {
  int marcaDeTiempo = 0;  //marca de tiempo para que no cuente el tiempo que paso el jugador en el menu
  int tiempo = 15 * 1000;  //cantidad de segundos
  String estado;
  int x=150;
  int y=150;

  //Constructor
  Progreso() {
    estado="uno";
  }
  void dibujarBarra() {

    //logica de estados ---ESTADO 1
    if ( estado.equals("uno") ) {
      println("uno");
      pushStyle();
      textAlign(CENTER);
      noStroke();
      fill(0, 200);
      rect(0, height/4*3, width, height);
      fill(255);
      text("INSTRUCCIONES:", width/2, height/6*5);
      text("Corre de derecha a izquierda y evita los obstáculos para escapar.\n Presiona: 'a' o '←' para ir a la izquierda y 'd' o '→' para ir a la derecha.", width/2, height/7*6+5);
      fill(255, 0, 0);
      text("PRESIONA LA BARRA ESPACIADORA PARA JUGAR", width/2, height-30);
      popStyle();
    }
    //logica de estados

    if ( estado.equals("dos") ) {
      if ( millis() > marcaDeTiempo+tiempo ) {  
        estado = "tres";
      }
      float t = map( millis(), marcaDeTiempo, marcaDeTiempo+tiempo, 0, 400);  //tamaño del cuadrado rojo
      fill( 255, 0, 0 );
      rect( 50, 0, t, 10 );
      println("2");
    }
    if (estado.equals("tres") ) { //aca se carga el 3
      println("3");
      background(0);
      pushStyle();
      textAlign(CENTER);
      fill(255);
      text("Lograste escapar\n ¡GANASTE!", width/2, height/2);
      text("Apreta 'r' para reiniciar", width/2, 350); //Opción a reiniciar temporal
      popStyle();
    }
    if (estado=="cuatro") {
      background(0);
      pushStyle();
      textAlign(CENTER);
      fill(255);
      text("Te alcanzó\n PERDISTE", width/2, height/2);
      text("Apreta 'r' para reiniciar", width/2, 350);
      popStyle();
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

  void reiniciarEstado() {
    if ( estado == "tres" || estado == "cuatro") {
      estado = "uno";
    }
  }
  void perdiste() {
    estado="cuatro";
  }
}
