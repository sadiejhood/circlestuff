void gameOver(){
  textSize(40);
  fill(255,0,0);
  text("Game Over", width/2 - 100, height/2);
  
  textSize(20);
  text("Hit r to return to homescreen", width/2-100, height / 2 + 30);
  if(key == 'r'){
    runGame = false;
    quitScreen = false;
  }
}

boolean haveWon(){
  for(int i = 0; i < 20; i++){
    if(centers[i].isAlive)
      return false;
  }
  return true;
}

void win(){
  textSize(30);
  fill(0,0,255);
  text("You won!", width/2-100, height/2);
  text("Hit r to return to homescreen", width/2-100, height / 2 + 30);
  if(key == 'r'){
    runGame = false;
    quitScreen = false;
  }
}