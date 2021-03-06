import ddf.minim.*;
Minim minim;
static final int FADE = 2500;
AudioPlayer song;

Platform P1 = new Platform(150, 250, 200, 20, "P1");
Platform P2 = new Platform(550, 230, 200, 20, "P2");


PImage background;
PImage player;
PImage Enemy1;
PImage Enemy2;
PImage Enemy3;
PImage Restart;
PShape StartAgain;
int playerX; //Spiller
int playerY; //Spiller
int enemyX = 1000; //Enemy
int enemy2X = 1350; //Enemy 2
int enemy3X = 1700; //Enemy 3
int enemyY;
int enemy2Y;
int enemy3Y;
int flying;
int playerWidth = 100;
int playerHeight = 146;
boolean up = false;
boolean right = false;
boolean left = false;
boolean start = false;
boolean space = false;
boolean outside = false;
boolean p = false;

void setup() {
  minim = new Minim(this);
  song = minim.loadFile("Walk Through Music Desert.mp3");
  song.shiftGain(song.getGain(), -10, FADE);
  StartAgain = createShape(RECT, 0, 0, 400, 90);
  size(1000, 570);
  background = loadImage("Background.png");
  player = loadImage("Stephen Curry Player.png");
  Enemy1 = loadImage("Enemy 1.png");
  Enemy2 = loadImage ("Enemy 2.png");
  Enemy3 = loadImage ("Enemy 3.png");
  Restart = loadImage ("Restart.png");
  frameRate(50);
}

void draw() {
  //Boundaries

  if (playerX<0) {
    playerX=5;
  }

  if (playerY<0) {
    playerY = 0;
  }

  image(background, 0, 0);
  song.play();
  //Sun
  fill(249, 215, 28);
  circle(60, 60, 90);
  noStroke();
  fill(0, 0, 250);

  //  println(playerX, playerY);

  //Platform
  P1.update();
  P2.update();

  //Restart Icon
  image(Restart, 920, 20);

  // Enemy1
  image(Enemy1, enemyX, 360);
  if (enemyX < -50) {
    enemyX=1050;
  }
  enemyX=enemyX-7; //Enemy 1 Speed

  //Enemy2
  image(Enemy2, enemy2X, 160);
  if (enemy2X < -50) {
    enemy2X=1050;
  }
  enemy2X=enemy2X-5;  //Enemy 2 Speed

  //Enemy3
  image(Enemy3, enemy3X, 330);
  if (enemy3X < -50) {
    enemy3X=1050;
  }
  enemy3X=enemy3X-10;


  //Player
  image(player, playerX, playerY);
  if (left) {
    playerX -= 10;
  }
  if (right) {
    playerX += 10;
  }

  if (up && flying < 30) {
    playerY=playerY-18;
  }
  if (playerY<300) { 

    //Jumping
    playerY=playerY+10;
  } else {
    flying = 0;
  }

  if (playerY<300) {
    flying ++;
  }

  //Land on platform 1

  if (P1.collison(playerX, playerY, playerWidth, playerHeight)) {
    playerY = 120;
    println("Platform 1 hit");
  }
  // Land on platform 2  
  if (P2.collison(playerX, playerY, playerWidth, playerHeight)) {
    playerY = 97;
    println("Platform 2 hit");
  }

  //Enemy 1 Hit

  if (abs(playerY - enemyY - 300) < 50 && abs(playerX - enemyX) < 50) {
    loop();
    println("enemy 1 hit");
    playerY = playerY + 500;
    textSize(135);
    fill(255, 255, 255);
    text("GAME", 110, 300);
    textSize(135);
    text("OVER", 520, 300);
    textSize(130);
    fill(255, 0, 0);
    text("GAME OVER", 120, 300);
    StartAgain.setFill(color(47, 86, 233));
    shape(StartAgain, 300, 400);
    fill(255, 255, 255);
    textSize(35);
    text("Click or Press Space", 335, 440);
    textSize(30);
    text("To Try Again", 400, 480);
    noLoop();
  }

  //Enemy 2 Hit
  if (abs(playerY - enemy2Y - 160) < 50 && abs(playerX - enemy2X) < 50) {
    loop();
    println("enemy 2 hit");
    playerY= playerY + 500;
    textSize(135);
    fill(255, 255, 255);
    text("GAME", 110, 300);
    textSize(135);
    text("OVER", 520, 300);
    textSize(130);
    fill(255, 0, 0);
    text("GAME OVER", 120, 300);
    StartAgain.setFill(color(47, 86, 233));
    shape(StartAgain, 300, 400);
    fill(255, 255, 255);
    textSize(35);
    text("Click or Press Space", 335, 440);
    textSize(30);
    text("To Try Again", 400, 480);
    noLoop();
  }

  //Enemy 3 Hit
  if (abs(playerY - enemy3Y - 300) < 50 && abs(playerX - enemy3X) < 50) {
    loop();
    println("enemy 3 hit");
    playerY= playerY + 500;
    textSize(135);
    fill(255, 255, 255);
    text("GAME", 110, 300);
    textSize(135);
    text("OVER", 520, 300);
    textSize(130);
    fill(255, 0, 0);
    text("GAME OVER", 120, 300);
    StartAgain.setFill(color(47, 86, 233));
    shape(StartAgain, 300, 400);
    fill(255, 255, 255);
    textSize(35);
    text("Click or Press Space", 335, 440);
    textSize(30);
    text("To Try Again", 400, 480);
    noLoop();
  }

  if (playerX>950) {
    textSize(240);
    fill(255, 255, 255);
    text("YOU", 5, 370);
    text("WIN", 555, 370);
    textSize(230);
    fill(255, 0, 0);
    text("YOU WIN", 10, 370);
    //  playerX = 900;
    noLoop();
  }
}

