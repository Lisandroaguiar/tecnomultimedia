//https://youtu.be/IfCNtYdJKSw
String estado;
int contador=0;
int m = millis();
PImage[] fotos = new PImage [16];
String[] textos = new String [27];
PFont mifuente;
PFont mifuenteTextos;
PImage ganaste;
PImage inicio;
float mov;
void setup() {
  mov=0;
  mifuente=loadFont("mifuente.vlw");
  mifuenteTextos=loadFont("fuenteTextos.vlw");
  textFont(mifuente);
  textSize(15);
  frameRate(12);
  ganaste=loadImage("Ganaste.jpeg");
  inicio=loadImage("jueguito.jpg");
  size(500, 500);
  estado= "inicio";
  textAlign(CENTER, CENTER);
  for (int i =0; i<fotos.length; i++) {
    fotos[i]=loadImage("foto0"+i+".jpg");
  }
  textos[0]="La noche llego a su fin, es momento de salir del boliche, estas solo";
  textos[1]="y no estas en tu mejor estado, encima perdiste a tus amigos";
  textos[2]="Encontraste una sustancia misteriosa, ¿que vas a hacer con ella?";
  textos[3]="Bueno, encontraste la salida";
  textos[4]="Oh no...llueve...¿quien lo diria?";
  textos [5]=" ¿podras llegar bien a tu casa?";
  textos[6]="en tu billetera hay 0 pesos...peor seria que llueva ¿no?";
  textos[7]="pero viene un taxi y por la vereda una banda de gente sospechosa";
  textos[8]="A salvo...estas en el taxi...¡pero no tenes un peso!";
  textos[9]="Solamente queda una cosa por hacer";
  textos[10]="¡Saliste corriendo y te cruzo un patrullero! esas cosas no se hacen";
  textos[11]="Lo siento, vas a pasar la noche adentro para que aprendas";
  textos[12]="Bueno...si vos decis, ¿cruzas o seguis en la tuya?";
  textos[13]="Miras para atras y...¡te empezaron a correr!";
  textos[14]="Te robaron y encima se te rien...un poco te lo mereces pichon";
  textos[15]="PENSA RAPIDO, ¿IZQUIERDA O DERECHA?";
  textos[16]="COMO VAS A ELEGIR LA DERECHA, ES UN CALLEJON SIN SALIDA";
  textos[17]="Te roban y te alejas mientras se rien";
  textos[18]="...DONDE TE DIJERON QUE IBAN A ESTAR";
  textos[19]="Doblas y ves a tus amigos...esperandote";
  textos[20]="COMO VAS A TOMAR ALGO DEL PISO, ¿ESTAS LOCO?";
  textos[21]="Bueno no tuviste que caminar...de alguna forma ganaste";
  textos[22]="Bienvenido a tu habitacion por las proximas 2 horas";
  textos[23]="Llama a tus amigos antes que se asusten";
  textos[24]="Bien ahi turro, ganaste";
  textos[25]="Perdiste :(";
}


