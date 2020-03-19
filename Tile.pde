public class Tile {
  
  
  private int x,y;
  private Type type;
  
  public static final int SCALE = 20;
  
  
  public Tile(int x, int y, Type t) {
    this.x = x;
    this.y = y;
    this.type = t;
  }
  
  public int getX() {
    return this.x;
  }
  
  
  public int getY() {
    return this.y;
  }
  
  public Type getType() {
    return this.type;
  }
  
  public void setType(Type t) {
    this.type = t;
  }
  
  
  public void show() {
    
    switch (this.type) {
      case ACTIVE:
        fill(0, 255, 0);
        break;
      case NONE:
        fill(0);
        break;
      case RED:
        fill(255, 0, 0);
        break;
    }
    
    rectMode(CORNERS);
    rect(this.x * SCALE, this.y * SCALE, this.x * SCALE + SCALE - 2, this.y * SCALE + SCALE - 2);
  }
  
  
}
