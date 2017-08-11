void startScreen(){
  populate();
  main = new mainChar();
  fill(255,255,255);
  textSize(70);
  text("Circles", width / 2 - 100, height / 2 - 150);
  
  stroke(255,255,255);
  textSize(20);
  if(inRect(width * 2 / 3 , height * 2 / 3, 200, 60)){ //settings
    fill(0,0,100);
    rect(width * 2 / 3 , height * 2 / 3, 200, 60); //settings

    fill(255,255,255);
    text("Settings", width * 2 / 3 + 60, (height * 2 / 3) + 35);
  }
  else{
    fill(0,100,100);
    rect(width * 2 / 3 , height * 2 / 3, 200, 60); //settings
    
    fill(255,255,255);
    text("Settings", width * 2 / 3 + 60, (height * 2 / 3) + 35);
  }
    
  if(inRect(width / 3 + 75, height * 2 / 3, 200, 60)){ //start game
    fill(0,0,100);
    rect(width / 3 + 75, height * 2 / 3, 200, 60);
    
    fill(255,255,255);
    text("Start", width / 3 + 75 + 75, (height * 2 / 3) + 35);
    
    if(mousePressed){
       runGame = true;
    }
  }
  else{
    fill(0,100,100);
    rect(width / 3 + 75, height * 2 / 3, 200, 60);
    
    fill(255,255,255);
    text("Start", width / 3 + 75 + 75, (height * 2 / 3) + 35);
  }
  
  if(inRect(width / 3 - 200, height * 2 / 3, 200, 60)){ //
    fill(0,0,100);
    rect(width / 3 - 200, height * 2 / 3, 200, 60);
    
    fill(255,255,255);
    text("Quit", width / 3 - 125, (height * 2 / 3) + 35);
    if(mousePressed){
     quitScreen = true; 
    }
  }
  else{
    fill(0,100,100);
    rect(width / 3 - 200, height * 2 / 3, 200, 60);
    
    fill(255);
    text("Quit", width / 3 - 125, (height * 2 / 3) + 35);
  }  
}