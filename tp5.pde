//https://www.youtube.com/watch?v=nNAdhfBwRcg

Juego juego;
void setup() {
  size(500, 500);
  juego = new Juego();
}
void draw() {
  juego.dibujarJuego(); 
  juego.actualizarJuego();
}
void keyPressed() {
  juego.mover();
  juego.reiniciar();
}
