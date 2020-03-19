public enum Dir {
  N, S, E, W
}



public class Player {
  
  private ArrayList<Tile> q;
  private Map grid;
  private Dir dir;
  
  public Player(Tile t, Dir d, Map grid) {
    this.grid = grid;
    this.dir = d;
    q = new ArrayList<Tile>();
    q.add(0, t);
    q.get(0).setType(Type.ACTIVE);
  }
  
  public void addTile(Tile t) {
    t.setType(Type.ACTIVE);
    q.add(0, t);
  }
  
  public void changeDir(Dir d) {
    this.dir = d;
  }
  
  public void update() {
    int x = q.get(0).getX(), y = q.get(0).getY();
    int dx = 0, dy = 0;
    
    switch (this.dir) {
      case N:
        dy = -1;
        break;
      case S:
        dy = 1;
        break;
      case E:
        dx = 1;
        break;
      case W:
        dx = -1;
        break;
    }
    //println(dx + " " + dy);
    
    
    //detect sides
    boolean stop = false;
    if (x + dx < 0 || x + dx >= this.grid.getXSize() || y + dy < 0 || y + dy >= this.grid.getYSize()) {
      stop = true;
    } else if (q.contains(grid.get(x + dx, y + dy))) {
      stop = true;
    } else {
      Tile newT = grid.get(x + dx, y + dy);
      if (newT.getType() == Type.RED) {
        addTile(newT);
      }
    }
    
    //move arraylist
    if (!stop) {
      q.add(0, this.grid.get(x + dx,y + dy));
      q.get(0).setType(Type.ACTIVE);
      q.get(q.size() - 1).setType(Type.NONE);
      q.remove(q.size() - 1);
    } else {
      noLoop();
    }
  }
  
  
}
