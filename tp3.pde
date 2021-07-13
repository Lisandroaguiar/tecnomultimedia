//https://youtu.be/GHXpZyff_O8


void setup() {
  size(600, 600); 
  noStroke();
}

void draw() { 


  background(0); 
  translate(width/2, height/2);

  for (int i=-600; i<0; i++) {   
    rotate(PI/40);

    float px=map(mouseX, 0, width, 0, 100);
    float py=map(mouseY, 0, width, 0, 100);



    rect(px, py, i/2, i/2);
    if (i%2==0) {float mx2=map(mouseX, 0, width, 0, 255);
      fill(mx2);
      float mx=map(mouseX, 0, width, 10, 240);
      float my=map(mouseY, 0, width, 10, 240);
      if ( key=='g') 
        fill(my, 255, mx);
      if ( key=='r') 
        fill(255, my, mx);
      if ( key=='b') 
        fill(my, mx, 255);
    } else {
      float rx=random(10, 240);
        float mx2=map(mouseX, 0, width, 255, 10);
      float ry=random(10, 240);
      fill(mx2); 
      if ( key=='v') 
        fill(rx, 255, ry);
      if ( key=='f') 
        fill(255, rx, ry);
      if ( key=='a') 
        fill(rx, ry, 255);
           ;
    }
  }
  if (keyPressed==true && key==' ') { 
    mouseX=0; 
    mouseY=0;
  }
}
