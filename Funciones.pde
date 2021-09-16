void boton1(float x, float y, float tamX, float tamY) {
  pushStyle();
  if (mouseX > x && mouseX < x + tamX && mouseY > y && mouseY < y + tamY ) {
    fill(245, 190, 247);
    if (mousePressed) { 
      contador++;
      fill(230, 133, 232);
    }
  } else {
    fill(100, 200, 200);
  }
  rect(x, y, tamX, tamY, 45);
  popStyle();
}
void boton2(float x, float y, float tamX, float tamY) {
  pushStyle();
  if (mouseX > x && mouseX < x + tamX && mouseY > y && mouseY < y + tamY ) {
    fill(245, 190, 247);
    if (mousePressed) { 
      contador--;
      fill(230, 133, 232);
    }
  } else {
    fill(100, 200, 200);
  }
  rect(x, y, tamX, tamY, 45);
  popStyle();
}
void marco(int c, int f, int tamx, int tamy) {
  background(c);
  image(fotos[f], 100, 10);

  fotos[f].resize(tamx, tamy);
}
void textoDoble(int n, String nt, int n2, String nt2) { 
  pushStyle(); 
  textFont(mifuenteTextos); 
  fill(255); 
  textSize(15);  
  if (m>n) {


    text(nt, 250, 350);
  }
  if (m>n2) {


    text(nt2, 250, 400);
  }



  popStyle();
}
void textoSimple(int n, String nt) { 
  pushStyle(); 
  textFont(mifuenteTextos);
  fill(255);
  textSize(15);  
  if (m>n) {


    text(nt, 250, 350);
  }
  popStyle();
}
void textoTriple(int n, String nt, int n2, String nt2, int n3, String nt3) { 
  pushStyle();
  textFont(mifuenteTextos); 
  fill(255); 
  textSize(15);  
  if (m>n) {


    text(nt, 250, 350);
  }
  if (m>n2) {


    text(nt2, 250, 375);
  }

  if (m>n3) {
    text(nt3, 250, 400);
  }
  popStyle();
}
void marco2(int c, PImage f, int tamx, int tamy) {
  background(c);
  image(f, 100, 10);

  f.resize(tamx, tamy);
}
