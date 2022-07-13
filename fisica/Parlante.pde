class Parlante{
  
  float x, y; 
  float ancho = 70;
  float alto =70;
  float velocidad = 500;
  float anguloVel = 2;
  float angulo;  


  PImage nota1, nota2, nota3;
  
  Parlante( float x_, float y_){
    x=x_;
    y= y_;
    angulo = radians (50);
  }
  
  void dibujar (){
    pushMatrix();
    nota1 = loadImage("nota2.png");
    nota2 = loadImage("notaa.png");
    nota3 = loadImage("nota4.png");
    
    rect(x,y, ancho,alto);
    popMatrix();
  }
  
  void notas( FWorld mundo){
    FCircle notas = new FCircle(20);
    notas.setPosition( x+40 , y+10 );
    //para despues detectar las coliciones
    notas.setName("notas");
    
    float vx = velocidad * cos (angulo);
    float vy = velocidad * sin (angulo);
    
    notas.setVelocity (vx, vy);
    
     if(random(2)<1){
     notas.attachImage(nota1);
  } else if(random(2)>1){
    notas.attachImage(nota2);
  }else{
    notas.attachImage(nota3);
  }
  
  mundo.add(notas);
  }
}
