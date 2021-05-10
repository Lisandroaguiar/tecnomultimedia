void setup(){ size(400,400); colorMode(HSB,360,100,100);background(360);}
void draw(){
 fill(250);
 triangle(100,125,300,125,200,325);
 fill(360);
 triangle(100,250,300,250,200,50); 

line(75,187.5,100,250);
line(75,187.5,100,125);
line(140,78.5,100,125);
line(140,78.5,200,50);
line(260,78.5,200,50);
line(260,78.5,300,125);
line(325,187.5,300,125);
line(325,187.5,300,250);
line(260,300,300,250);
line(260,300,200,325);
line(200,325,140,300);
line(100,250,140,300);

//secundarios
//amarillo
fill(60,100,100);
circle(100,125,50);
//cyan
fill(180,100,100);
circle(300,125,50);
//magenta
fill(300,100,100);
circle(200,325,50);
//primarios
//rojo
fill(360,100,100);
circle(100,250,75);
//azul
fill(240,100,100);
circle(300,250,75);
//verde
fill(120,100,100);
circle(200,50,75);
//terciarios
//naranja
fill(30,100,100);
circle(75,187.5,30);
//verde amarilloso
fill(90,100,100);
circle(140,78.5,30);
//verde azulado
fill(150,100,100);
circle(260,78.52,30);
//azul
fill(210,100,100);
circle(325,187.5,30);
//rosita
fill(330,100,100);
circle(140,300,30);
//violeta
fill(270,100,100);
circle(260,300,30);
 



}
