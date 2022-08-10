import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import fisica.*;

int c= 0; //contador 1
int salen=200; //tiempo que tardan en salir las notas
int c2= 0; //contador 2
int c3=0;//contador 3
int a=150;
int opo=3; //oportunidades
int progreso;
boolean notasSecaen =false;
int estado;
FWorld mundo;
Parlante p;
Minim minim;
AudioSample error;
AudioSample bien;
AudioSample chifle;
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
  minim=new Minim(this);
  error= minim.loadSample("error.mp3");
  bien= minim.loadSample("bien.wav");
  chifle= minim.loadSample("chifle.mp3");
  size(1800, 600);
  // circulo=new FCircle(10);
  Fisica.init(this);
  mundo = new FWorld();
  caja=new FBox(40, 10);
  meta=new FBox(200, 400);
 borde=new FBox(20,height+1000);
 bordeA= new FBox(10000,10);
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
}

void draw() { 
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
  text("oportunidades:"+ opo,60,490);
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
  if(c2==600){chifle.trigger();}
  // cuando c3 llega a 800 vuelven a salir con normalidad
  if (c3>=100) {
    c2=0;
    c3=0;
    salen=50;
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
  rect(500,10,progreso*10,10);
  println(c, c2, c3, salen, a);
}
void contactStarted(FContact contacto) {
  FBody body1=contacto.getBody1();
  FBody body2=contacto.getBody2();


  if ( body1.getName() != null && body2.getName() !=null && body1.getName() != body2.getName()) {
   
    mundo.remove(body2);
    println(body1.getName(), "colisiono");
    progreso++;
    bien.trigger();
  } 
}
