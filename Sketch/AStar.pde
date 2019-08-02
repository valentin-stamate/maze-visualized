import java.util.List;
import java.util.ArrayList;

class AStar{
  int scale = 20, rows, cols;
  List< List< Cell > > array;
  List< Cell > openList, closedList, path;
  Cell startNode, endNode, q;
  int dist = 1;
  boolean searchDone = false;
  
  AStar(List< List<Cell> > ar, int rows, int cols, int sc){
    // PART 1 & 2
    this.array = ar;
    this.openList = new ArrayList< Cell >();
    this.closedList = new ArrayList< Cell >();
    this.path = new ArrayList< Cell >();

    this.rows = rows;
    this.cols = cols;
  

    this.startNode = this.array.get( 0 ).get( 0 );
    this.endNode = this.array.get( rows - 1 ).get( cols - 1 );
    
    this.startNode.f = 0;
    this.startNode.g = 0;

    this.openList.add( this.startNode );
  }

  void update(){

    // PART 3 .
    if( !this.openList.isEmpty() ){
      
      // PART 3.a .
      this.q = this.openList.get(0);

      for(Cell c : openList){
        if( c.f < this.q.f ){
          this.q = c;
        }
      }
      // PART 3.b .
      this.openList.remove( this.q );

      // PART 3.c .
      List< Cell> successors = this.getSuccessors( this.q );
      
      // PART 3.d
      float gNew, hNew, fNew;
      for(Cell s : successors){
        // i  
        if( !this.closedList.contains( s ) ){
          
          if(s == endNode ){
            s.parent = this.q;
            println("Done!");
            this.searchDone = true;
          }
          if( !this.closedList.contains( s ) ){
            
            gNew = this.q.g + 1;// sqrt(2) if there a succesor is in the corner
            hNew = this.heuristic(s, this.endNode);
            fNew = gNew + hNew;

            if( s.f == Float.MAX_VALUE || s.f > fNew ){
              this.openList.add( s );
            
              s.f = fNew;
              s.g = gNew;
              s.h = hNew;

              s.parent = this.q;
            }  
          }
        }
      }

      this.closedList.add(q);

    } else {
      println( "Done!" );
      this.searchDone = true;
    }

  }


  public List< Cell > getSuccessors(Cell cell){
    List< Cell > s = new ArrayList< Cell >();
    // GET THE NEIGHBORS/SUCCESSORS WHEN POSSIBLE
    Cell up = null, left = null, down = null, right = null;
    try{
      up = this.array.get(cell.i - 1).get(cell.j);
    } catch (Exception e) {}
    try{
      left = this.array.get(cell.i).get(cell.j - 1);
    } catch (Exception e){}
    try{
      down = this.array.get(cell.i + 1).get(cell.j);
    } catch (Exception e) {}
    try{
      right = this.array.get(cell.i).get(cell.j + 1);
    } catch (Exception e){}

    if( up != null && !cell.walls[0] )
      s.add(up);
    if( left != null && !cell.walls[1] )
      s.add(left);
    if( down != null && !down.walls[0] )
      s.add(down);
    if( right != null && !right.walls[1] )
      s.add(right);
    
    return s;
  }

  private float heuristic(Cell a, Cell b){
    return dist( a.j, a.i, b.j, b.i );
    //return abs( a.i - b.i ) + abs( a.j - b.j );
  }

  void drawArray(){

    if( !this.searchDone ){
      for(Cell c : this.closedList)
      c.showPath(110, 50, 70);

    for(Cell c : this.openList)
      c.showPath(249, 85, 85);
    }
    // GET THE PATH AND SHOW IT
    this.path.clear();

    Cell temp = q;
    this.path.add(temp);

    while( temp.parent != null ){
      this.path.add( temp.parent );
      temp = temp.parent;
    }
    
    for(Cell c : path)
      c.showPath(43, 239, 127);

    this.endNode.show(249, 85, 85);
    this.startNode.show(62, 229, 205);
    return;
  }

  
}
