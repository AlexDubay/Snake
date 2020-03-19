Map grid;
Player player;
int t;


void setup() {
  size(800, 600);
  frameRate(8 );
  background(150);
  noStroke(); //<>//
  
  t = 0;
  
  grid = new Map();
  player = new Player(grid.get(width / 2 / Tile.SCALE,height / 2 / Tile.SCALE), Dir.N, grid);
}



void draw() {
  
  //place random
  if (t % 20 == 0) {
    boolean s = true;
    do {
      int x = getRandX(), y = getRandY();
      Tile t = grid.get(x, y);
      if (t.getType() == Type.NONE) {
        t.setType(Type.RED);
        s = false;
      }
    } while (s);
  }
  
  
  player.update();
  
  //show types //<>//
  for (int i = 0; i < grid.getXSize(); i++) {
    for (int j = 0; j < grid.getYSize(); j++) {
      grid.get(i, j).show();
    }
  }
  
  t++; //<>//
}



void keyPressed() {
  //println("here");
  switch (keyCode) {
    case UP:
      player.changeDir(Dir.N);
      break;
    case DOWN:
      //println("here");
      player.changeDir(Dir.S);
      break;
    case LEFT:
      player.changeDir(Dir.W);
      break;
    case RIGHT:
      player.changeDir(Dir.E);
      break;
  }
}


int getRandX() {
  return (int)random(grid.getXSize());
}


int getRandY() {
  return (int)random(grid.getYSize());
}
