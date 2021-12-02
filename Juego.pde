class Juego {

  // CAMPOS (variables)

  int cantLata = 3;
  int cantBotella = 4;
  String estado;
  Obstaculos tacho;
  Obstaculos [] lata = new Obstaculos [cantLata];
  Obstaculos [] botella = new Obstaculos [cantBotella];
  Escenario fondo;
  Jugador jugador;
  Enemigo enemigo;
  Progreso progreso;

  //CONSTRUCTOR ("setup" de mi programa)

  Juego(PApplet c) {
    progreso=new Progreso();
    tacho = new Obstaculos(random(width), -200);
    jugador = new Jugador(c);
    enemigo = new Enemigo ();
    fondo = new Escenario(0, -500, width, height*2);
    for (int i = 0; i < lata.length; i++) {
      lata[i]= new Obstaculos(random(width), 10);
    }
    for (int a = 0; a < botella.length; a++) {
      botella[a] = new Obstaculos(random(width), 50);
    }
  }

  //METODOS (funciones)

  void dibujarJuego() { 
    //Escenario
    fondo.dibujar();
    //Obstaculos
    tacho.dibujarTacho();
    for (int i = 0; i < botella.length; i++) {
      botella[i].dibujarBotella();
    }
    for (int a=0; a < lata.length; a++) {
      lata[a].dibujarLata();
    }
    // Jugador y enemigo
    jugador.dibujar();
    enemigo.dibujar();
    //Barra
    progreso.dibujarBarra();
  }

  void actualizarJuego() {
    String getE=progreso.getEstado(); 
    if (getE=="dos") { 
      println(getE);
      fondo.actualizar(); 
      jugador.actualizar();
      enemigo.actualizar();
      tacho.actualizar();

      for (int i=0; i<botella.length; i++) {
        botella[i].actualizar();
      }
      for (int a=0; a<lata.length; a++) {
        lata[a].actualizar();
      }
      enemigo.seguirJugador(jugador);

      for (int i=0; i<botella.length; i++) {
        jugador.colisionBotella(botella[i]);
      }
      for (int a=0; a<lata.length; a++) {
        jugador.colisionLata(lata[a]);
      }
      jugador.colisionTacho(tacho);
      jugador.colisionEnemigo(enemigo, progreso);//CAMBIAR ACA
    }
  }

  void mover() { 
    jugador.mover();
    progreso.arrancarJuego();
  }

  void reiniciarObstaculos() {
    for (int i = 0; i < lata.length; i++) {
      lata[i]= new Obstaculos(random(width), 10);
    }
    for (int j = 0; j < botella.length; j++) {
      botella[j] = new Obstaculos(random(width), 50);
    }
  }

  void reiniciarTacho() {
    for (int i = 0; i < botella.length; i++) {
      botella[i].dibujarBotella();
    }
    for (int a=0; a < lata.length; a++) {
      lata[a].dibujarLata();
    }
  }

  void reiniciar(Pantalla a) {
    String getE=a.getE(); 
    if (getE=="callejon" || getE=="amigos")
    {
      jugador.reiniciarJugador();
      enemigo.reiniciarEnemigo();
      progreso.reiniciarEstado();
      this.reiniciarTacho();
      this.reiniciarObstaculos();
    }
  }

  void ganaste(Pantalla aux2) {
    progreso.ganaste(aux2);
  }

  void perdiste(Pantalla aux2) {

    progreso.perdiste(aux2);
  }

  void todoJuego(Pantalla aux) {
    this.dibujarJuego(); 
    this.actualizarJuego();
    this.mover();
    this.ganaste(aux);
    this.perdiste(aux);
    this.reiniciar(aux);
  }
}
