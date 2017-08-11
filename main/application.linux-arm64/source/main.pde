mainChar main = new mainChar();
circle[] centers = new circle[15];
boolean runGame = false;
boolean quitScreen = false;

void setup(){
  size(1000,700);
}

void draw(){
  background(0);
  if(quitScreen)
    quitScreen();
  if(!runGame && !quitScreen)
    startScreen();
  else if(!quitScreen)
    runGame();
}