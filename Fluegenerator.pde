ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup() {
  size(1000, 1000);
}

//Draw funktionen skaber en ny plads og sætter en ny flue på den plads.
void draw() {
  fill(173, 216, 230);
  clear();
  for (int i=0; i<flueListe.size(); i++) {
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
    
  }
}

void keyPressed() {
  if (key=='e') {
    flueListe.add(new Flue(2));
  } else {
    flueListe.add(new Flue());
  }
}

void mousePressed() {
  flueListe.add(new Flue(mouseX, mouseY));
}


class Flue {
  int H = 1000; 
  int W = 1000;
  int x = 0;
  int y = 0;  
  float xpos, ypos;
  float distance;
  float vinkel = 0; 
  float size=1;
  int xSpeed = 4; 
  int ySpeed = 4;


  Flue() {
    xpos  = random(0, height);
    ypos  = random(0, width);
    vinkel     = random(0, 2*PI);
  }

  Flue(float a, float b) {
    xpos = a;
    ypos = b;
    vinkel    = random(0, 2*PI);
  }

  Flue(float scale) {
    xpos  = random(0, height);
    ypos  = random(0, width);
    vinkel     = random(0, 2*PI);
    size=scale;
  }
  //Fluernes hastighed
  void flyt() {
    distance = distance + xSpeed;
  
  if ((cos(vinkel) * (distance*size)  + xpos) > width ||
      (cos(vinkel) * (distance*size)  + xpos) < 0) {
      xSpeed *= -1;
    }
     if ((sin(vinkel) * (distance*size)  + ypos) > height ||
      (sin(vinkel) * (distance*size)  + ypos) < 0) {
      xSpeed *= -1;
    }
}
  //Fluen tegnes
  void tegnFlue() {
    pushMatrix();
    translate(xpos, ypos);
    rotate(vinkel);
    translate(distance, 0);

    scale(size);

    ellipse(0, 0, 25, 13);
    ellipse(0, -8, 20, 15);
    ellipse(0, 8, 20, 15);
    ellipse(6, 0, 13, 13);
    popMatrix();
    x = x + xSpeed; 
    y = y + ySpeed; 

    if (xpos + 10 > W) { 
      xSpeed *= -1; 
      xpos = W -10;
    } //Kassens højre væg
    if (xpos - 10 < 0) { 
      xSpeed *= -1; 
      xpos = 0 + 10; //Kassens venstre væg
    }
    if (ypos + 10 > H) { 
      ySpeed *= -1; 
      ypos = H - 10;
    } //Kassens bund
    if (ypos - 10 < 0) { 
      ySpeed *= -1; 
      ypos = 0 + 10; //Kassens loft
    }
  }

}
