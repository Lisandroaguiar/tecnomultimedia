PImage intro;
PImage jennifer;
PImage courtney;
PImage matt;
PImage mattew;
PImage david;
PImage lisa;
PImage fin;
PFont fuente;
char f;
char r;
char i;
char e;
char n;
char d;
char s;

int TamanoCirculo;
float y=width;
float y2=width;
float y3=width;
float y4=width;
float y5=width;
float y6=width;
float vel=60;
void setup() { 
  frameRate(5);
  textAlign(CENTER);
  size(1280, 516);
  f='f'; 
  r='r'; 
  i='i'; 
  e='e'; 
  n='n'; 
  d='d'; 
  s='s'; 
  fuente=loadFont("GabrielWeissFriendsFont-48.vlw"); 
  lisa=loadImage("FRIENDS7.jpeg");
  david=loadImage("FRIENDS5.jpeg");
  mattew=loadImage("FRIENDS8.jpeg");
  matt=loadImage("FRIENDS4.jpeg");
  courtney=loadImage("FRIENDS10.jpeg");
  jennifer=loadImage("FRIENDS2.jpeg"); 
  intro=loadImage("FRIENDS.jpeg");
  fin=loadImage("FRIENDS9.jpeg");
}

void draw() {

  TamanoCirculo=frameCount;
  textFont(fuente, 70);
  if (frameCount<=10) {
    image(intro, 0, 0);
    fill(255, 0, 0);
    circle(450, 230, TamanoCirculo);
    fill(0, 0, 255);
    circle(550, 230, TamanoCirculo);
    fill(255, 200, 0);
    circle(650, 230, TamanoCirculo);
    fill(255, 0, 0);
    circle(750, 230, TamanoCirculo);
    fill(255, 200, 0);
    circle(850, 230, TamanoCirculo);
    fill(0, 0, 255);
    circle(950, 230, TamanoCirculo);
    fill(255);
    if (frameCount>=2) {
      text(f, 400, 516/2);
    }
    if (frameCount>=3) {
      text(r, 500, 516/2);
    }
    if (frameCount>=4) {
      text(i, 600, 516/2);
    }
    if (frameCount>=5) {
      text(e, 700, 516/2);
    }
    if (frameCount>=6) {
      text(n, 800, 516/2);
    }
    if (frameCount>=7) {
      text(d, 900, 516/2);
    }
    if (frameCount>=8) {
      text(s, 1000, 516/2);
    }
  }  

  textFont(fuente, 48);
  if (frameCount>=20) {
    image(jennifer, 0, 0); 
    fill(0);
    text("jennifer Anniston", 645, y);

    text("jennifer Anniston", 648, y);
    fill(255);
    text("jennifer Anniston", width/2, y);
    y=y+vel;

    if (frameCount>=30) {
      image(lisa, 0, 0);
      fill(0);
      text("Lisa Kudrow", 645, y2);
      text("Lisa Kudrow", 648, y2);
      fill(255);
      text("Lisa Kudrow", width/2, y2);
      y2=y2+vel;
    }
  }  
  if (frameCount>=40) {
    image(courtney, 0, 0);
    fill(0);
    text("Courteney Cox", 645, y3);
    text("Courteney Cox", 648, y3);
    fill(255);
    text("Courteney Cox", width/2, y3);
    y3=y3+vel;
  }  
  if (frameCount>=50) {
    image(matt, 0, 0); 
    fill(0);
    text("Matt LeBlanc", 505, y4);
    text("Matt LeBlanc", 508, y4);
    fill(255);
    text("Matt LeBlanc", 500, y4);
    y4=y4+vel;
  }  
  if (frameCount>=60) {
    image(mattew, 0, 0);
    fill(0);
    text("Mattew Perry", 645, y5);
    text("Mattew Perry", 648, y5);
    fill(255);
    text("Mattew Perry", width/2, y5);
    y5=y5+vel;
  }  
  if (frameCount>=70) {
    image(david, 0, 0);
    fill(0);
    text("David Schwimmer", 645, y6);
    text("David Schwimmer", 648, y6);
    fill(255);
    text("David Schwimmer", width/2, y6);
    y6=y6+vel;
  }
  if (frameCount>=80) {
    image(fin, 0, 0);
  }
  if (frameCount>=90) {
    fill(0, 0, 0, (frameCount-90)*60);
    rect(0, 0, width, height);
  }
  fill(255, 255, 255, (frameCount-85)*40);
  if (frameCount>=75) {
    text("Created by", width/2, 200);
    text("David Crane", width/2, 300);
    text("&", width/2, 350);
    text("Marta Kauffman", width/2, 400);
  }
}
