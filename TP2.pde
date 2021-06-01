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
void setup() { 
  frameRate(10);
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
  textFont(fuente, 70);
  if (frameCount<=10) {
    image(intro, 0, 0);
    fill(255, 0, 0);
    circle(450, 230, 10);
    fill(0, 0, 255);
    circle(550, 230, 10);
    fill(255, 200, 0);
    circle(650, 230, 10);
    fill(255, 0, 0);
    circle(750, 230, 10);
    fill(255, 200, 0);
    circle(850, 230, 10);
    fill(0, 0, 255);
    circle(950, 230, 10);
    fill(255);
    text(f, 400, 516/2);
    text(r, 500, 516/2);
    text(i, 600, 516/2);
    text(e, 700, 516/2);
    text(n, 800, 516/2);
    text(d, 900, 516/2);
    text(s, 1000, 516/2);
  }  

  textFont(fuente, 48);
  if (frameCount>=20) {
    image(jennifer, 0, 0); 
    fill(0);
    text("jennifer Anniston", 645, 260);

    text("jennifer Anniston", 648, 263);
    fill(255);
    text("jennifer Anniston", width/2, height/2);


    if (frameCount>=30) {
      image(lisa, 0, 0);
      fill(0);
      text("Lisa Kudrow", 645, 260);
      text("Lisa Kudrow", 648, 263);
      fill(255);
      text("Lisa Kudrow", width/2, height/2);
    }
  }  
  if (frameCount>=40) {
    image(courtney, 0, 0);
    fill(0);
    text("Courteney Cox", 645, 335);
    text("Courteney Cox", 648, 338);
    fill(255);
    text("Courteney Cox", width/2, 330);
  }  
  if (frameCount>=50) {
    image(matt, 0, 0); 
    fill(0);
    text("Matt LeBlanc", 505, 260);
    text("Matt LeBlanc", 508, 263);
    fill(255);
    text("Matt LeBlanc", 500, height/2);
  }  
  if (frameCount>=60) {
    image(mattew, 0, 0);
    fill(0);
    text("Mattew Perry", 645, 260);
    text("Mattew Perry", 648, 263);
    fill(255);
    text("Mattew Perry", width/2, height/2);
  }  
  if (frameCount>=70) {
    image(david, 0, 0);
    fill(0);
    text("David Schwimmer", 645, 260);
    text("David Schwimmer", 648, 263);
    fill(255);
    text("David Schwimmer", width/2, height/2);
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
  if (frameCount>=130) { 
    background(0);

    circle(width/2, 480, 400);
    fill(0);
    text("reiniciar", width/2, 480);
    fill(255, 200, 0); 
    if (mousePressed) {
      fill(255, 0, 0);
    } 

    circle(mouseX, mouseY, 10);
  }
  if (frameCount>=130 && (mousePressed &&( dist(mouseX, mouseY, width/2, 480)<200))) {
    frameCount=0;
  }
}
