public enum Type {
    ACTIVE, NONE, RED
}


public class Map {
  
  private Tile[][] grid;
  
  public Map() {
    this.grid = new Tile[width / Tile.SCALE][height / Tile.SCALE];
    for (int i = 0; i < width / Tile.SCALE; i++) {
      for (int j = 0; j < height / Tile.SCALE; j++) {
        grid[i][j] = new Tile(i, j, Type.NONE);
      }
    }
  }
  
  
  
  public Tile get(int x, int y) {
    return this.grid[x][y];
  }
  
  public void setTile(int x, int y, Type t) {
    println(x + " " + y);
    this.grid[x][y].setType(t);
  }
  
  public int getXSize() {
    return grid.length;
  }
  
  public int getYSize() {
    return grid[0].length;
  }
  
}
