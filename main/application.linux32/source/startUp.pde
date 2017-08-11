void scoreBoard(){
  textSize(15);
  fill(255,255,255);
  rect(width - 150, 0, 150, 50);
  fill(0);
  text("Current size: " + main.curSize, width - 140, 20);
  text("Current score: " + main.score, width - 140, 40);
}

void populate(){
  for(int i = 0; i <  15; i++){
    float size = random(30);
    centers[i] = new circle(random(width), random(height), size);
  }
}

void runGame(){
    if(haveWon())
    win();
  else if(main.isAlive){
    scoreBoard();
    main.eat(centers);
    main.move();
    for(int i = 0; i <  15; i++){
      centers[i].eat(centers);
      centers[i].move();
    }
  }
  else
    gameOver();  
    
  if(key == 'q'){
    quitScreen = true;
  }
}