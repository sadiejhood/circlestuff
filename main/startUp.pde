void scoreBoard(){
  textSize(15);
  fill(255,255,255);
  rect(width - 150, 0, 150, 50);
  fill(0);
  text("Current size: " + main.curSize, width - 140, 20);
  text("Current score: " + main.score, width - 140, 40);
}

void populate(){
  for(int i = 0; i <  16; i++){
    float size = random(main.curSize);
    centers[i] = new circle(random(width), random(height), size);
  }
  for(int i = 16; i < centers.length; i++){
    float size = random(main.curSize + 20);
    centers[i] = new circle(random(width), random(height), size);
  }
}

void runGame(){
  if(haveWon()){
    runGame = true;
    win();
  }
  else if(main.isAlive){
    scoreBoard();
    main.eat(centers);
    main.move();
    for(int i = 0; i < centers.length; i++){
      centers[i].eat(centers);
      centers[i].move();
    }
  }
  else{
    runGame = true;
    gameOver();    
  }
    
  if(key == 'q'){
    quitScreen = true;
  }
}