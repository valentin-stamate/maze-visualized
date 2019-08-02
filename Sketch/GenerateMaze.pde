import java.util.List;
import java.util.ArrayList;

class GenerateMaze{

  public int sc, rows, cols;
  public List< List<Cell> > array;
  public List<Cell> stack;
  public Cell currentVisited;
  public boolean finished = false;

  GenerateMaze(List<List<Cell>> ar, int rows, int cols, int sc){

    this.sc = sc;
    this.rows = rows;
    this.cols = cols;
    this.array = ar;
    this.stack = new ArrayList<Cell>();

    for(int i = 0; i < rows; i ++){
      this.array.add( new ArrayList< Cell >() );
      for(int j = 0; j < cols; j ++){
        this.array.get(i).add( new Cell(i, j) );
      }
    }
    // 
    this.currentVisited = this.array.get(0).get(0);
    this.stack.add( this.currentVisited );
  }

  public void update(){
    
    for(Cell c : stack)
      c.show(52, 52, 206);
    
    this.currentVisited.isVisited = true;
    this.currentVisited.show(62, 229, 205);

    Cell next = getNeighbor(currentVisited);

    if(next != null){
      this.currentVisited = next;
      this.stack.add( next );
    }
    else {
      if( this.stack.isEmpty() ){
        print("Maze Generated");
        this.finished = true;
      }
      try{
        this.currentVisited = this.stack.remove( this.stack.size() - 1 );
        // A LITTLE TRICK TO SHOW A NICE STACK
        if( this.getNeighbor(this.currentVisited) != null )
          this.stack.add(this.currentVisited);

      } catch (Exception e) {}
    }

    strokeWeight(1);
    stroke(255);
    line(width - 1, 0, width - 1, height);
    line(0, height - 1, width, height - 1); 
    
  }

  public Cell getNeighbor(Cell current){
      List<Cell> neighbors = new ArrayList<Cell>();
      
      Cell top = null, left = null, bottom = null, right = null;

      // GET ALL THE POSSIBLE NEIGHBORS
      try{
        top = this.array.get( current.i - 1 ).get( current.j );
        if( !top.isVisited )
          neighbors.add( top );
      } catch (Exception e) {}

      try{
        left = this.array.get( current.i ).get( current.j - 1 );
        if( !left.isVisited )
          neighbors.add( left );
        
      } catch (Exception e) {}

      try{
        bottom = this.array.get( current.i + 1 ).get( current.j );
        if( !bottom.isVisited )
          neighbors.add( bottom );
        
      } catch (Exception e) {}

      try{
        right = this.array.get( current.i ).get( current.j + 1 );
        if( !right.isVisited )
        neighbors.add( right );
        
      } catch (Exception e) {}

      if(neighbors.size() == 0)
        return null;

      // CHOSE A RANDOM NEIGHBOR
      int x = (int)random(0, neighbors.size());
      Cell next = neighbors.get(x);
      
      // REMOVING THE WALL BETWEEN THE CURRENT AND THE NEXT CELL
      if(next == top)
        current.walls[0] = false;
      else if(next == left)
        current.walls[1] = false;
      else if(next == bottom)
        next.walls[0] = false;
      else if(next == right)
        next.walls[1] = false;

      return next;
    }
  // THIS IS MAKING THE MAZE DIRECTLY WITHOUT VISUALIZATION
  public void updateDirect(){
    
    while( !this.stack.isEmpty() ){
    
      this.currentVisited.isVisited = true;

      Cell next = getNeighbor(currentVisited);

      if(next != null){
        this.currentVisited = next;
        this.stack.add( next );
      }
      else {
        if( this.stack.isEmpty() ){
          print("Maze Generated");
          this.finished = true;
        }
        try{
          this.currentVisited = this.stack.remove( this.stack.size() - 1 );
          // A LITTLE TRICK TO SHOW A NICE STACK
          if( this.getNeighbor(this.currentVisited) != null )
            this.stack.add(this.currentVisited);

        } catch (Exception e) {}
      }
    }
  }

}
