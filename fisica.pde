

/*import ddf.minim.*;
 import ddf.minim.analysis.*;
 import ddf.minim.effects.*;
 import ddf.minim.signals.*;
 import ddf.minim.spi.*;
 import ddf.minim.ugens.*;
 */
import processing.sound.*;
SoundFile file;

import fisica.*;
boolean empezarTiempo;
int estado=1;
int tiempo;
int c= 0; //contador 1
int salen=150; //tiempo que tardan en salir las notas
int c2= 0; //contador 2
int c3=0;//contador 3
int a=150;
int opo=3; //oportunidades
int progreso;

String [] nombre={"fragmento02", "fragmento03", "fragmento04", "fragmento05", "fragmento06",
  "fragmento07", "fragmento08", "fragmento09", "fragmento010", "fragmento011", "fragmento012", "fragmento013",
  "fragmento014", "fragmento015", "fragmento016", "fragmento017", "fragmento018",
  "fragmento019", "fragmento020", "fragmento021", "fragmento022", "fragmento023", "fragmento024",
  "fragmento025", "fragmento026", "fragmento027", "fragmento028", "fragmento029", "fragmento030", "fragmento031"};
FWorld mundo;
Parlante p;
//Minim minim;
SoundFile error;
SoundFile perdiste;
SoundFile bien;
SoundFile chifle;
SoundFile cancion;
SoundFile amorSalvaje;
SoundFile ganar;
SoundFile[] fragmento;
int numeroDeFragmento=0;
boolean cambiarEstado=false;
//creamos una caja
//FBox caja;
FMouseJoint golpea;
FCircle circulo;
FBox caja; //este es el parlante
FBox meta; //este es la pareja
//PImage nota1, nota2, nota3;
FBox borde;
FBox bordeA;
void setup() { 
  //minim=new Minim(this);
   amorSalvaje= new SoundFile(this, "amorSalvajeInstrumental.wav");
ganar= new SoundFile(this, "ganar.wav");
  error= new SoundFile (this, "error.mp3");
  bien= new SoundFile (this, "bien.wav");
  //cancion= new SoundFile (this, "chaqueño.mp3");
  fragmento=new SoundFile[30];
  chifle= new SoundFile(this, "chifle.mp3");
perdiste= new SoundFile(this, "chaqueño_editado.mp3");
  for (int i=0; i<30; i++) {
    fragmento [i]= new SoundFile(this, nombre[i]+".wav");
    
     }
 amorSalvaje.loop();
  amorSalvaje.amp(0.2);
  ganar.amp(0.2);
  size(1800, 600);
  // circulo=new FCircle(10);
  Fisica.init(this);
  mundo = new FWorld();
  caja=new FBox(40, 10);
  meta=new FBox(200, 400);
  borde=new FBox(20, height+1000);
  bordeA= new FBox(10000, 10);
  meta.setStatic(true);
  meta.setName("meta");
  caja.setPosition(width/2, height/2);
  caja.setNoStroke();
  borde.setStatic(true);
  bordeA.setStatic(true);
  golpea= new FMouseJoint(caja, width/2, height/2); //Le hago un joint al rectangulo para conectarlo al mouse
  p = new Parlante (70, 70);
  //circulo.setName("nota");
  //para agregarle bordes al mundo y los elementos no se escapen
  // mundo.setEdges();
  mundo.add(meta);
  mundo.add(caja);
  mundo.add(golpea);
  mundo.add(borde);
  mundo.add(bordeA);
  caja.setRotatable(false); //para que no se gire el rectangulo cuando golpea las notas
  borde.setNoStroke();
  bordeA.setNoStroke();
  //cancion.play();
}

