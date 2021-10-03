class mariposa {
  float x;
  float y;
  float tamanio;
  float vel =4;
  int col;
  mariposa(float _x, float _y, int _tamanio, color _col) {
    x=_x;
    y=_y;
    tamanio=_tamanio;
    col=_col;
  }
  void move() {
    x+=random(-vel, vel);
    y+=random(-vel, vel);
  }
  void dibujar() {
    //cuerpo
    fill(col);
    ellipse(x, y, tamanio/2.5, tamanio);

    fill(#AFF3F5, 100);
    //ala1
    ellipse(x-x/2.9, y+y/5, tamanio/3, tamanio/2);
    ellipse(x-x/2.9, y-y/5, tamanio/3, tamanio/2);
    //ala2
    ellipse(x+x/2.9, y+y/5, tamanio/3, tamanio/2);
    ellipse(x+x/2.9, y-y/5, tamanio/3, tamanio/2);
  }
}
