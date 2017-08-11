void setting(){
 background(0);

  textSize(50);
  fill(255);
  text("Would you like to increase difficulty?", width/15, height/3);
  textSize(30);
  //text("Current difficulty: " + 20, width/3, height/3 + 40);
  textSize(20);
  
  if(inRect(width*2/3 - 75, height/2, 200, 60)){
    fill(100);
    rect(width*2/3 - 75, height/2, 200, 60);
    fill(0);
    text("Lower", width*2/3 - 5, height/2 + 35);
    
    if(mousePressed){
     // if(difficulty >= 0)
         //difficulty-=.1; 
    }
  }
  else{
    fill(255);
    rect(width*2/3 - 75, height/2, 200, 60);
    fill(0);
    text("Lower", width*2/3 - 5, height/2 + 35);
  }
  
  if(inRect(width/3 - 100, height/2,200,60)){
    fill(100);
    rect(width/3 - 100, height/2,200,60);
    fill(0);
    text("Higher", width/3 - 30, height/2 + 35);  

    if(mousePressed){
      //if(difficulty <= 10){
        //difficulty+=1; 
     // }
    }
  }
  else{
    fill(255);
    rect(width/3 - 100, height/2,200,60);
    fill(0);
    text("Higher", width/3 - 30, height/2 + 35);
  }
  
  if(inRect(width/2 - 100, height/2 + 100,200,60)){
    fill(100);
    rect(width/2 - 100, height/2 + 100,200,60);
    fill(0);
    text("No", width/2 - 30, height/2 + 35);  

    if(mousePressed){
      settings = false;
      runGame = false;
      
    }
  }
  else{
    fill(255);
    rect(width/2 - 100, height/2 + 100,200,60);
    fill(0);
    text("No", width/2 - 30, height/2 + 135);
  }
}