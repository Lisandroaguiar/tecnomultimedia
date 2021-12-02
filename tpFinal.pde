import processing.sound.*;

Pantalla pantalla;
void setup() {
  size(500, 500);
  pantalla= new Pantalla(0, 0, this);
}

void draw() {
  pantalla.dibujar(pantalla);
}

void mouseClicked() {
  pantalla.actualizar();
}
