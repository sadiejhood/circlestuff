void quitScreen(){
  background(0);
  fill(255,255,255);

  textSize(60);
  fill(255);
  text("Would you like to quit?", width/10, height/3);
  textSize(20);
  
  if(inRect(width*2/3 - 75, height/2, 200, 60)){
    fill(100);
    rect(width*2/3 - 75, height/2, 200, 60);
    fill(0);
    text("Yes", width*2/3 - 5, height/2 + 35);
    
    if(mousePressed && !runGame){
       exit(); 
    }
    else if(mousePressed){
      quitScreen = false;
      runGame = false;
    }
  }
  else{
    fill(255);
    rect(width*2/3 - 75, height/2, 200, 60);
    fill(0);
    text("Yes", width*2/3 - 5, height/2 + 35);
  }
  
  if(inRect(width/3 - 100, height/2,200,60)){
    fill(100);
    rect(width/3 - 100, height/2,200,60);
    fill(0);
    text("No", width/3 - 30, height/2 + 35);  
    
    if(mousePressed && runGame){
       quitScreen = false;
       runGame = true;
    }
    if(mousePressed){
      quitScreen = false;
    }
  }
  else{
    fill(255);
    rect(width/3 - 100, height/2,200,60);
    fill(0);
    text("No", width/3 - 30, height/2 + 35);
  }
}