void keyPressed() {

  //RIGHT
  if (keyCode == RIGHT || key == 'd') 
  {

    right=true;
  }
  //LEFT
  if (keyCode == LEFT || key == 'a') {

    left=true;
  }

  //UP
  if (playerY>=300) {

    if (keyCode == UP || key == 'w') {

      up=true;
    }
  }

  if (key == ' ') {

    loop();
    playerX = 0;
    playerY = 300;
    enemyX = 1000;
    enemy2X = 1350;
    enemy3X = 1700;
    println("Space Try Again Clicked");
    space=true;
  }

  /*

   if (key == 'p') {
   noLoop();
   textSize(140);
   fill(155, 255, 255);
   text("PAUSED", 220, 300);
   textSize(40);
   fill(255, 255, 255);
   text("Press Controls To Continue", 220, 350);
   } else { 
   loop();
   
   p = false;
   }
   */
}

void keyReleased() {
  //UP
  if (keyCode == UP || key == 'w') {
    up = false;
  }
  //RIGHT

  if (keyCode == RIGHT || key == 'd') {
    right = false;
  }


  if (keyCode == LEFT || key == 'a') {
    left = false;
  }

  if (key == ' ') {
    space = false;
  }
}

void mouseClicked() {
  //println("x="+mouseX + " y=" + mouseY);
  if (mouseX>340 && mouseX<615 && mouseY>390 && mouseY<490) {
    //   start = !start;
    if (start) {
      noLoop();
    } else {
      loop();
      playerX = 0;
      playerY = 300;
      enemyX = 1000;
      enemy2X = 1350;
      enemy3X = 1700;
      println("Try Again Clicked");
    }
  }

  if (mouseX>915 && mouseX<995 && mouseY>20 && mouseY<85) {
    //   start = !start;
    if (start) {
      noLoop();
    } else {
      loop();
      playerX = 0;
      playerY = 300;
      enemyX = 1000;
      enemy2X = 1350;
      enemy3X = 1700;
      println("Restart Clicked");
    }
  }
}
