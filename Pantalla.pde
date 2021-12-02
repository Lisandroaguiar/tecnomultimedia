class Pantalla { 
  SoundFile sonidoFondo;
  SoundFile sonidoCorre;
  SoundFile sonidoTaxi;
  Texto texto;
  Boton boton;
  Juego juego;

  //VARIABLES (propiedades)

  float m;
  float posX, posY;
  float mov;
  int tamX, tamY;
  int numFotos = 18;
  String estado="inicio";
  String [] textos;
  PImage[] fotos = new PImage [numFotos];
  float  posYC;

  //CONSTRUCTOR ("setup" de mi clase)

  Pantalla(float posX_, float posY_, PApplet p) {
    boton=new Boton();
    juego= new Juego(p);
    texto= new Texto();
    posX = posX_;

    posY = posY_;
    tamX = 300; 
    tamY = 300;
    sonidoFondo = new SoundFile(p, "sonidos/sonidoFondo.wav");
    sonidoCorre = new SoundFile(p, "sonidos/corre.wav");
    sonidoTaxi = new SoundFile(p, "sonidos/taxi.wav");
    sonidoFondo.amp(0.05);
    sonidoCorre.amp(0.03);
    sonidoTaxi.amp(0.03);
    sonidoFondo.loop();
    textos = loadStrings("textosAventura.txt"); 
    m=millis();
    mov=0;
    posYC=500;
    for (int i = 0; i < fotos.length; i++) {
      fotos[i] = loadImage("fondos/foto"+ nf(i, 2) + ".jpg");
    }
  }  

  //METODOS (funciones)

  void dibujar(Pantalla aux) {
    background(0);

    if (estado=="inicio") {
      image(fotos[16], 0, 0);
      fotos[16].resize(tamX, tamY);
      tamX=width;
      tamY=height;
      boton.botonDoble("Inicio", "Créditos", 100, 100, 100, 200, 300, 50, 30, aux);
      println(estado);
    }

    if ( estado=="boliche" ) {
      image(fotos[0], 100, 40, 300, 300);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      println(estado);
      for (int i=0; i<3; i++) {
        texto.dibujarTexto(textos[i], 250, 360+(i)*30);
      }
    }

    if ( estado=="sustancia" ) {
      image(fotos[1], 100, 40, 300, 300);
      boton.botonDoble("Tomar", "No tomar", 260, 450, 40, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[3], 250, 360);
    } 

    if ( estado=="ambulancia" ) {
      image(fotos[3], 100, 40, 300, 300);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[16], 250, 360);
    }  

    if (estado=="ambulancia2") {
      image(fotos[2], 100, 40, 300, 300);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      println(estado);
      for (int i=17; i<20; i++) {
        texto.dibujarTexto(textos[i], 250, 360+(i-17)*30);
      }
    }  

    if (estado=="ganaste") { 
      image(fotos[17], 100, 40, 300, 300);
      boton.botonDoble("Inicio", "Créditos", 40, 450, 260, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[22], 250, 360);
    }  

    if ( estado=="perdiste" ) {
      image(fotos[15], 100, 40, 300, 300);
      boton.botonDoble("Inicio", "Créditos", 40, 450, 260, 450, 200, 25, 15, aux);
      texto.dibujarTexto(textos[23], 250, 360);
      println(estado);
    }  

    if ( estado=="caminar" ) {
      image(fotos[13], 100, 40, 300, 300);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[4], 250, 360);
      texto.dibujarTexto(textos[5], 250, 360+30);
    }  

    if ( estado=="grupotaxi" ) {
      image(fotos[4], 100, 40, 300, 300);
      boton.botonDoble("Parar el taxi", "Encarar el grupo", 260, 450, 40, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[6], 250, 360); 
      texto.dibujarTexto(textos[7], 250, 360+30);
    }   

    if ( estado=="grupo" ) {
      image(fotos[5], 100, 40, 300, 300);
      boton.botonDoble("Seguir", "Cruzar", 260, 450, 40, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[12], 250, 360);
    }  

    if ( estado=="taxi" ) {
      image(fotos[6], 100, 40, 300, 300);
      println(estado);
      texto.dibujarTexto(textos[8], 250, 360);
      texto.dibujarTexto(textos[9], 250, 360+30);
      boton.botonCustom("Pagadios", aux);
    }    

    if ( estado=="preso" ) {
      image(fotos[7], 100, 40, 300, 300);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      texto.dibujarTexto(textos[10], 250, 360);
    }    

    if ( estado=="preso2" ) {
      image(fotos[8], 100, 40, 300, 300);
      println(estado);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      texto.dibujarTexto(textos[11], 250, 360);
    } 

    if ( estado=="correr" ) {
      image(fotos[10], 100, 40, 300, 300);
      println(estado);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      texto.dibujarTexto(textos[13], 250, 360);
    }  

    if (estado=="robado") {
      image(fotos[11], 100, 40, 300, 300);
      println(estado);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      texto.dibujarTexto(textos[14], 250, 360);
    }   

    if ( estado=="minijuego" ) {
      /*juego.dibujarJuego(); 
       juego.actualizarJuego();
       juego.mover();
       juego.ganaste(aux);
       juego.perdiste(aux);
       juego.reiniciar(aux);*/
      juego.todoJuego(aux);
    }    

    if (estado=="callejon") {
      image(fotos[12], 100, 40, 300, 300);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      println(estado);
      texto.dibujarTexto(textos[15], 250, 360);
    }  

    if (estado=="amigos") {
      image(fotos[14], 100, 40, 300, 300);
      println(estado);
      boton.botonContinuar(150, 450, 200, 25, 15, aux);
      texto.dibujarTexto(textos[20], 250, 360);
      texto.dibujarTexto(textos[21], 250, 360+30);
    }

    if ( estado=="creditos" ) {
      pushStyle();
      background(200);
      textSize(20);
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      text("Guión: Lisandro Aguiar", 250, posYC-mov);
      text("Montaje: Lisandro Aguiar", 250, posYC+100-mov);
      text("Imagenes: Lisandro Aguiar", 250, posYC+200-mov);
      text("Programación: Lisandro Aguiar", 250, posYC+300-mov);
      text("Programación: Tatiana Segundo", 250, posYC+400-mov);
      text("Patente pendiente", 250, posYC+600-mov);
      popStyle();
      mov+=3;
      m++;

      if (m>150) {
        boton.botonCustom("volver al inicio", aux);
      }
    }
    println("m: ", m);
  }

  void cambiarEstado(String e) {

    estado=e;
  }

  void actualizar() {

    m++;

    boolean A=boton.getA();
    int C=boton.getC();
    println(C);

    if ( estado=="inicio"  && C==1 && m>7) { 
      m=0;
      estado="boliche";
    } 

    if ( estado=="inicio"  && C==-1 && m>7) {
      m=0; 
      estado="creditos";
      mov=0;
    }

    if ( estado=="boliche" && A==true && m>7) { 
      m=0;   
      A=false;
      estado="sustancia";
    }

    if ( estado=="sustancia" && C==1 && m>7) {
      m=0;

      estado="ambulancia";
    } 

    if ( estado=="sustancia" && C==-1 && m>7) {
      m=0;

      estado="caminar";
    } 

    if ( estado=="ambulancia" && A==true && m>7) { 
      m=0; 
      A=false;
      estado="ambulancia2";
    }  

    if (estado=="ambulancia2"&& A==true && m>7) { 
      m=0; 
      A=false;
      estado="ganaste";
    }  

    if ( estado=="creditos" && A==true && m>7) { 
      m=0; 
      mov=0;
      A=false;
      estado="inicio";
    }  

    if ( estado=="perdiste" && C==1 && m>7) {
      m=0;
      estado="inicio";
    } 

    if ( estado=="perdiste" && C==-1 && m>7) {
      m=0;
      estado="creditos";
    } 

    if ( estado=="caminar" && A==true && m>7) { 
      m=0; 
      A=false;
      estado="grupotaxi";
    }  

    if ( estado=="grupotaxi" && C==-1 && m>7) {
      m=0; 
      estado="grupo";
    }

    if ( estado=="grupotaxi" && C==1 && m>7) {
      m=0; 
      sonidoTaxi.play();
      estado="taxi";
    }

    if ( estado=="grupo"  && C==1 && m>7) { 
      m=0;
      estado="robado";
    } 

    if ( estado=="grupo"  && C==-1 && m>7) {
      m=0; 
      estado="correr";
    }

    if ( estado=="taxi"&& A==true && m>7 ) { 
      m=0; 
      A=false;
      estado="preso";
    }    

    if ( estado=="preso"&& A==true &&m>7 ) { 
      m=0; 
      A=false;
      estado="preso2";
    }    

    if ( estado=="preso2"&& A==true && m>7 ) {
      m=0;  
      A=false;
      estado="perdiste";
    }  

    if ( estado=="correr" && A==true && m>7) { 
      m=0; 
      A=false;
      estado="minijuego";
      sonidoFondo.stop();
      sonidoCorre.loop();
    }  

    if (estado=="robado"&& A==true && m>7) { 
      m=0; 
      A=false;
      estado="perdiste";
    }   

    if ( estado=="minijuego" && C==1 && m>7) {
      m=0; 
      estado="callejon";
    }    

    if ( estado=="minijuego" && C==-1 && m>7) {
      m=0; 
      estado="amigos";
    }   

    if (estado=="callejon"&& A==true && m>7) { 
      m=0; 
      A=false;
      estado="perdiste";
      sonidoCorre.stop();
      sonidoFondo.loop();
    }  

    if (estado=="amigos"&& A==true && m>7) { 
      m=0; 
      sonidoCorre.stop();
      sonidoFondo.loop();
      A=false;
      estado="ganaste";
    }

    if ( estado=="ganaste" && C==1 && m>7) {
      m=0;
      estado="inicio";
    } 

    if ( estado=="ganaste" && C==-1 && m>7) {
      m=0;
      estado="creditos";
    }
  }

  String getE() {
    return (estado);
  }
}