void draw() {
  if (estado==1) {    
    perdiste.stop();
    background(255);
    ganar.stop();
    botonCustom("play",2,600,400,40,40);
    opo=3;
    progreso=0;
    salen=1500;
    
  }
  if (estado==2) {
    salen=150;
    perdiste.stop();
    meta.setPosition(1200, 300);
    p.oportunidades(error);
    c++;
    c2++;
    background(255);
    textSize(15);
    text("contador:"+ c, 60, 30);
    text("progreso:"+ progreso, 1000, 30);
    textSize(20);
    fill(#000000);
    text("oportunidades:"+ opo, 60, 490);
    golpea.setTarget(mouseX, mouseY); //Con esto el rectangulo sigue al mouse
    //para que hagan todos los calculos matematicos entre los cuerpos que interactuan ¿¿
    mundo.step();
    //dibuja el mundo de fisica
    mundo.draw();

    if (c>=salen) {
      p.notas(mundo);
      c=0;
    }
    //Si c2 es mayor a 2000 las notas van a salir mas rapido, empieza a contar c3
    if (c2>600) {
      c3++;
      mundo.setGravity(-2000, 0);
    }
    if (c2==600) {
      chifle.play();
    }
    // cuando c3 llega a 800 vuelven a salir con normalidad
    if (c3>=100) {
      c2=0;
      c3=0;
      //salen=50;
      mundo.setGravity(100, 100);
    }
    /* if (progreso==5){
     estado=3;
     }
     if (estado==3){
     background(255);
     text("ganaste",200,200);
     }*/

    /*if(p.notas > 600){
     notasSecaen = true;
     }
     
     if(notasSecaen){
     p.notas(mundo) ;
     }*/



    /*if (mousePressed==true) {
     mundo.setGravity(-1000, 0);
     } else {
     mundo.setGravity(100, 100);
     }*/
    p.dibujar();
    rect(500, 10, progreso*10, 10);
    println(c, c2, c3, salen, a, numeroDeFragmento, tiempo, estado);
    if (opo<=0) {
      estado=3;
      fragmento[numeroDeFragmento].stop();
      perdiste.play();
    }
    if (progreso>=30) {
      estado=4;
      fragmento[numeroDeFragmento].stop();
      ganar.play();
    }
  }
  if (estado==3) {
    background(255);
    text("perdiste", width/2, height/2);
    botonCustom("Menu",1,150, 150, 200, 25);
    amorSalvaje.stop();
    
  }

if (estado==4) {
  background(255);
  text("ganaste", width/2, height/2);
  botonCustom("Menu",1,150, 200, 200, 25);
    amorSalvaje.stop();
}


println(estado, cambiarEstado);
}
void contactStarted(FContact contacto) {
  FBody body1=contacto.getBody1();
  FBody body2=contacto.getBody2();
  tiempo++;

  if ( body1.getName() != null && body2.getName() !=null && body1.getName() != body2.getName()) {
    //numeroDeFragmento++;
    if (numeroDeFragmento>28) {
      numeroDeFragmento=0;
    }
    numeroDeFragmento++;
    mundo.remove(body2);
    println(body1.getName(), "colisiono");
    progreso++;
    empezarTiempo=true;
    fragmento[numeroDeFragmento].play();
    fragmento[numeroDeFragmento - 1].stop();
    if (numeroDeFragmento<10) {
      fragmento[28].stop();
      fragmento[29].stop();
    }
    //bien.play();
  }
}

  void botonCustom(String textoB, int queEstado,int x, int y, int posx, int posy) {
    pushStyle();
    if (mouseX > x && mouseX < posx +x && mouseY > y && mouseY < posy + y ) {
      fill(245, 190, 247);
      if (mousePressed==true) {
        //botonPresionado=true;
        estado=queEstado;
        fill(230, 133, 232);
      }
    } else {
      fill(100, 200, 200);
      //botonPresionado=false;
      
    }
    rect(x, y, posx, posy, 45);
    fill(255, 0, 0);
    
    textSize(15);
    text(textoB, x+posx/2, y+posy/2);
    popStyle();
  }