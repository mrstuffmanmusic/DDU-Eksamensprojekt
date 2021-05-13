class Platform {

  //deklaration af variabler
  float w, h, x, y;

  String typeof;
  float halfWidth, halfHeight;

   Platform(float startX, float startY) {
    x = startX;
    y = startY;
}

  Platform(float _x, float _y, float _w, float _h, String _typeof) {
    w = _w;
    h = _h;
    x = _x;
    y = _y;
    typeof = _typeof;

    halfWidth = w/2;
    halfHeight = h/2;
  }

boolean collison (int playerX,int playerY,int playerWidth,int playerHeight ){
  
  boolean hitX = ((playerX+playerWidth<x+w && playerX+playerWidth>x));
  
  boolean hitY = ((playerY+playerWidth<y+h && playerY+playerHeight>y));
  
   return hitX && hitY;
}

  void update() {

    fill(155, 0, 255);
    rect(x, y, w, h);

    rect(x, y, w, h);
  }
}
