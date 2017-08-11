mainChar main = new mainChar();
circle[] centers = new circle[20];
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
  else if(!runGame)
    startScreen();
  else
    runGame();
}