void draw() { 
  m++;
  mov+=5;
  //Dibujo las pantallas
  if (estado=="inicio") { 
    image(inicio, 0, 0);
    inicio.resize(500, 500);
    boton1(100, 100, 300, 50);
    boton2(100, 200, 300, 50);


    fill(0);
    text("Creditos", 250, 225);
    text("Play", 250, 125);
  } else if ( estado=="boliche" ) {
    marco(0, 0, 300, 300);

    textoTriple( 5, textos[0], 7, textos[1], 10, textos[5]);

    if (m>15) {

      boton1(150, 450, 200, 25);
      fill(0);
      text("salir", 250, 465);
    }
  } else if (estado=="ganaste") {
    marco2(0, ganaste, 300, 300);
    textoSimple(5, textos[24]);
    if (m>15) { 
      boton1(260, 450, 200, 25);
      boton2(40, 450, 200, 25);
      fill(0);
      text("Creditos", 360, 465);
      text("Volver al inicio", 140, 465);
    }
  } else  if ( estado=="ambulancia" ) {
    marco(0, 3, 300, 300);
    textoDoble(5, textos[20], 10, textos[21]);

    if (m>15) {
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else if (estado=="ambulancia2") {
    marco(0, 2, 300, 300);
    textoDoble(5, textos[22], 10, textos[23]);

    if (m>15) { 
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else if ( estado=="sustancia" ) {

    marco(0, 1, 300, 300);
    textoSimple(5, textos[2]);
    if (m>15) {
      boton1(260, 450, 200, 25);
      boton2(40, 450, 200, 25);
      fill(0);
      text("tomar", 360, 465);
      text("no tomar", 140, 465);
    }
  } else if ( estado=="creditos" ) {
    background(200);

    text("Guion:Lisandro Aguiar", 250, 500-mov);
    text("Montaje:Lisandro Aguiar", 250, 600-mov);
    text("Imagenes:Lisandro Aguiar", 250, 700-mov);
    text("Programacion:Lisandro Aguiar", 250, 800-mov);
    text("Patente pendiente", 250, 1000-mov);
    if (m>150) {
      boton1(150, 450, 200, 25);
      fill(0);
      text("volver al inicio", 250, 465);
    }
  } else if ( estado=="perdiste" ) {
    marco(0, 15, 300, 300);
    textoSimple(5, textos[25]);

    if (m>15) {
      boton1(260, 450, 200, 25);
      boton2(40, 450, 200, 25);
      fill(0);
      text("Creditos", 360, 465);
      text("Volver al inicio", 140, 465);
    }
  } else if ( estado=="caminar" ) {
    marco(0, 13, 300, 300);
    textoDoble(5, textos[3], 10, textos[6]);
    if (m>15) {
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else if ( estado=="grupotaxi" ) {

    marco(0, 4, 300, 300);
    textoDoble(5, textos[4], 10, textos[7]);
    if (m>15) { 
      boton1(260, 450, 200, 25);
      boton2(40, 450, 200, 25);
      fill(0);
      text("parar el taxi", 360, 465);
      text("encarar grupo", 140, 465);
    }
  } else  if ( estado=="grupo" ) {

    marco(0, 5, 300, 300);
    textoSimple(5, textos[12]);
    if (m>15) { 
      boton1(260, 450, 200, 25);
      boton2(40, 450, 200, 25);
      fill(0);
      text("seguir", 360, 465);
      text("cruzar", 140, 465);
    }
  } else if ( estado=="taxi" ) {
    marco(0, 6, 300, 300);
    textoDoble(5, textos[8], 10, textos[9]);

    if (m>15) { 
      boton1(150, 450, 200, 25);
      fill(0);
      text("pagadios", 250, 465);
    }
  } else   if ( estado=="preso" ) {
    marco(0, 7, 300, 300);
    textoSimple(5, textos[10]);

    if (m>15) { 
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else   if ( estado=="preso2" ) {
    marco(0, 8, 300, 300);
    textoSimple(5, textos[11]);

    if (m>15) {
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else if ( estado=="correr" ) {
    marco(0, 10, 300, 300);
    textoSimple(5, textos[13]);
    if (m>15) {
      boton1(150, 450, 200, 25);
      text("correr", 250, 465);
    }
  } else if (estado=="robado") {
    marco(0, 11, 300, 300);
    textoSimple(5, textos[14]);
    if (m>15) {
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else  if ( estado=="derechaIzquierda" ) {

    marco(0, 9, 300, 300);
    textoSimple(5, textos[15]);
    if (m>7) {
      boton1(260, 450, 200, 25);
      boton2(40, 450, 200, 25);
      fill(0);
      text("derecha", 360, 465);
      text("izquierda", 140, 465);
    }
  } else   if (estado=="callejon") {

    marco(0, 12, 300, 300);
    textoDoble(5, textos[16], 10, textos[17]);
    if (m>15) { 
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
  } else if (estado=="amigos") {
    marco(0, 14, 300, 300);
    textoDoble(5, textos[19], 10, textos[18]);

    if (m>15) { 
      boton1(150, 450, 200, 25);
      fill(0);
      text("continuar", 250, 465);
    }
    //Conecto las pantallas
  }
  if (estado=="inicio" && contador==1) {
    estado="boliche";
    contador=0;
    m=0;
  }
  if (estado=="inicio" && contador==-1) {
    estado="creditos";
    contador=0;
    m=0;
    mov=0;
  }

  if ( estado=="boliche" && contador==1) {
    estado="sustancia"; 
    contador=0;
    m=0;
  }
  if ( estado=="creditos" && contador==1) {
    estado="inicio"; 

    contador=0;
    m=0;
  }
  if ( estado=="sustancia" && contador==1) {
    estado="ambulancia"; 
    contador=0;
    m=0;
  }

  if ( estado=="ambulancia" && contador==1) {
    estado="ambulancia2"; 
    contador=0;
    m=0;
  }

  if (   estado=="sustancia" && contador==-1) {
    estado="caminar"; 
    contador=0;
    m=0;
  }

  if ( estado=="caminar" && contador==1) {
    estado="grupotaxi"; 
    contador=0;
    m=0;
  }


  if (  estado=="grupotaxi" && contador==-1) {
    estado="grupo"; 
    contador=0;
    m=0;
  }


  if (   estado=="grupo" && contador==-1) {
    estado="correr"; 
    contador=0;
    m=0;
  }
  if (   estado=="grupo" && contador==1) {
    estado="robado"; 
    contador=0;
    m=0;
  }

  if ( estado=="grupotaxi" && contador==1) {
    estado="taxi"; 
    contador=0;
    m=0;
  }


  if (  estado=="taxi" && contador==1) {
    estado="preso"; 
    contador=0;
    m=0;
  }
  if (  estado=="preso" && contador==1) {
    estado="preso2"; 
    contador=0;
    m=0;
  }
  if (    estado=="correr" && contador==1) {
    estado="derechaIzquierda"; 
    contador=0;
    m=0;
  }
  if (   estado=="derechaIzquierda" && contador==1) {
    estado="callejon"; 
    contador=0;
    m=0;
  }
  if (  estado=="derechaIzquierda" && contador==-1) {
    estado="amigos"; 
    contador=0;
    m=0;
  }
  if (    estado=="ambulancia2" && contador==1) {
    estado="ganaste"; 
    contador=0;
    m=0;
  }
  if (    estado=="amigos" && contador==1) {
    estado="ganaste"; 
    contador=0;
    m=0;
  }
  if (    estado=="callejon" && contador==1) {
    estado="perdiste"; 
    contador=0;
    m=0;
  }
  if (    estado=="robado" && contador==1) {
    estado="perdiste"; 
    contador=0;
    m=0;
  }
  if (    estado=="preso2" && contador==1) {
    estado="perdiste"; 
    contador=0;
    m=0;
  }
  if (    estado=="ganaste" && contador==1) {
    estado="creditos"; 
    contador=0;
    m=0;
    mov=0;
  }
  if (    estado=="perdiste" && contador==1) {
    estado="creditos"; 
    contador=0;
    m=0;
    mov=0;
  }
  if (    estado=="ganaste" && contador==-1) {
    estado="inicio"; 
    contador=0;
    m=0;
    mov=0;
  }
  if (    estado=="perdiste" && contador==-1) {
    estado="inicio"; 
    contador=0;
    m=0;
    mov=0;
  }
}
