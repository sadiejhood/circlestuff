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
 
 void eat(circle[] middle){
     for(int i = 0; i < middle.length; i++){
        if(isWithinCircle(this, middle[i].x, middle[i].y) && curSize > middle[i].curSize && middle[i].isAlive){
          middle[i].isAlive = false;
          curSize += middle[i].curSize/5;
          score += middle[i].curSize;
        }
     }
 }
 
 void move(){
   if(isAlive){
     curX = mouseX;
     curY = mouseY;
     fill(255,100,0);
     ellipse(curX, curY, curSize, curSize);
   }
 }
}