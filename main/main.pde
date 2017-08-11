mainChar main = new mainChar();
int difficulty = 2;
circle[] centers = new circle[8*difficulty];
boolean runGame = false;
boolean quitScreen = false;
boolean settings = false;

void setup(){
  size(1000,700);
}

void draw(){
  background(0);
  if(settings)
    setting();
  else if(quitScreen)
    quitScreen();
  else if(!runGame && !quitScreen)
    startScreen();
  else if(runGame)
    runGame();
}