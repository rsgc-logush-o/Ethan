// Declare and construct two objects (h1, h2) from the class HLine 
//HLine h1 = new HLine(20, 2.0); 
//HLine h2 = new HLine(50, 2.5); 
import java.util.LinkedList;
LinkedList<Ball> l = new LinkedList<Ball>();
class Ball {
  float x = random(0,700);
  float y = random(0,700);
  float dx = 4;
  float dy = 4; 
  PImage img = loadImage("ethan.png");

  void update() {
    //strokeWeight(5);
    imageMode(CENTER);
    image(img,this.x, this.y, 40, 40);
    this.x += this.dx;
    this.y += this.dy;
    if (this.x<0 ||this.x > width) {
      if(x<0)x=1;
      if(x>width)x=width;
      this.dx *= -1;
    }
    if (this.y<0 ||this.y > height) {
      if(y<0)y=1;
      if(y>height)y=height;
      this.dy *= -1;
    }
    
   for(Ball b:l){
    // b.x this.x dist
   
    if(dist(this.x, this.y, b.x, b.y) < 40 ){
    
      this.dx *= -1;
      this.dy *= -1;
      b.dx *= -1;
      b.dy *= -1;
    
     
      
    }
   }
  }
}
void setup() 
{
  size(700, 700);
 // frameRate(45);
  background(0,255,0);
 
for(int i = 0; i<10;i++)
{
  l.add( new Ball());
}
 
  
}

void draw() { 
  
 // h1.update(); 
  //h2.update(); 
 background(0,255,0); 
   for(Ball b:l)
  {
   b.update();
  }
  
  
} 

/*class HLine { 
  float ypos, speed; 
  HLine (float y, float s) {  
    ypos = y; 
    speed = s;
  } 
  void update() { 
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0;
    }
      line(0, ypos, width, ypos);
  }

} */

void keyPressed()
{
 for(Ball b:l)
 {
   if(key == 'w')
{
 b.dy = -4;
} else if(key == 's')
{
 b.dy = 4; 
} else if(key == 'a'){
  b.dx = -4;
} else if(key == 'd')
{
 b.dx = 4; 
}
 }
}