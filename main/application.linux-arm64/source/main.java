import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {

mainChar main = new mainChar();
circle[] centers = new circle[15];
boolean runGame = false;
boolean quitScreen = false;

public void setup(){
  
}

public void draw(){
  background(0);
  if(quitScreen)
    quitScreen();
  if(!runGame && !quitScreen)
    startScreen();
  else if(!quitScreen)
    runGame();
}
class circle{
  float x;
  float y;
  float curSize;
  boolean isAlive;
  
  float R;
  float G;
  float B;
  
  circle(float x1, float y1, float size){
    x = x1;
    y = y1;
    curSize = size*3;
    isAlive = true;
    R = random(200);
    G = random(255);
    B = random(255);
  }
  
  public void eat(circle[] middle){
     for(int i = 0; i < middle.length; i++){
        if(isWithinCircle(this, middle[i].x, middle[i].y) && curSize > middle[i].curSize && middle[i].isAlive){
          middle[i].isAlive = false;
          curSize += middle[i].curSize/5;
        }
     }
     
     if(isWithinCircle(this, main.curX, main.curY) && curSize > main.curSize && isAlive){
       main.isAlive = false;
     }
 }
  
  public void move(){
    float speedX = random(5);
    float speedY = random(5);
    float moveNumX = 0;
    float moveNumY = 0;
    if(random(2) < 1)
      moveNumX = speedX * random(5)/7;
    else
      moveNumX = speedX * -1 * random(5)/7;
    if(random(2) < 1)
      moveNumY = speedY * random(5)/7;
    else
      moveNumY = speedY * -1 * random(5)/7;
    
    x += moveNumX;
    y += moveNumY;
    
    edgeCheck(this);
    
    fill(R,G,B);
    
    if(isAlive)
      ellipse(x, y, curSize, curSize);
      
  }
}
public boolean isWithinCircle(circle cur, float x, float y){
  float dx = cur.x - x;
  float dy = cur.y - y;
  
  float distance = sqrt(dx*dx + dy*dy);
  if(distance < cur.curSize)
    return true;
  else
    return false;
}

public boolean isWithinCircle(mainChar cur, float x, float y){
  float dx = cur.curX - x;
  float dy = cur.curY - y;
  
  float distance = sqrt(dx*dx + dy*dy);
  if(distance < cur.curSize)
    return true;
  else
    return false;
}

public void edgeCheck(circle temp){
    if(temp.x <= 0)
      temp.x = temp.curSize;
    if(temp.y <= 0)
      temp.y = temp.curSize;
    if(temp.x >= width)
      temp.x = width - temp.curSize;
    if(temp.y >= height)
      temp.y = height - temp.curSize;
      
    if(temp.y < 50 + temp.curSize && temp.x > width - 150 - temp.curSize){
      temp.y = 50 + temp.curSize;
      temp.x = width - 150 - temp.curSize;
    }
}

public boolean inRect(int x, int y, int wid, int hei){
  if(mouseX > x && mouseX < x + wid && mouseY > y && mouseY < y + hei){
     return true; 
  }
  else
    return false;
}
public void gameOver(){
  textSize(40);
  fill(255,0,0);
  text("Game Over", width/2 - 100, height/2);
  
  textSize(20);
  text("Hit r to return to homescreen", width/2-100, height / 2 + 30);
  if(key == 'r'){
    runGame = false;
  }
}

public boolean haveWon(){
  for(int i = 0; i < 15; i++){
    if(centers[i].isAlive)
      return false;
  }
  
  return true;
}

public void win(){
  textSize(30);
  fill(0,0,255);
  text("You won!", width/2-100, height/2);
  text("Hit r to return to homescreen", width/2-100, height / 2 + 30);
  if(key == 'r'){
    runGame = false;
  }
}
class mainChar{
 int curSize;
 int curX;
 int curY;
 boolean isAlive;
 int score;
 
 mainChar(){
   curSize = 30;
   curX = 30;
   curY = 30;
   isAlive = true;
   score = 0;
 }
 
 public void eat(circle[] middle){
     for(int i = 0; i < middle.length; i++){
        if(isWithinCircle(this, middle[i].x, middle[i].y) && curSize > middle[i].curSize && middle[i].isAlive){
          middle[i].isAlive = false;
          curSize += middle[i].curSize/5;
          score += middle[i].curSize;
        }
     }
 }
 
 public void move(){
   if(isAlive){
     curX = mouseX;
     curY = mouseY;
     fill(255,100,0);
     ellipse(curX, curY, curSize, curSize);
   }
 }
}
public void quitScreen(){
  background(0);
  fill(255,255,255);

  textSize(60);
  fill(255);
  text("Would you like to continue?", width/10, height/3);
  textSize(20);
  
  if(inRect(width*2/3 - 75, height/2, 200, 60)){
    fill(100);
    rect(width*2/3 - 75, height/2, 200, 60);
    fill(0);
    text("No", width*2/3 - 5, height/2 + 35);
    
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
    text("No", width*2/3 - 5, height/2 + 35);
  }
  
  if(inRect(width/3 - 100, height/2,200,60)){
    fill(100);
    rect(width/3 - 100, height/2,200,60);
    fill(0);
    text("Yes", width/3 - 30, height/2 + 35);  
    
    if(mousePressed && runGame){
       quitScreen = false;
       runGame = true;
    }
    if(mousePressed)
      quitScreen = false;
  }
  else{
    fill(255);
    rect(width/3 - 100, height/2,200,60);
    fill(0);
    text("Yes", width/3 - 30, height/2 + 35);
  }
}
public void startScreen(){
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
public void scoreBoard(){
  textSize(15);
  fill(255,255,255);
  rect(width - 150, 0, 150, 50);
  fill(0);
  text("Current size: " + main.curSize, width - 140, 20);
  text("Current score: " + main.score, width - 140, 40);
}

public void populate(){
  for(int i = 0; i <  15; i++){
    float size = random(30);
    centers[i] = new circle(random(width), random(height), size);
  }
}

public void runGame(){
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
  public void settings() {  size(1000,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
