import fisica.*;
int c= 0; //contador 1
int salen=400; //tiempo que tardan en salir las notas
int c2= 0; //contador 2
int c3=0;//contador 3

FWorld mundo;
Parlante p;
//creamos una caja
//FBox caja;
FMouseJoint golpea;
FCircle circulo;
FBox caja;
FBox meta;
//PImage nota1, nota2, nota3;

void setup() {
  size(1800, 600);
// circulo=new FCircle(10);
  Fisica.init(this);
  mundo = new FWorld();
  caja=new FBox(40, 10);
  meta=new FBox(150, 200);
  meta.setPosition(1300, 500);
  meta.setStatic(true);
  meta.setName("meta");
  caja.setPosition(width/2, height/2);
  caja.setNoStroke();
  golpea= new FMouseJoint(caja, width/2, height/2); //Le hago un joint al rectangulo para conectarlo al mouse
  p = new Parlante (70, 70);
 //circulo.setName("nota");
  //para agregarle bordes al mundo y los elementos no se escapen
  // mundo.setEdges();
  mundo.add(meta);
  mundo.add(caja);
  mundo.add(golpea);
  caja.setRotatable(false); //para que no se gire el rectangulo cuando golpea las notas

}

void draw() {
  c++;
  c2++;
text("contador"+c,500,500);
  background(255);
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
  if (c2>2000) {
    salen=200;
    c3++;
  }
  // cuando c3 llega a 800 vuelven a salir con normalidad
  if (c3>=800) {
    c2=0;
    c3=0;
    salen=400;
  }
  p.dibujar();
   
  println(c, c2, c3, salen);
}
void contactStarted(FContact contacto){
FBody body1=contacto.getBody1();
FBody body2=contacto.getBody2();


if ( body1.getName() != null && body2.getName() !=null){
  
  
}
println(body1.getName(),"colisiono");
}
