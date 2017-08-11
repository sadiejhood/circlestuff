boolean isWithinCircle(circle cur, float x, float y){
  float dx = cur.x - x;
  float dy = cur.y - y;
  
  float distance = sqrt(dx*dx + dy*dy);
  if(distance < cur.curSize)
    return true;
  else
    return false;
}

boolean isWithinCircle(mainChar cur, float x, float y){
  float dx = cur.curX - x;
  float dy = cur.curY - y;
  
  float distance = sqrt(dx*dx + dy*dy);
  if(distance < cur.curSize)
    return true;
  else
    return false;
}

void edgeCheck(circle temp){
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

boolean inRect(int x, int y, int wid, int hei){
  if(mouseX > x && mouseX < x + wid && mouseY > y && mouseY < y + hei){
     return true; 
  }
  else
    return false;
}