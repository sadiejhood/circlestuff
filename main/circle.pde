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
    curSize = size*2;
    isAlive = true;
    R = random(200);
    G = random(255);
    B = random(255);
  }
  
  void eat(circle[] middle){
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
  
  void move(){
    float speedX = random(6);
    float speedY = random(6);
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