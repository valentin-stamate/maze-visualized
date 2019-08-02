import java.util.List;
import java.util.ArrayList;

GenerateMaze gm;
AStar aStar;
List< List<Cell> > array;
int sc = 20, rows, cols;

// INITIAL SETUP
void setup(){
  size(600, 600);
  frameRate(30);
  background(15);

  rows = height / sc;
  cols = width / sc;

  array = new ArrayList< List<Cell> >();
  
  gm = new GenerateMaze(array, rows, cols, sc);
  aStar = new AStar(array, rows, cols, sc);

  //gm.updateDirect();// TO GENERATE THE MAZE DIRECTLY
}

void draw(){
  showArray();
  if( !gm.finished )
    gm.update();
  else if( !aStar.searchDone ){
    aStar.update();
    aStar.drawArray();
  } else {
    aStar.drawArray();
  }
}

void showArray(){
  for(int i = 0; i < this.rows; i++){
    for(int j = 0; j < this.cols; j ++){
      this.array.get(i).get(j).show(20, 20, 20);
    }
  }
}
