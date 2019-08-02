import java.util.List;
import java.util.ArrayList;

class Cell{
  public int i, j;
  public boolean walls[] = {true, true};
  public boolean isVisited = false;

  public float f = Float.MAX_VALUE, g, h;
  public Cell parent;

  Cell(int i, int j){
    this.i = i;
    this.j = j;
    this.parent = null;
  }
  // SHOW A NORMAL PATH
  public void show(int r, int g, int b){
    noStroke();

    fill(r, g, b);
    rect(this.j * sc, this.i * sc, sc, sc);
    
    strokeWeight(1);
    stroke(255);

    if( this.walls[0] )
      line(j * sc, i * sc, (j + 1) * sc, i * sc);
    if( this.walls[1] )
      line(j * sc, i * sc, j * sc, (i + 1)* sc);
  }
  // SHOW THE CIRCLES
  public void showPath(int r, int g, int b){
    noStroke();
  
    fill(r, g, b);
    circle(this.j * sc + sc / 2, this.i * sc + sc / 2, 9);
  }

}
